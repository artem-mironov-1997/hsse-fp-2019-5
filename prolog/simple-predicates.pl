% NOTE: Base facts
father(a,b).  % 1                 
father(a,c).  % 2
father(b,d).  % 3
father(b,e).  % 4
father(c,f).  % 5

% NOTE: Custom predicates
brother(X,Y) :- father(Z,X), father(Z,Y).

