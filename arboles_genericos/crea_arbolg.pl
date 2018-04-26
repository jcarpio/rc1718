% crea_arbolg(+L, -Ag)
% Es cierto cuando Ag unifica con un árbol genérico
% que contiene todas las etiquetas de la lista L

crea_arbolg([Ca|Resto], a(Ca, R)):-
  crea_lista_ag(Resto, R). 

crea_lista_ag([], []).
crea_lista_ag([Ca|Resto], [a(Ca,[])|R]):-
  crea_lista_ag(Resto, R).