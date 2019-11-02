programa = ";b;c;a"

--Grafo de exemplo 
grafo = [(1,2,'a'),(1,3,'b'),(3,4,'c'),(3,5,'a'),(3,6,'b')]

--Retorna as arestas de um nó do grafo
getArestas grafo noOrigem = [(a,b,c) | (a,b,c)<-grafo, a==noOrigem]

getDestino nosDestino programa = [b | (a,b,c)<-nosDestino, c == programa]
--Retorna se é possível fazer a transicao dado o programa a executar
transicaoPossivel arestas exec
    | [ 1 | (a,b,c)<-arestas, c== exec] /= [] = True
    | otherwise = False

-- percorrerPrograma [] grafo noOrigem = print "True"
-- percorrerPrograma :: String->[(Int,Int,Char)]->Int->:t Bool 
percorrerPrograma programa grafo noOrigem = 
  if head programa == ';'
    then let subprograma = head (tail programa)
             vizinhos = getArestas grafo noOrigem
             if 2 == 2
                then resp = False
          in resp
    else let resp = False in resp