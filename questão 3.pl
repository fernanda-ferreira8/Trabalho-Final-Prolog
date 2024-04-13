%3) Usando a tabela d(0,zero), d(1,um), ..., d(9,nove), defina o predicado 
%txt(D,P) que converte uma lista de dígitos numa lista de palavras. 
%Por exemplo, txt([7,2,1],P) resulta em P=[sete,dois,um].

%BANCO DE DADOS: o banco de dados que contém as correspondências entre os 
%dígitos e as palavras correspondentes, por exemplo, d(0,zero), d(1,um)
d(0,zero). 
d(1,um).
d(2,dois).
d(3,três).
d(4,quatro).
d(5,cinco).
d(6,seis).
d(7,sete).
d(8,oito).
d(9,nove). 

%Caso Base:Quando a lista de entrada está vazia('[]'), a lista de palavras 
%também pe vazia ('[]'), isso é representado pela regra 'txt([],[])'
txt([],[]).


%Caso Recursivo: 
txt(D,P):- D = [H|T], P = [X|Y], d(H, X), txt(T, Y).

/*- D é a lista de dígitos de entrada;
- P é a lista de palavras de saída; 
- A cláusula verifica se 'D' é uma lista com pelo menos um elemento, onde 'H'
é o primeiro elemento da lista 'D' e 'T' é o restante da lista;
- 'P' é uma lista em que 'X' é o primeiro elemento e 'Y' é o restante da lista;
- 'd(H, X)' consulta o banco de dados para encontrar a palavra correspondente ao
 primeiro dígito 'H' e atribui a 'X'; 
- 'txt(T, Y)' é a chamada recursiva, onde 'T' é o restande da lista de dígitos e 
'Y' é o restante da lista de palavras. Isso é feito para processar os elementos
restante da lista de entrada. */


/*EXEMPLO DE COMO FAZER A CONSULTA: 
  ? - txt([8,4,1],P).
  Resposta esperada: P = [oito, quatro, um]*/
