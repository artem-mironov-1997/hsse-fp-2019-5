father(a,b).  % 1
father(a,c).  % 2
father(b,d).  % 3
father(b,e).  % 4
father(c,f).  % 5

brother(A,B):- father(C,A), father(C,B).

cousin(A,B):-  father(C,A), father(D,B), brother(D,C).

grandson(A,B):- father(B, C), father(C, A).


descendent(A, B):- father(B, A).
descendent(A, B):- father(C, A), descendent(C, B).

