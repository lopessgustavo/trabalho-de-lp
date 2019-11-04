# Trabalho de Linguagens de Programação - 2019.2
## Definição:
- Implementar um programa em uma linguagem de programação funcional que receba como entrada um frame PDL (i.e. um grafo com arestas rotuladas) F = hW, Rαi tal que W é um conjunto de mundos (vértices) e Rα é uma relação binária indexada (arestas rotuladas) e um programa PDL π. A saída deve ser o resultado da verificação de se F corresponde a um frame válido para π, isto é, se F é um grafo induzido por π. Caso a resposta seja negativa, uma mensagem de erro deve explicitar o ponto de incompatibilidade.

## Implementação: 
-  O programa deve ser feito em alguma linguagem de programação funcional como Haskel, Racket ou Scheme, fazendo uso apenas de instruções típicas de linguagens funcionais. Mesmo que a linguagem dê suporte a instruções de paradigma imperativo e/ou outros paradigmas, essas não poderão ser utilizadas. Demais linguagens de programação devem ser consultadas previamente. Demais ferramentas devem ser consultadas previamente.

## Instruções: 
- Para executar o código, é preciso a instalação do [Haskell Platform](https://www.haskell.org/platform/). Em seguida é preciso abrir o terminal na pasta em que está o código e executar o comando `$ ghci main.hs`. Uma vez carregado, basta chamar a função percorrerPrograma passando uma string de um programa PDL préfixado, um grafo na forma de lista de arestas e custo e o nó de origem (exemplos são dados no código). A função retornará "True" se for um programa válido para o grafo e "False", caso contrário.
