% dec2peano(+Dec, ?Peano)
% Es cierto cuando Peano unifica
% con el número natural 
% equivalente a al decimal Dec
% ejemplo:
% dec2peano(3, P)
% P = s(s(s(0)))

dec2peano(0, 0).
dec2peano(N, s(R)):- N > 0,
  N2 is N-1, dec2peano(N2, R).
  
% dec2peano(3, R) -> R = s(s(s(0)))
% dec2peano(2, R) -> R = s(s(0))