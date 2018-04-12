%--------------------------------------
% comprime(+Lista, -R)
%   es cierto cuando R unifica con una lista
%   que contine los elementos de Lista
%   en formato comprimido:
% Ejemplo: [a,a,a,b,b,c] -> [(a,3),(b,3),(c,1)]
%---------------------------------------
%
% Variantes:
% 1. comprime([a,a,a,b,b,c], [(a,3), (b,2), c]
% 2. comprime([a,a,a,b,b,c], [a-3, b-2, c]

comprime([], []).
comprime([E], [(E,1)]).
comprime([Ca, Ca|Resto], [(Ca,N2)|R]):-
  comprime([Ca|Resto], [(Ca,N)|R]),
  N2 is N+1.
comprime([Ca1, Ca2|Resto], [(Ca1,1)|R]):-
  Ca1 \= Ca2,
  comprime([Ca2|Resto], R).


%--------------------------------------
% comprime_v2(+Lista, -R)
%   es cierto cuando R unifica con una lista
%   que contine los elementos de Lista
%   en formato comprimido:
% Ejemplo: [a,a,a,b,b,c] -> [(a,3),(b,3),c]
%---------------------------------------

comprime_v2([], []).
comprime_v2([E], [E]).
comprime_v2([Ca,Ca|Resto], [(Ca,N2)|R]):-
  comprime_v2([Ca|Resto], [(Ca,N)|R]), N2 is N+1.

comprime_v2([Ca,Ca|Resto], [(Ca,2)|R]):-
  comprime_v2([Ca|Resto], [Ca|R]).

comprime_v2([Ca1,Ca2|Resto], [Ca1|R]):- Ca1 \= Ca2,
  comprime_v2([Ca2|Resto], R).
