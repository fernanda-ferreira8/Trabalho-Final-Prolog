:- dynamic cliente/4. % Definindo o predicado din�mico cliente/4

% Predicado principal para ler os dados do arquivo e armazenar na base de conhecimento
calculo :-
    open('exercicio6.txt', read, Arquivo), % Abrindo o arquivo para leitura
    ler_clientes(Arquivo), % Chamando o predicado auxiliar para ler os clientes
    close(Arquivo). % Fechando o arquivo ap�s a leitura

%Caso Base: Finaliza quando n�o h� mais clientes para ler
ler_clientes(Arquivo) :-
    \+ at_end_of_stream(Arquivo), % Verifica se ainda n�o chegou ao final do arquivo
    !,
    ler_cliente(Arquivo),
    ler_clientes(Arquivo).

ler_clientes(_). % Caso base, finaliza a leitura do arquivo

% Predicado para ler um cliente do arquivo
ler_cliente(Arquivo) :-
    read(Arquivo, Cliente), % Lendo o pr�ximo termo do arquivo
    assert(Cliente). % Adicionando o termo lido � base de conhecimento

% Predicado para gerar uma linha do relat�rio para um cliente
gerar_relatorio(cliente(Nome, Idade, Salario, NroDependentes)) :-
    write(Nome), write_spaces(Nome, 20), % Nome (completa at� 20 caracteres)
    write(Idade), write_spaces(Idade, 10), % Idade (completa at� 10 caracteres)
    write(Salario), write_spaces(Salario, 10), % Salario (completa at� 10 caracteres)
    write(NroDependentes), % N�mero de Dependentes
    nl. % Nova linha

% Predicado para escrever espa�os em branco ap�s um termo
write_spaces(Termo, N) :-
    atom_length(Termo, L), % Obt�m o comprimento do termo
    Espacos is N - L, % Calcula o n�mero de espa�os necess�rios
    write_spaces_aux(Espacos). % Escreve os espa�os

write_spaces_aux(0). % Caso base, n�o escreve mais espa�os
write_spaces_aux(N) :-
    write(' '), % Escreve um espa�o
    N1 is N - 1, % Reduz o contador de espa�os restantes
    write_spaces_aux(N1). % Chamada recursiva para escrever mais espa�os

    %Quest�o 7
    % Predicado principal para ler o arquivo e calcular a soma dos dependentes
somaDependentes :-
    write('Abrindo o arquivo "exercicio6.txt"...'), nl,
    open('exercicio6.txt', read, Arquivo),
    write('Arquivo aberto com sucesso.'), nl,
    ler_clientes_e_calcular_soma(Arquivo, 0, SomaDependentes),
    close(Arquivo),
    write('Soma total de dependentes: '), write(SomaDependentes), nl,
    gravar_soma_em_arquivo(SomaDependentes).

% Caso Base: Finaliza quando n�o h� mais clientes para ler
ler_clientes_e_calcular_soma(Arquivo, SomaAtual, SomaDependentesFinal) :-
    (   at_end_of_stream(Arquivo) ->
        SomaDependentesFinal = SomaAtual
    ;   ler_cliente_e_calcular_soma(Arquivo, SomaAtual, SomaDependentesParcial),
        ler_clientes_e_calcular_soma(Arquivo, SomaDependentesParcial, SomaDependentesFinal)
    ).


ler_clientes_e_calcular_soma(_, SomaAtual, SomaAtual). % Caso base, finaliza a soma

% Predicado para ler um cliente do arquivo e calcular a soma dos dependentes
ler_cliente_e_calcular_soma(Arquivo, SomaAtual, SomaDependentesFinal) :-
    read(Arquivo, cliente(_, _, _, NroDependentes)), % Lendo o pr�ximo termo do arquivo
    NovoSoma is SomaAtual + NroDependentes, % Calcula a nova soma
    ler_clientes_e_calcular_soma(Arquivo, NovoSoma, SomaDependentesFinal).

% Predicado para gravar a soma dos dependentes em um arquivo
gravar_soma_em_arquivo(SomaDependentes) :-
    open('soma.txt', write, Arquivo), % Abrindo o arquivo "soma.txt" para escrita
    write(Arquivo, SomaDependentes), % Escrevendo a soma no arquivo
    close(Arquivo). % Fechando o arquivo ap�s a escrita
