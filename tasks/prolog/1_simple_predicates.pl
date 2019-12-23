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

	brother(X,Y):- father(Z,X), father(Z,Y), X \= Y.
	cousin(X,Y):- brother(Z,W), father(Z,X), father(W,Y), X \= Y.
	grandson(X,Y):- father(Y,Z), father(Z,X).
	descendent(X,Y):- father(Y,X).
	descendent(X,Y):- father(Y,Z), descendent(X,Z).

% forall( brother(X,Y), format('% ~w brother of ~w~n', [X, Y])).
% c brother of b
% b brother of c
% e brother of d
% d brother of e

% forall( cousin(X,Y), format('% ~w cousin of ~w~n', [X, Y])).
% d cousin of f
% e cousin of f
% f cousin of d
% f cousin of e

% forall( grandson(X,Y), format('% ~w grandson of ~w~n', [X, Y])).
% d grandson of a
% e grandson of a
% f grandson of a

% forall( descendent(X,Y), format('% ~w descendent of ~w~n', [X, Y])).
% b descendent of a
% c descendent of a
% d descendent of b
% e descendent of b
% f descendent of c
% d descendent of a
% e descendent of a
% f descendent of a
