%4) Implemente o fatorial de forma iterativa em Prolog.

fatorial(0, 1). % Caso base, onde o fatorial de 0 é 1.
fatorial(N, F) :-
    N > 0,
    N1 is N - 1,
    fatorial(N1, F1),
    F is N * F1.

main :-
    repeat,
    write('Entre com um numero (maior que 0) para calcular seu fatorial: '),
    read(N),
    (   N >= 0 ->
        fatorial(N, F),
        write('O fatorial do numero digitado é '), 
        write(F), nl,
        ! ;    % é o "corte" que para o loop
        write('Numero invalido. Entre com um valor maior que 0'), nl,
        fail % fail é usado para voltar com o loop
    ).
