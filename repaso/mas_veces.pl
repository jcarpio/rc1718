
% mas_veces(+Lista, -E, -N).
% Es cierto cuando E unifica con el elemento
% que más veces aparece en Lista y N el número
% de veces que aparece

mas_veces(L, E, N):-
  msort(L, ListaOrd),
  comprime(ListaOrd, ListaComp),
  ord_tuplas(ListaComp, ListaCompOrd),
  reverse(ListaCompOrd, [(E,N)|_]).

insertar_ord(E, [], [E]).
insertar_ord((E,N), [(Cab,NCab)|Resto], 
      [(E,N),(Cab,NCab)|Resto]):-
    N =< NCab.
insertar_ord((E,N), [(Cab,NCab)|Resto], 
       [(Cab,NCab)|R]):-
    N > NCab,
    insertar_ord((E,N), Resto, R).

ord_tuplas([], []).
ord_tuplas([Cab|Resto], R2):-
   ord_tuplas(Resto, R),
   insertar_ord(Cab, R, R2).

comprime([], []).
comprime([E], [(E,1)]).
comprime([Cab1, Cab1|Resto], [(Cab1,N2)|R]):-
   comprime([Cab1|Resto], [(Cab1,N)|R]),
   N2 is N+1.
comprime([Cab1,Cab2|Resto], [(Cab1,1)|R]):-
   Cab1 \= Cab2,
   comprime([Cab2|Resto], R).

comparar(<, (_,N1), (_,N2)) :- N1 < N2.
comparar(=, (_,N1), (_, N2)) :- N1 == N2.
comparar(>, (_,N1), (_, N2)) :- N1 > N2.

% Utilizando el predicado predsort
% predsort(comparar, [(a,2),(b,3)], R)

% ?- predsort(comparar, [(a,3),(b,1),(c,5)],R).
% R = [(b, 1),  (a, 3),  (c, 5)] 



  
    





