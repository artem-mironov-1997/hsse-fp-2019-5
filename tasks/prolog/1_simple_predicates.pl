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


% Х и Y братья если отец каждого из них является одним и тем же человеком, а Х и Y - разные.

brother(X,Y) :- father(Z,X), father(Z,Y), different(X,Y).

% Х и Y двоюродные братья, если отцы являются братьями.

cousin(X,Y):-brother(W,Z),father(W,X),father(Z,Y).

% X является потомком Y только если кто то из потомков Y или сам Y является отцом X

descendent(X,Y) :- father(Y,X); father(Z,X), descendent(Z,Y).

% X является внуком для Y, если отец Х является сыном для Y

grandson(X,Y):-father(Y,Z),father(Z,X).

% ?- brother(e,d). /true
% ?- brother(c,d). /false

% ?- cousin(b,c). /false
% ?- cousin(d,f). /true

% ?- descendent(a,c). /true
% ?- descendent(c,e). /false

% ?- grandson(a,f). /true
% ?- grandson(e,d). /false