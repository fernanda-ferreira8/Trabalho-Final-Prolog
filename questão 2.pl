%a
elemento(1, [X|_], X). % Caso base
elemento(N, [_|T], E) :-
    N > 1,
    N1 is N - 1,
    elemento(N1, T, E).
%b
apaga(_, [], []). % Caso base: 
apaga(X, [X|T], L2) :- apaga(X, T, L2).
apaga(X, [Y|T], [Y|L2]) :- X \= Y,
    		apaga(X, T, L2).
%c
insere(X, [], [X]). % Caso base
insere(X, [Y|T], [Y|L2]) :-
    insere(X, T, L2).
%d
concatena([], L, L). % Caso base
concatena([X|T], L2, [X|L3]) :-
    concatena(T, L2, L3).
%e
pares(0, []). % Caso base
pares(X, [Y|T]) :-
    Y mod 2 =:= 0, 
    pares(XT, T),
    X is XT + 1.
pares(X, [Y|T]) :-
    Y mod 2 =\= 0, 
    pares(X, T).

%f        
minimo(X, [X]). % Caso base
minimo(X, [Y|T]) :-
    minimo(Z, T),
    X is min(Y, Z).
%g
media(X, L) :-
    soma(L, S),
    length(L, N),
    X is S / N.
soma([], 0). % Caso base
soma([Y|T], S) :-
    soma(T, ST),
    S is ST + Y.

%h
ordena_decrescente(L, Lista) :-
    ordenada(L),
    !, 
    Lista = L. 

ordena_decrescente(L, Lista) :-
    ordena(L, Lista). 

ordena([], []). 

ordena([X|Resto], Lista) :-
    ordena(Resto, ListaResto), 
    insere_decrescente(X, ListaResto, Lista). 

insere_decrescente(X, [], [X]). 

insere_decrescente(X, [Y|Resto], [X,Y|Resto]) :-
    X >= Y. 

insere_decrescente(X, [Y|Resto], [Y|ListaResto]) :-
    X < Y, 
    insere_decrescente(X, Resto, ListaResto). 

ordenada([]). 
ordenada([_]). 
ordenada([X,Y|Resto]) :-
    X >= Y, 
    ordenada([Y|Resto]).



