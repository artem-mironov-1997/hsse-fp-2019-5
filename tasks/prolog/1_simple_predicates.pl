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
%	?- brother(X,Y).
%	?- cousin(X,Y).
%	?- grandson(X,Y).
%	?- descendent(X,Y).

%========================================================================================

brother(P1, P2):-
  father(Dad, P1),
  father(Dad, P2),
  not(P1 = P2),
  not(Dad = P1),
  not(Dad = P2).

cousin(P1, P2):-
  father(Dad1, P1),
  father(Dad2, P2),
  not(P1 = P2),
  brother(Dad1, Dad2).

grandson(P1, P2):-
  father(P2, Son),
  father(Son, P1).

descendent(P1, P2):-
  father(P2, P1).

descendent(P1, P2):-
  father(P2, Tmp),
  descendent(P1, Tmp).

%========================================================================================

comparator:-
  writeln('brothers: '),
  forall(
    brother(P1, P2),
    (write(P1), write(' and '), write(P2), nl)
  ),
  writeln('cousins: '),
  forall(
    cousin(P1, P2),
    (write(P1), write(' and '), write(P2), nl)
  ),
  writeln('grandson: '),
  forall(
    grandson(P1, P2),
    (write(P1), write(' and '), write(P2), nl)
  ),
  writeln('descendents: '),
  forall(
    descendent(P1, P2),
    (write(P1), write(' and '), write(P2), nl)
  ).

%========================================================================================
/*
brothers:
b and c
c and b
d and e
e and d
cousins:
d and f
e and f
f and d
f and e
grandSons:
d and a
e and a
f and a
*/
