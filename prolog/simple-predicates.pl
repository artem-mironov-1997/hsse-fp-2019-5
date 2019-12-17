% NOTE: Base facts
father(a,b).  % 1                 
father(a,c).  % 2
father(b,d).  % 3
father(b,e).  % 4
father(c,f).  % 5

% -- MARK: Custom predicates

% - Check that X and Y are brothers
brother(X,Y) :- father(Z,X), father(Z,Y).

% - Check that X and Y are cousing (their fathers are brothers)
cousin(X,Y) :- father(FATHER_ONE,X), father(FATHER_TWO,Y), brother(FATHER_ONE, FATHER_TWO).

% - Check that X is a grandson to Y
grandson(X,Y) :- father(Y, GRANDSON_FATHER), father(GRANDSON_FATHER, Y).

% - Check if X and Y are descendents
descendent(X,Y) :- father(X, Y).
descendent(X,Y): father(Y, B), descendent(X, B).

% -- MARK: Output of relationships 

% - Output of brothers
?- format('brothers~n').
?- forall(brother(X,Y), format('~w - ~w~n', [X,Y])).

% - Output of cousins
?- format('cousins~n').
?- forall(cousin(X,Y), format('~w - ~w~n', [X,Y])).

% - Output of grandsons
?- format('grandsons~n').
?- forall(grandson(X,Y), format('~w - ~w~n', [X,Y])).

% - Output of descendents
?- format('descendents~n').
?- forall(descendent(X,Y), format('~w - ~w~n', [X,Y])).
