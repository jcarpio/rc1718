% miembro(+E, +A)
% Es cierto si el elemento E pertenece a las
% las etiquetas del árbol A

miembro(E, a(E, _, _)).
miembro(E, a(_, HI, _)):- miembro(E, HI).
miembro(E, a(_, _, HD)):- miembro(E, HD).
