import Debug.Trace
import Data.Strings

programa = ";bU(c,;ab)"
-- programa = ";aU(b,c)
--Grafo de exemplo 
grafo = [(1,2,'a'),(1,3,'b'),(3,4,'c'),(3,5,'a'),(5,6,'b')]



--Retorna as arestas de um nó do grafo
getArestas grafo noOrigem = [(a,b,c) | (a,b,c)<-grafo, a==noOrigem]

getDestino nosDestino programa = [b | (a,b,c)<-nosDestino, c == programa]
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
                     subprogramas = strSplit "," subprograma
                  in (percorrerPrograma (fst subprogramas) grafo noOrigem) && ((percorrerPrograma (snd subprogramas) grafo noOrigem)) 
    else let subprograma = head programa
             vizinhos = getArestas grafo noOrigem
           in transicaoPossivel vizinhos subprograma
