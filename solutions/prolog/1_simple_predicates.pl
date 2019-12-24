father(a,b).                 
father(a,c).
father(b,d).
father(b,e).
father(c,f).

brother(X,Y) :- father(Z,X), father(Z,Y), X\=Y.

cousin(X,Y) :- father(Z,X), father(C,Y), brother(Z,C), Z \= C, X \= Y.

grandson(X,Y) :- father(Z,X), father(Y,Z).

descendent(X,Y) :- father(Y,X).
descendent(X,Y) :- father(Z,X), descendent(Z,Y).
	

?- brother(X,Y).

X = b
Y = c ? ;

X = c
Y = b ? ;

X = d
Y = e ? ;

X = e
Y = d ? ;

no

?- cousin(X,Y).

X = d
Y = f ? ;

X = e
Y = f ? ;

X = f
Y = d ? ;

X = f
Y = e ? ;

(32 ms) no	

?- grandson(X,Y).

X = d
Y = a ? ;

X = e
Y = a ? ;

X = f
Y = a ? ;

no

?- descendent(X,Y).

X = b
Y = a ? ;

X = c
Y = a ? ;

X = d
Y = b ? ;

X = e
Y = b ? ;

X = f
Y = c ? ;

X = d
Y = a ? ;

X = e
Y = a ? ;

X = f
Y = a ? ;

no