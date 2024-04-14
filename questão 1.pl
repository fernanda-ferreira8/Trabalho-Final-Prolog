%1) Pouco se sabe da história passada da família Pinheiro. Existem alguns registos antigos 
%que indicam que o casal José e Maria criou quatro filhos, o João, Ana, Jéssica e Lucas. 
%Ana teve duas filhas, a Helena e a Joana, também parece ser verdade, segundo os
%mesmos registos que Joana teve dois filhos, Antônio e Juares. Além disso, o Mário é 
%filho do João, pois muito se orgulha ele disso. Estranho também, foi constatar que o 
%Carlos nasceu da relação entre a Helena, muito formosa, e o Mário. Jéssica teve 
%apenas uma filha Heloisa e Lucas teve três filhos: Fagundes, Márcia e Júlio. Por fim, 
%Márcia casou-se com Rodrigo e teve um filho, Luciano.

%a) Utilizando o predicado progenitor(X,Y) (ou seja, X é progenitor de Y), represente em 
%Prolog todos os progenitores da família Pinheiro.

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

irmã(Pessoa1, Pessoa2) :- feminino(Pessoa1), progenitor(Pessoa, Pessoa1), progenitor(Pessoa, Pessoa2).
irmão(Pessoa1, Pessoa2) :- masculino(Pessoa1), progenitor(Pessoa, Pessoa1), progenitor(Pessoa, Pessoa2).

%caso base de descendente: Pessoa1 é descendente de Pessoa2, se Pessoa2 for progenitora dela? (sim
descendente(Pessoa1, Pessoa2) :- progenitor(Pessoa2, Pessoa1).
descendente(Pessoa1, Pessoa2) :-
    (	
    	progenitor(Pessoa2, Pessoa3),
    	descendente(Pessoa1, Pessoa3)   
    ).




%c) Formule regras, em Prolog, para responder as seguintes questões:

%1. O João é filho do José?








%2. Quem são os filhos da Maria?



%3. Quem são os primos do Mário?



%4. Quantos sobrinhos/sobrinhas com um Tio existem na família Pinheiro?






%5. Quem são os ascendentes do Carlos?



%6. A Helena tem irmãos? E irmãs?





%7. Quem é avô/avó de Luciano?





%8. Quem tem netos na família Pinheiro?





