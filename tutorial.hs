programa = ";bU(U(a,c),;aU(b,e))"
-- programa = ";aU(b,c)
--Grafo de exemplo 
grafo = [(1,2,'a'),(1,3,'b'),(3,4,'c'),(3,5,'a'),(5,6,'b'),(5,7,'e')]

separarUniao::Int->[Char]->[Char]
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


getDestino vizinhos programa = [b | (a,b,c)<-vizinhos, c == programa]

--Retorna se é possível fazer a transicao dado o programa a executar
transicaoPossivel arestas exec
    | [ 1 | (a,b,c)<-arestas, c== exec] /= [] = True
    | otherwise = False


percorrerPrograma [] grafo noOrigem = let resp = True in resp
percorrerPrograma programa grafo noOrigem = 
  if head programa == ';'
    then let subprograma = head (tail programa)
             vizinhos = getArestas grafo noOrigem
          in if transicaoPossivel vizinhos subprograma
                then let proximoNo = getDestino vizinhos
                         continuacao = drop 2 programa
                         destinos = getDestino vizinhos subprograma  
                      in percorrerPrograma continuacao grafo (head destinos)  
                else let resp = False in resp
    else if head programa == 'U'
            then let subprograma = take (length (programa) -3) (drop 2 programa)
                     subprograma1 = separarUniao 0 subprograma
                     subprograma2 = reverse (separarUniao 0 (reverse subprograma))
                  in (percorrerPrograma subprograma1 grafo noOrigem) && ((percorrerPrograma subprograma2 grafo noOrigem)) 
    else let subprograma = head programa
             vizinhos = getArestas grafo noOrigem
           in transicaoPossivel vizinhos subprograma
