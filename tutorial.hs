programa = ";b;c;a"

--Grafo de exemplo 
grafo = [(1,2,'a'),(1,3,'b'),(3,4,'c'),(3,5,'a'),(3,6,'b')]

--Retorna as arestas de um nó do grafo
getArestas grafo noOrigem = [(a,b,c) | (a,b,c)<-grafo, a==noOrigem]

getDestino nosDestino = [x | (_,x,_)<-nosDestino]
--Retorna se é possível fazer a transicao dado o programa a executar
transicaoPossivel arestas exec
    | [ 1 | (a,b,c)<-arestas, c== exec] /= [] = True
    | otherwise = False

percorrerPrograma programa grafo noOrigem = 
 do
   if head programa == ';'
      then do
              let subprograma = head (tail programa)
              let vizinhos = getArestas grafo noOrigem
              if transicaoPossivel vizinhos subprograma
                then do
                       print vizinhos
                       let proximoNo = getDestino vizinhos
                       let continuacao = drop 2 programa
                       print continuacao
                      --  let resposta = percorrerPrograma (take 1 proximoNo)
                else print "XABLAU"
        else print "False"