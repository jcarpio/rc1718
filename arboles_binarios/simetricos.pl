
% invertir(+A, -R)
% Es cierto cuando R unifica con el árbol A
% invertido
invertir(nil, nil).
invertir(a(E, HI, HD), a(E, RD, RI)):-
  invertir(HI, RI),
  invertir(HD, RD).

% simetrico(+A)
% Es cierto si A es un árbol simetrico respecto
% a su eje central

simetrico(A):- invertir(A, A).

% simétricos(+A, +B)
% Es cierto cuando A es simétrico a B

simetricos(A, B):- invertir(A, B).

arbol1(
    a(1, a(2,a(3,nil,nil),nil), a(2,nil,a(3,nil,nil)))
       ).

arbol2(
    a(1, a(2, a(3,nil,nil),nil), nil) 
      ).

arbol3(
    a(1, nil, a(2,nil,a(3,nil,nil)))
      ).     