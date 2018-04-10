% descomprime(+L, -R)
% Es cierto cuando R unifica con una lista de esta
% forma 
% descomprime([(a,3), (b,2), (c,1)], R).
% R = [a,a,a,b,b,c]

descomprime([],[]).

descomprime([(E,N)|Resto], [E|R]):-
	N>1,
	N2 is N - 1,
	descomprime([(E,N2)|Resto], R).

descomprime([(E,1)|Resto], [E|R]):-
	descomprime(Resto, R).