
% P(no)
% P(n-1) -> P(n)

natural(1).
natural(N):- N > 1, N2 is N - 1, natural(N2).