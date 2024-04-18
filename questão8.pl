Ler(Nome) :- repeat,
    read(N),
    (N == end_of_file -> !;
     read(I),
     read(S),
     read(_),
     (N == Nome ->( write(I), write(' '), write(S), !);
     fail)).

abrir() :-
    open('C:/Users/ferre/Documents/trabalho/arquivos.txt', read, X),
    write('Insira um nome: '),
    read(Nome),
    set_input(X),
    ler(Nome),
    set_input(user),
    close(X).
