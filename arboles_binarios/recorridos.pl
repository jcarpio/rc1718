:- include('crea_arbol_lista.pl').

% inorden(+A, -R)
% Es cierto cuando R unifica con el recorrido
% en inorden del árbol A
% Hi, Raiz, Hd
inorden(nil, []).
inorden(a(E, HI, HD), R):-
  inorden(HI, RI),
  inorden(HD, RD),
  append(RI, [E|RD], R).

% preorden(+A, -R)
% Es cierto cuando R unifica con el recorrido
% en preorden del árbol A
% Raiz, Hi, Hd

preorden(nil, []).
preorden(a(E, HI, HD), R):-
  preorden(HI, RI),
  preorden(HD, RD),
  append([E|RI], RD, R).

% postorden(+A, -R)
% Es cierto cuando R unifica con el recorrido
% en postorden del árbol A
% Hi, Hd, Raiz

postorden(nil, []).
postorden(a(E, HI, HD), R):-
  postorden(HI, RI),
  postorden(HD, RD),
  append([RI, RD, [E]], R).

% anchura(+A, -R)
% Es cierto cuando R unifica con el recorrido
% en anchura del árbol A

anchura(nil, []).
% anchura(a(E, HI, HD),  ):-
%   anchura(


arbol1(  
a('+', a(1,nil,nil), a('*', a(2,nil,nil), a(3,nil,nil)))
).