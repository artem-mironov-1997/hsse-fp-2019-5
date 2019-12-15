% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями
% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями
% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% 5. используя в качестве исходных данных следующий граф отношений
	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5
% указать в каком порядке и какие ответы генерируются вашими методами
brother(X,Y) :- father(Z,X), father(Z,Y), X\=Y.
cousin(X,Y) :- father(Z,X), father(W,Y), brother(Z,W).
grandson(X,Y) :- father(Z,X), father(Y,Z).
descendent(X,Y) :- father(Y,X).
descendent(X,Y) :- father(Z,X), descendent(Z,Y).


% brother:
% X и Y братья только тогда, когда их отец один и тот же человек и X и Y не один и тот же человек
% ?- bagof([X,Y],brother(X,Y), OUTPUT).
% OUTPUT = [[b, c], [c, b], [d, e], [e, d]].
%
% cousin:
% X и Y только тогда кузены, когда их отцы являются братьями
% ?- bagof([X,Y],cousin(X,Y),OUTPUT).
% OUTPUT = [[d, f], [e, f], [f, d], [f, e]]
%
% grandson:
% X внук для Y только тогда, когда X отец Y
% ?- bagof([X,Y],grandson(X,Y),OUTPUT).
% OUTPUT = [[d, a], [e, a], [f, a]].
%
% descendent:
% X потомок для Y только если Y являтся отцом X или кто то из потомков Y является отцом X
% ?- bagof([X,Y],descendent(X,Y),OUTPUT).
% OUTPUT = [[b,a],[c,a],[d,b],[e,b],[f,c],[d,a],[e,a],[f,a]].
