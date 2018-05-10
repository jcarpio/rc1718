% camino(+g(V,A), +Ini, +Fin, +Visitados, -Camino)
% Es cierto cuando Camino unifica con una lista
% de nodos que va desde Ini hasta Fin sin repetir
% v�rtices.

camino(_, Ini, Ini, _, [Ini]).
camino(g(_,A), Ini, Fin, Visitados, [Ini|Camino]):-
  member(a(Ini, TMP), A),
  \+ member(TMP, Visitados),
  camino(g(_,A), TMP, Fin, [TMP|Visitados], Camino).

grafo(g([a,b,c,d], [a(a,b), a(b,c), a(c,d), a(d,b)])).


% Variantes:
%     
%  1. Grafo dirigido
%    1.1 Visitados como lista de v�rtices
%    1.2 Visitados como lista de aristas
%    1.3 Camino como lista de v�rtices 
%    1.4 Camino como lista de aristas
%
%  2. Grafo no dirigido
%    2.1 Visitados como lista de v�rtices
%    2.2 Visitados como lista de aristas
%    2.3 Camino como lista de v�rtices
%    2.4 Camino como lista de aristas 

 
