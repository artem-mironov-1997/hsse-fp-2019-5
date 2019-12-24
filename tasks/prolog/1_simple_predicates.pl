	father(a,b).  % 1
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5

	brother(X,Y) :- father(Z,Y), father(Z,X), not(X=Y).
	cousin(X,Y) :- father(Z,Y), father(A,X), brother(A,Z), not(X=Y).
	grandson(X,Y) :- father(Z,Y), father(X,Z).
	descendent(X,Y) :- father(X, Y); father(Y, A), descendent(X, A).

	:- writeln('All brothers:').
	:- forall(brother(X,Y), (write(X), write(' '), writeln(Y))).
	:- writeln('All cousins:').
	:- forall(cousin(X,Y), (write(X), write(' '), writeln(Y))).
	:- writeln('All grandsons:').
	:- forall(grandson(X,Y), (write(X), write(' '), writeln(Y))).
	:- writeln('All descendents:').
	:- forall(descendent(X,Y), (write(X), write(' '), writeln(Y))).

%All brothers:
%c b
%b c
%e d
%d e
%All cousins:
%f d
%f e
%d f
%e f
%All grandsons:
%a d
%a e
%a f
%All descendents:
%a b
%a c
%b d
%b e
%c f
%a a
%b a
%b a
%a a
%c a
%b b
%b b
%c c