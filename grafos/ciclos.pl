:- ensure_loaded("sobre.pl").

% ciclos(+G, -C)
% Es cierto cuando C unifica con cualquier ciclo del
% grafo G, por unificación debo poder encontrar
% todos los ciclos del grafo G.

ciclos(G, C):- camino(G, Ini, Ini, [], C).

% lista_ciclos(+G, -L)
% Es cierto cuando L unifica con una Lista que 
% contiene todos los ciclos del grafo G.

lista_ciclos(G, L):- bagof(C, camino(G, Ini, Ini, [], C), L).
