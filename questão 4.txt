%4) Implemente o fatorial de forma iterativa em Prolog.

fatorial(0, 1). %Caso base, onde o fatorial de 0 é 1.
fatorial(N, F) :-
    (   N > 0,
        N1 is N - 1,
        fatorial(N1, F1),
    	F is N * F1
    ).

main:- 
    (   
    	write('Digite um numero para o calculo do fatorial'),
        read(N), %N guarda o número do usuário
    	fatorial(N,F),
        write('Fatorial do numero inserido eh:'),
        nl,
    	write(F)
    ).
