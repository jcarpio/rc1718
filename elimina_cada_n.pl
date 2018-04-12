% elimina_cada_n(+Lista, +N, -R).
%    es cierto cuando R unifica con una lista de la
%    siguiente forma:
%    elimina_cada_n([1,2,3,4,5,6,7], 3, R).
%    R = [1,2,4,5,7]

elimina_cada_n(L, N, L):- 
  length(L, Lenght), Length < N.

elimina_cada_n(L, N, R2):- N2 is N-1, length(L1, N2),
  append(L1, [_|L2], L), elimina_cada_n(L2, N, R),
  append(L1, R, R2).