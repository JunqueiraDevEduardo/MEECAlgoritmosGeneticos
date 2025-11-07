
# APP-Matlab-Algoritmos-Genéticos
Resolução de uma aplicação em Matlab recorrendo ao uso da ToolBox de Optimização que corresponda aos seguintes exercícios:
1️⃣ Exercício nº1 --> João Azevedo já fez
1 Determinação do mínimo e do máximo da função seno
Recorrendo à Toolbox de Otimização do MATLAB determine o mínimo e o máximo da função seno
no intervalo [0, 2π]. Para tal, deverá criar dois ficheiros-M, um chamado "seno.m"correspondente
à função fitness e outro chamado "gaseno.m"correspondente ao programa principal. O programa a
elaborar deverá apresentar os seguintes gráficos:

a) A evolução da média e do melhor valor da função fitness para cada geração;

b) Os melhores indivíduos para cada variável e para cada geração;

c) Avaliação do critério de paragem em função do número de gerações;

d) A função seno no intervalo [0, 2π] com a indicação do ponto correspondente ao seu mínimo;

e) A função seno no intervalo [0, 2π] com indicação do ponto correspondente ao seu máximo.

Nota: Recorra à função optimoptions para elaborar os gráficos das alíneas a), b) e c).
####################################################################################################################################################################################

2️⃣ Exercício nº2 Despacho de uma rede elétrica ->Eduardo Junqueira está a fazer
2.1 Exercícios

a) Determine, recorrendo à Toolbox de Otimização do MATLAB, o despacho económico sem perdas
da rede da Figura 4 e compare os resultados com os obtidos recorrendo aos multiplicadores de
Lagrange. ->Eduardo Junqueira está a fazer

b) Determine o despacho, tal como determinou no exercício anterior, admitindo que a potência
máxima do Gerador 1 da Figura 4 é igual a 0,5 p.u..

c) Desenvolva um algoritmo genético em MATLAB que permita resolver os exercícios anteriores.
Compare os resultados obtidos com os da Toolbox de Otimização do MATLAB.

d) Crie uma APP em MATLAB que permite implementar graficamente as alíneas a), b) e c).

####################################################################################################################################################################################
####################################################################################################################################################################################
####################################################################################################################################################################################
####################################################################################################################################################################################
####################################################################################################################################################################################
####################################################################################################################################################################################

# Colónia de Formigas Trabalho de Pesquisa
1️⃣ Introdução --> Fazemos todos

Contextualiza o problema da otimização (o que é, para que serve, exemplos gerais).

Menciona que existem vários métodos inspirados na natureza (metaheurísticas), como Algoritmos Genéticos, Enxame de Partículas e Colônia de Formigas.

Apresenta o objetivo do relatório: explicar o método da colônia de formigas e sua aplicação em otimização.

Exemplo de frase:

A Otimização visa encontrar a melhor solução entre várias alternativas possíveis. Entre as abordagens modernas, destacam-se as metaheurísticas inspiradas em fenômenos naturais, como o método da Colônia de Formigas, que se baseia no comportamento coletivo observado em formigas reais.
####################################################################################################################################################################################

2️⃣ Inspiração Biológica: o comportamento das formigas ->João Azevedo

Explica o comportamento natural das formigas na procura de alimento:

deixam feromônios no caminho;

seguem trilhas mais marcadas;

formam rotas ótimas através da cooperação indireta.

Podes até incluir um pequeno esquema ou figura que mostre o processo.

Termina essa secção com a ideia:

Este comportamento serviu de inspiração para um algoritmo de otimização conhecido como Ant Colony Optimization (ACO).
####################################################################################################################################################################################

3️⃣ Princípios do Método da Colônia de Formigas (ACO) -->Rodrigo Martins

Aqui começas a fazer a ponte entre a natureza e o algoritmo.

Explica como o comportamento das formigas é modelado computacionalmente:

As “formigas artificiais” são agentes que constroem soluções;

O feromônio representa a qualidade das soluções anteriores;

Há probabilidade de escolha influenciada pelo feromônio e por heurísticas (por exemplo, distância no problema do caixeiro-viajante);

As melhores soluções reforçam o feromônio — aprendizado coletivo.

Podes introduzir aqui as principais fórmulas (ex: probabilidade de escolha e atualização de feromônio).
####################################################################################################################################################################################

4️⃣ Etapas do Algoritmo ACO -->Eduardo Junqueira

Descreve o funcionamento passo a passo:

Inicialização dos parâmetros e do feromônio;

Construção de soluções pelas formigas;

Avaliação das soluções;

Atualização dos feromônios;

Critério de paragem.

Podes apresentar um pequeno pseudocódigo ou fluxograma.
####################################################################################################################################################################################

5️⃣ Aplicações em Otimização--> Fazemos todos

Mostra como o método é usado em problemas reais:

Problema do Caixeiro-Viajante (TSP);

Roteamento de veículos;

Planeamento de produção;

Otimização de redes, etc.

Se quiseres, comenta vantagens e desvantagens:

👍 Adaptativo, distribuído, robusto;

👎 Pode convergir lentamente, depende dos parâmetros.
####################################################################################################################################################################################

6️⃣ Extensões e combinações--> Fazemos todos

Menciona brevemente como o ACO pode ser hibridizado com outros métodos, como Algoritmos Genéticos ou Busca Local, para melhorar desempenho.

Mostra que é uma área em constante evolução.
####################################################################################################################################################################################

7️⃣ Conclusão --> Fazemos todos

Resume os pontos principais:

O método nasceu da observação da natureza;

Mostra como o comportamento simples de agentes pode resolver problemas complexos;

Destaca sua importância e aplicações.

####################################################################################################################################################################################
####################################################################################################################################################################################
####################################################################################################################################################################################
####################################################################################################################################################################################
####################################################################################################################################################################################
####################################################################################################################################################################################
