:- dynamic cliente/4. % Definindo o predicado dinâmico cliente/4

% Predicado principal para ler os dados do arquivo e armazenar na base de conhecimento
calculo :-
    open('C:\Prolog\questão 6.txt', read, Arquivo), % Abrindo o arquivo para leitura
    ler_clientes(Arquivo), % Chamando o predicado auxiliar para ler os clientes
    close(Arquivo). % Fechando o arquivo após a leitura

%Caso Base: Finaliza quando não há mais clientes para ler
ler_clientes(Arquivo) :-
    \+ at_end_of_stream(Arquivo), % Verifica se ainda não chegou ao final do arquivo
    !,
    ler_cliente(Arquivo),
    ler_clientes(Arquivo).

ler_clientes(_). % Caso base, finaliza a leitura do arquivo

% Predicado para ler um cliente do arquivo
ler_cliente(Arquivo) :-
    read(Arquivo, Cliente), % Lendo o próximo termo do arquivo
    assert(Cliente). % Adicionando o termo lido à base de conhecimento

% Predicado para gerar uma linha do relatório para um cliente
gerar_relatorio(cliente(Nome, Idade, Salario, NroDependentes)) :-
    write(Nome), write_spaces(Nome, 20), % Nome (completa até 20 caracteres)
    write(Idade), write_spaces(Idade, 10), % Idade (completa até 10 caracteres)
    write(Salario), write_spaces(Salario, 10), % Salario (completa até 10 caracteres)
    write(NroDependentes), % Número de Dependentes
    nl. % Nova linha

% Predicado para escrever espaços em branco após um termo
write_spaces(Termo, N) :-
    atom_length(Termo, L), % Obtém o comprimento do termo
    Espacos is N - L, % Calcula o número de espaços necessários
    write_spaces_aux(Espacos). % Escreve os espaços

write_spaces_aux(0). % Caso base, não escreve mais espaços
write_spaces_aux(N) :-
    write(' '), % Escreve um espaço
    N1 is N - 1, % Reduz o contador de espaços restantes
    write_spaces_aux(N1). % Chamada recursiva para escrever mais espaços
