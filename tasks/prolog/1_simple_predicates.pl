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

% Проверка, является ли X братом Y и наоборот
brother(X,Y) :- father(F, X), father(F, Y), dif (X, Y).
:- forall(brother(X,Y), (write(X), write(' and '), write(Y), writeln(" are brothers"))).
%% b and c are brothers
%% c and b are brothers
%% d and e are brothers
%% e and d are brothers

% Проверка, является ли Y дедом для X и наоборот
grandson(X,Y) :- father(Y, F), father(F, X).
:- forall(grandson(X,Y), (write(X), write(' is grandson for '), writeln(Y))).
%% d is grandson for a
%% e is grandson for a
%% f is grandson for a

% Проверка, является ли X двоюродным братом Y и наоборот
cousin(X,Y) :- father(FX,X), father(FY,Y), brother(FX,FY).
:- forall(cousin(X,Y), (write(X), write(' and '), write(Y), writeln(" are cousins"))).
%% d and f are cousins
%% e and f are cousins
%% f and d are cousins
%% f and e are cousins

% Проверка, является ли Y потомком X
descendent(X,Y) :- father(Y,X); father(F,X), descendent(F,Y).
:- forall(descendent(X,Y), (write(X), write(' is descendent for '), writeln(Y))).
%% b is descendent for a
%% c is descendent for a
%% d is descendent for b
%% e is descendent for b
%% f is descendent for c
%% d is descendent for a
%% e is descendent for a
%% f is descendent for a
