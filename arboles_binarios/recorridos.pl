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

% bin2gen(+A, -R)
% Es cierto cuando R unifica con un árbol
% genérico equivalente al arbol binario A
bin2gen(a(E, HI, HD), a(E, [RI, RD])):-
  HI \= nil, HD \= nil,
  bin2gen(HI, RI),
  bin2gen(HD, RD).
bin2gen(a(E, HI, nil), a(E, [RI])):-
  bin2gen(HI, RI).
bin2gen(a(E, nil, HD), a(E, [RD])):-
  bin2gen(HD, RD).
bin2gen(a(E, nil, nil), a(E, [])).


% anchura(+A, -R)
% Es cierto cuando R unifica con el recorrido
% en anchura del árbol A
anchura(a(E, Lista_hijos), [E|R]):-
  anchural(Lista_hijos, R).

anchural([], []).
anchural([a(E, L)|Resto], [E|R2]):-  
  append(Resto, L, R),
  anchural(R, R2).
   

arbol1(  
 a('+', a(1,nil,nil), a('*', a(2,nil,nil), a(3,nil,nil)))
 ).

arbol2(  
 a('+', a('/', a(5, nil,nil), a(6,nil,nil)), a('*', a(2,nil,nil), a(3,nil,nil)))
 ).