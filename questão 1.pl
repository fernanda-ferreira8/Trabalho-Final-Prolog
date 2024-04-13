%1) Pouco se sabe da hist�ria passada da fam�lia Pinheiro. Existem alguns registos antigos
%que indicam que o casal Jos� e Maria criou quatro filhos, o Jo�o, Ana, J�ssica e Lucas.
%Ana teve duas filhas, a Helena e a Joana, tamb�m parece ser verdade, segundo os
%mesmos registos que Joana teve dois filhos, Ant�nio e Juares. Al�m disso, o M�rio �
%filho do Jo�o, pois muito se orgulha ele disso. Estranho tamb�m, foi constatar que o
%Carlos nasceu da rela��o entre a Helena, muito formosa, e o M�rio. J�ssica teve
%apenas uma filha Heloisa e Lucas teve tr�s filhos: Fagundes, M�rcia e J�lio. Por fim,
%M�rcia casou-se com Rodrigo e teve um filho, Luciano.

%a) Utilizando o predicado progenitor(X,Y) (ou seja, X � progenitor de Y), represente em
%Prolog todos os progenitores da fam�lia Pinheiro.

progenitor(maria,jo�o).
progenitor(maria, ana).
progenitor(maria, j�ssica).
progenitor(maria, lucas).
progenitor(jos�,jo�o).
progenitor(jos�, ana).
progenitor(jos�, j�ssica).
progenitor(jos�, lucas).
progenitor(jo�o, m�rio).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(j�ssica, heloisa).
progenitor(lucas, j�lio).
progenitor(lucas, fagundes).
progenitor(lucas, m�rcia).
progenitor(mario, carlos).
progenitor(helena, carlos).
progenitor(joana, ant�nio).
progenitor(joana, juares).
progenitor(m�rcia, luciano).
progenitor(rodrigo, luciano).


%b) Represente em Prolog as rela��es: sexo (masculino ou feminino), irm�, irm�o,
%descendente, m�e, pai, av�, tio, primo.

feminino(maria).
feminino(ana).
feminino(j�ssica).
feminino(helena).
feminino(joana).
feminino(heloisa).
feminino(m�rcia).
masculino(jos�).
masculino(jo�o).
masculino(lucas).
masculino(m�rio).
masculino(j�lio).
masculino(fagundes).
masculino(carlos).
masculino(ant�nio).
masculino(juares).
masculino(rodrigo).
masculino(luciano).

irm�(Pessoa1, Pessoa2) :- feminino(Pessoa1), progenitor(Pessoa, Pessoa1), progenitor(Pessoa, Pessoa2).
irm�o(Pessoa1, Pessoa2) :- masculino(Pessoa1), progenitor(Pessoa, Pessoa1), progenitor(Pessoa, Pessoa2).
descendente(Pessoa1, Pessoa2):-
    (   progenitor(Pessoa, Pessoa2),
        descendente(Pessoa2,










%c) Formule regras, em Prolog, para responder as seguintes quest�es:

%1. O Jo�o � filho do Jos�?








%2. Quem s�o os filhos da Maria?



%3. Quem s�o os primos do M�rio?



%4. Quantos sobrinhos/sobrinhas com um Tio existem na fam�lia Pinheiro?






%5. Quem s�o os ascendentes do Carlos?



%6. A Helena tem irm�os? E irm�s?





%7. Quem � av�/av� de Luciano?



%8. Quem tem netos na fam�lia Pinheiro?

