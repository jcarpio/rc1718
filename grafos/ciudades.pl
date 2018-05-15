grafo(g([madrid, cordoba, sevilla, jaen, granada,
huelva, cadiz],
         [a(huelva, sevilla, a49, 94),
          a(sevilla, cadiz, ap4, 125),
          a(sevilla, granada, a92, 256),
          a(granada, jaen, a44, 97),
          a(sevilla, cordoba, a4, 138),
          a(jaen,madrid, a4, 335),
          a(cordoba, madrid, a4, 400)]
)).

% conectado(+Grafo, +Ini, +Fin, -Carretera, -Kilometros)
conectado(g(_, Aristas), Ini, Fin, C, K):-
  member(a(Ini, Fin, C, K), Aristas).
conectado(g(_, Aristas), Ini, Fin, C, K):-
  member(a(Fin, Ini, C, K), Aristas).

% visitado(+Ini, +Fin, +Visitados)
visitado(Ini, Fin, Visitados):- member(a(Ini, Fin,_,_), Visitados).
visitado(Ini, Fin, Visitados):- member(a(Fin, Ini,_,_), Visitados).

% camino(+Grafo, +Ini, +Fin, +Visitados, -Ciudades, -Carreteras, Kilometros)
% camino(_, Fin, Fin, _, [Fin], [], 0).
camino(G, Ini, Fin, _, [Ini,Fin], [Carretera], K):-
  conectado(G, Ini, Fin, Carretera, K).

camino(G, Ini, Fin, Visitados, [Ini|Ciudades],[Carretera|Carreteras], K2):-
  conectado(G, Ini, TMP, Carretera, K),
  \+ visitado(Ini, TMP, Visitados),
  camino(G, TMP, Fin, [a(Ini,TMP, _,_)|Visitados], Ciudades, Carreteras, Kilometros),
  K2 is Kilometros + K.

% grafo(G), camino(huelva, madrid, G,[],C,Ca,K).