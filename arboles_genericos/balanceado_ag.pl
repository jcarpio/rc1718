:- ensure_loaded('altura_ag.pl').
:- ensure_loaded('ejemplos_ag.pl').

% balanceado_ag(+A)
% Es cierto si el árbol genérico A está
% balanceado, es decir la diferencia
% de altura para cualquier nodo es como
% máximo 1.

balanceado_ag(a(_, Lista_hijos)):-
  balanceado_ag(Lista_hijos).

balanceado_ag([]).
balanceado_ag([Ca]):- balanceado_ag(Ca).

balanceado_ag([Ca|Resto]):- 
  altura_ag(Ca, RCa), Resto \= [],
  altura_ag(Resto, RResto),
  R is RCa - RResto, R2 is abs(R),
  R2 =< 1,
  balanceado_ag(Ca),
  balanceado_ag(Resto).
  