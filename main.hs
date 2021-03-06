-- exemplos de programas
programa = ";b;U(;aU(b,e),c)e"
prog1 = "*(b*(b)a)e"
prog= ";b;U(c,;U(a,c)b)" 

-- exemplo de grafo -> cada tupla é composta por um nó origem, um nó destino e o valor da aresta, que é um char
grafo = [(1,2,'a'),(1,3,'b'),(3,4,'c'),(3,5,'a'),(5,6,'b'),(5,7,'e')]
grafo2 = [(1,2,'a'),(2,10,'j'),(2,11,'j'),(10,12,'k'),(11,14,'z'),(1,3,'b'),(3,4,'c'),(3,5,'a'),(5,6,'b'),(5,7,'e')]

-- Funcao que verifica as possibilidades repetindo o subprograma dentro do *()
-- Essa funçao replica o que esta dentro do parenteses e concatena com o que vem depois e chama a funçao principal
bruteforce subprog resto grafo noOrigem vezes =
  if vezes < length grafo
     then let repeticao = concat (replicate vezes subprog)
              resp = percorrerPrograma (repeticao++resto) grafo noOrigem
          in if resp == 0 then resp
                else bruteforce subprog resto grafo noOrigem (vezes+1)
      else noOrigem

-- Retorna o subprograma entre parenteses ex: U(a,b)bcd->U(a,b)
separarSubPrograma flag programa = 
  if (head programa) == ')' && ((flag-1) == 0)
    then let resp = [head programa] in resp 
    
    else if (head programa) == '('
      then (head programa):separarSubPrograma (flag+1) (tail programa)   
    
    else if (head programa) == ')'
      then (head programa):separarSubPrograma (flag-1) (tail programa) 
    
    else (head programa):separarSubPrograma flag (tail programa)

-- Retorna a primeira parte da uniao ex: U(a,b) -> a
separarUniao flag programa = 
  if (head programa) == ',' && (flag == 0)
    then let resp = [] in resp
    else if (head programa) == '('
      then (head programa):separarUniao (flag+1) (tail programa)
    else if (head programa) == ')'
      then (head programa):separarUniao (flag-1) (tail programa)
    else
      (head programa):separarUniao flag (tail programa)    

--Retorna as arestas de um nó do grafo
getArestas grafo noOrigem = [(a,b,c) | (a,b,c)<-grafo, a==noOrigem]

-- retorna os destinos de um nó após a execução de um programa
getDestino vizinhos programa = [b | (a,b,c)<-vizinhos, c == programa]

--Retorna se é possível fazer a transicao dado o programa a executar
transicaoPossivel arestas exec
    | [ 1 | (a,b,c)<-arestas, c== exec] /= [] = True
    | otherwise = False

-- funcao que percorre o grafo
percorrerPrograma [] grafo noOrigem = 0
percorrerPrograma programa grafo noOrigem = 
  if head programa == ';'
    then percorrerPrograma (tail programa) grafo noOrigem
    else if head programa == 'U'
            then let subprograma = (separarSubPrograma 0 (tail programa))
                     subprograma1 = separarUniao 0 (drop 1 (init subprograma))
                     subprograma2 = reverse (separarUniao 0 (reverse (drop 1 (init subprograma))))
                     restoDoPrograma = drop (length subprograma+1) programa
                     resultado1 = percorrerPrograma (';':subprograma1++restoDoPrograma) grafo noOrigem
                     resultado2 = percorrerPrograma (';':subprograma2++restoDoPrograma) grafo noOrigem
                  in if resultado1 == 0 || resultado2 == 0 
                      then 0
                    else if resultado1 /= 0
                        then resultado1
                    else resultado2 
    else if head programa == '*'
            then let subprograma = separarSubPrograma 0 (tail programa)
                     restoDoPrograma = drop (length subprograma+1) programa
                  in bruteforce (drop 1 (init subprograma)) restoDoPrograma grafo noOrigem 0
    else let subprograma = head programa
             vizinhos = getArestas grafo noOrigem
           in if (transicaoPossivel vizinhos subprograma)
                then let proximoNo = getDestino vizinhos
                         continuacao = drop 1 programa
                         destinos = getDestino vizinhos subprograma  
                      in percorrerPrograma continuacao grafo (head destinos)
                else noOrigem
