% Problema de los caníbales y misioneros

% 1. Definición del estado
% estado(Num_mi_izq, Num_can_izq, Pos_barca)


% 1.1. Definición del estado inicial
%     estado(3, 3, izq)

% 1.2. Definición del estado final
%     estado(0, 0, _)

% 2. Definición de los movimientos
%
%   mov(Nombre, Estado_anterior, Estado_posterior) 

% mov(un_mis_izq, estado(Mi_izq, Ca_izq, dcha),
%                estado(Mi_izq_2, Ca_izq, izq)):-
%         Mi_izq < 3, Mi_izq_2 is Mi_izq + 1.

% mov(un_mis_dch, estado(Mi_izq, Ca_izq, izq),
%                 estado(Mi_izq_2, Ca_izq, izq)):-
%         Mi_izq < 0, Mi_izq_2 is Mi_izq - 1.

pasar(1,0,izq).
pasar(1,0,dch).
pasar(0,1,izq).
pasar(0,1,dch).
pasar(2,0,izq).
pasar(2,0,dch).
pasar(0,2,izq).
pasar(0,2,dch).
pasar(1,1,izq).
pasar(1,1,dch).

valido(estado(1,1,_)).
valido(estado(3,0,_)).
valido(estado(3,1,_)).
valido(estado(3,2,_)).
valido(estado(3,3,_)).
valido(estado(2,2,_)).
valido(estado(0,0,_)).
valido(estado(0,1,_)).
valido(estado(0,2,_)).
valido(estado(0,3,_)).
 

mov(pasar(M, C, dch), estado(MI, CI, izq), estado(MI2, CI2, dch)):-
  pasar(M,C,dch),
  % NT is M + C, NT =< 2, NT >= 1,
  M =< MI, C =< CI, % no pasar más de los que hay a la izquierda
  MI2 is MI - M, CI2 is CI - C, % lo que queda a la izq
  % MI2 >= CI2, 
  MI2 =< 3, CI2 =< 3, 
  valido(estado(MI2, CI2, _)).
  

mov(pasar(M, C, izq), estado(MI,CI, dch), estado(MI2, CI2, izq)):-
  pasar(M,C,izq),
  % NT is M + C, NT =< 2, NT >= 1,
  MD is 3 - MI, CD is 3 - CI, 
  M =< MD, C =< CD, % no pasar más de lo que hay a la derecha
  MI2 is MI + M, CI2 is CI + C, % nuevos misioneros y canibale a la izq
  % MI2 >= CI2, 
  MI2 =< 3, CI2 =< 3,
  valido(estado(MI2, CI2, _)).


/* camino(+Estado_inicial, +Estado_final, +Visitados, -Camino)
es cierto cuando Estado_inicial y Estado_final unifican con estados válido, Vi
sitados unifica con una lista de estados visitados. */

camino(Inicio, Inicio, _, [], [Inicio]).
camino(Inicio, Fin, Visitados, [Mov|Camino], [Inicio|CaminoE]):-
  length(Visitados, L), % L < 12,
  mov(Mov, Inicio, Int),
  \+ member(Int, Visitados),
  camino(Int, Fin, [Int|Visitados], Camino, CaminoE).

