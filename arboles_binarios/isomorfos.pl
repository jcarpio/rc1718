% isomorfos(+A, +B)
% Es cierto si A y B son árboles isomorfos
%     1           a
%    / \         / \
%   2   3       b   c
%  /           /
% 4           d

isomorfos(nil,nil).
isomorfos(a(_,AI,AD), a(_,BI,BD)):- 
   isomorfos(AI,BI), 
   isomorfos(AD,BD).

arbol1(
      a(1, a(2,a(4,nil,nil),nil), a(3,nil,nil))
      ).

arbol2(
      a(a, a(b,a(d,nil,nil),nil), a(c,nil,nil))
      ).

arbol3(
      a(a, a(b,a(d,nil,nil),nil), a(c,nil,a(e,nil,nil)))
      ). 