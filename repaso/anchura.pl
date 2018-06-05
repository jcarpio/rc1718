

anchura(a(E, Lista_hijos), [E|R]):-
  anchura(Lista_hijos, R).

anchura([], []).
anchura([a(E,Lista_hijos)|Resto], [E|R2]):-
  append(Resto, Lista_hijos, R),
  anchura(R, R2).

bin2gen(a(E, HI, HD), a(E, [RI, RD])):-
  HI \= nil, HD \= nil,
  bin2gen(HI, RI),
  bin2gen(HD, RD).

bin2gen(a(E,nil,nil), a(E,[])).

bin2gen(a(E, HI,nil), a(E,[RI])):-
  bin2gen(HI,RI).

bin2gen(a(E, nil, HD), a(E,[RD])):-
  bin2gen(HD, RD).

arbol1( 
       a(a, a(b,a(c,nil,nil),nil), a(d,nil,nil))
).