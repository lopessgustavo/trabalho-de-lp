programa = ";b;c"

--Grafo de exemplo 
grafo = [(1,2,'a'),(1,3,'b'),(3,4,'c'),(3,5,'a'),(3,6,'b')]

--Retorna as arestas de um nó do grafo
getArestas grafo noOrigem = [(a,b,c) | (a,b,c)<-grafo, a==noOrigem]

getDestino nosDestino programa = [b | (a,b,c)<-nosDestino, c == programa]
--Retorna se é possível fazer a transicao dado o programa a executar
transicaoPossivel arestas exec
    | [ 1 | (a,b,c)<-arestas, c== exec] /= [] = True
    | otherwise = False

percorrerPrograma [] grafo noOrigem = print "True"
percorrerPrograma programa grafo noOrigem = 
 do
   if head programa == ';'
      then do
              let subprograma = head (tail programa)
              let vizinhos = getArestas grafo noOrigem
              if transicaoPossivel vizinhos subprograma
                then do
                       let proximoNo = getDestino vizinhos
                       let continuacao = drop 2 programa
                       let destinos = getDestino vizinhos subprograma
                       print continuacao
                       percorrerPrograma continuacao grafo (head destinos)
                else print "XABLAU"
        else print "False"
