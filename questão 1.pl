
%progenitores da família Pinheiro.

progenitor(maria,joão).
progenitor(maria, ana).
progenitor(maria, jéssica).
progenitor(maria, lucas).
progenitor(josé,joão).
progenitor(josé, ana).
progenitor(josé, jéssica).
progenitor(josé, lucas).
progenitor(joão, mário).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(jéssica, heloisa).
progenitor(lucas, júlio).
progenitor(lucas, fagundes).
progenitor(lucas, márcia).
progenitor(mário, carlos).
progenitor(helena, carlos).
progenitor(joana, antônio).
progenitor(joana, juares).
progenitor(márcia, luciano).
progenitor(rodrigo, luciano).


%b) Represente em Prolog as relações: sexo (masculino ou feminino), irmã, irmão, 
%descendente, mãe, pai, avô, tio, primo.

feminino(maria).
feminino(ana).
feminino(jéssica).
feminino(helena).
feminino(joana).
feminino(heloisa).
feminino(márcia).
masculino(josé).
masculino(joão).
masculino(lucas).
masculino(mário).
masculino(júlio).
masculino(fagundes).
masculino(carlos).
masculino(antônio).
masculino(juares).
masculino(rodrigo).
masculino(luciano).

irmã(X, Y) :- feminino(X), progenitor(Z, X), progenitor(Z, Y).
irmão(X, Y) :- masculino(X), progenitor(Z, X), progenitor(Z, Y).


%caso base de descendente: Pessoa1 é descendente de Pessoa2, se Pessoa2 for progenitora dela? (sim
descendente(X, Y) :- progenitor(Y, X).
descendente(X, Y) :-
    (	
    	progenitor(Y, Z),
    	descendente(X, Z)   
    ).


%mãe
mãe(X, Y) :-
    feminino(X),
    progenitor(X, Y).

%pai
pai(X, Y) :-
    masculino(X),
    progenitor(X, Y).

%avô
avô(X, Y) :-
    progenitor(X, Z),
    progenitor(Z, Y).

%tio
tio(X, Y) :-
    irmão(X, Z),
    progenitor(Z, Y).

%primo
primo(X, Y) :-
    progenitor(Z1, X),
    progenitor(Z2, Y),
    irmão(Z1, Z2),
    X \= Y.

%c) Formule regras, em Prolog, para responder as seguintes questões:

%1. O João é filho do José?
%progenitor(josé, joão).

%2. Quem são os filhos da Maria?
%progenitor(maria, Filho).


%3. Quem são os primos do Mário?
%primo(Primo, mário).


%4. Quantos sobrinhos/sobrinhas com um Tio existem na família Pinheiro?


%5. Quem são os ascendentes do Carlos?
%descendente(carlos, Ascendente).


%6. A Helena tem irmãos? E irmãs?
%irmão(Irmão, helena).
%irmã(Irmã, helena).


%7. Quem é avô/avó de Luciano?
%avô(Avô, luciano).


%8. Quem tem netos na família Pinheiro?


%progenitor(AvôAvó, Neto),
 %  descendente(Neto, AvôAvó),
  % Neto \= AvôAvó.

