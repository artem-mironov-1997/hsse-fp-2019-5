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
	?- brother(X,Y).
	?- cousin(X,Y).
	?- grandson(X,Y).
	?- descendent(X,Y).

% Чтобы X и Y были братьями, надо чтобы у них был общий отец (Z) + X!=Y	
brother(X, Y):-
	not(X = Y),
	father(Z, X),
	father(Z, Y).
	
% X=b, Y=c
% X=d, Y=e 
	
% Чтобы X и Y были кузенами, надо чтобы их отцы были братьями (Z1, Z2) + X!=Y		
cousin(X, Y):-
	not(X = Y),
	brother(Z1, Z2),
	father(Z1, X),
	father(Z2, X).

% X=d, Y=f
% X=e, Y=f

% Чтобы X был внуком Y, надо чтобы Y был отцом Z, который отец X + X!=Y	
grandson(X, Y):-
	not(X = Y),
	father(Y, Z),
	father(Z, X).
	
% X=d Y=a
% X=e Y=a
% X=f Y=a

% Чтобы X был потомком Y, надо чтобы Y был отцом Z, у которого есть потомок X + X!=Y	
descent(X, Y):-
	not(X = Y),
	father(Y, Z),
	descent(X, Z).

% Стартовый вариант: Y - отец X => X - потомок Y
descent(X, Y):-
	not(X = Y),
	father(Y, X).
	
% X=b Y=a
% X=d Y=a
% X=e Y=a
% X=c Y=a
% X=f Y=a
% X=d Y=b
% X=e Y=b
% X=f Y=c