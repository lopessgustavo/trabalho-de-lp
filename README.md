# Trabalho de Linguagens de Programação - 2019.2
## Definição:
- Implementar um programa em uma linguagem de programação funcional que receba como entrada um frame PDL (i.e. um grafo com arestas rotuladas) F = hW, Rαi tal que W é um conjunto de mundos (vértices) e Rα é uma relação binária indexada (arestas rotuladas) e um programa PDL π. A saída deve ser o resultado da verificação de se F corresponde a um frame válido para π, isto é, se F é um grafo induzido por π. Caso a resposta seja negativa, uma mensagem de erro deve explicitar o ponto de incompatibilidade.

## Implementação: 
-  O programa deve ser feito em alguma linguagem de programação funcional como Haskel, Racket ou Scheme, fazendo uso apenas de instruções típicas de linguagens funcionais. Mesmo que a linguagem dê suporte a instruções de paradigma imperativo e/ou outros paradigmas, essas não poderão ser utilizadas. Demais linguagens de programação devem ser consultadas previamente. Demais ferramentas devem ser consultadas previamente.

## Instruções: 
- Para executar o código, é preciso a instalação do [Haskell Platform](https://www.haskell.org/platform/). Em seguida é preciso abrir o terminal na pasta em que está o código e executar o comando `$ ghci main.hs`. Uma vez carregado, basta chamar a função percorrerPrograma passando uma string de um programa PDL préfixado, um grafo na forma de lista de arestas e custo e o nó de origem (exemplos são dados no código). A função retornará 0 se for um programa válido para o grafo e o número do nó em que falhou, caso contrário. 
- Para inserir um novo grafo é preciso criar uma nova variável que seja uma lista de adjacencias no formato (nó origem, nó destino, programa a ser executado), sendo ambos os nós do tipo Int e o programa deve ser um Char. Esse grafo deve ser inserido na execução do programa no ghci.
	Ex: `novo_grafo = [(1,2,'a'), (1,3,'b'), (1,4,'c'), (2,5,'d'), (3,7,'a')]`
- O programa deve ser escrito na forma prefixiada. Entretanto, as execuções são caracteres.
	 - Sequencia: o ";" é opcional uma vez que as execuçoes sao caracteres.
	 	Ex: `abc` ou `;a;bc`
	- Uniao: 
		Ex: `U(a,b)`
	- Iteracao :
		Ex: `*(b)`
- Para verificar se é um programa válido, é necessário chamar a funçao percorrerPrograma `percorrerPrograma programa grafo noOrigem`.
	 - Onde programa é um programa PDL, grafo é um grafo no formato descrito acima e noOrigem é o nó de onde começa a execuçao (geralmente 1).
