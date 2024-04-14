%questão 5
estrada(c1, a, c, 150, 5.82).
estrada(c2, c, e, 90, 5.58).
estrada(c3, c, b, 180, 4.95).
estrada(c4, f, a, 200, 3.67).
estrada(c5, e, b, 80, 6.12).
estrada(c6, e, g, 89, 5.40).
estrada(c7, b, d, 62, 3.89).
estrada(c8, d, h, 254, 5.01).
estrada(c9, g, j, 621, 6).
estrada(c10, d, g, 300, 5.56).
estrada(c11, j, i, 41, 5.18).

%caso base
rota(Origem, Destino, [R], CustoTotal) :- estrada(R, Origem, Destino, DistanciaKm, CustoKm), CustoTotal is DistanciaKm*CustoKm.

rota(Origem, Destino, [R|L], CustoTotal) :-
    estrada(R, Origem, Proximo, DistanciaKm1, CustoKm1),
    rota(Proximo, Destino, L, CustoKm2),
	CustoTotal is CustoKm1*DistanciaKm1 + CustoKm2.
%c)

rotaAteA(R, Destino, CustoTotal) :- rota(_,Destino, R, CustoTotal). %A lógica é parecida com a função anterior, mas agr não tem origem definida

%d)

rotaOrigemA(R, Origem, CustoTotal) :- rota(Origem,_,R, CustoTotal).

%e)

rotaChegaB(R, Destino, CustoX) :- rota(_,Destino, R, CustoTotal), CustoTotal < CustoX.
