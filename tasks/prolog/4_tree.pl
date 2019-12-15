% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% Loading previous lab file
:- ["3_quicksort"].
:- ensure_loaded(["3_quicksort"]).

% This lab implementation
split(List, Left, Right):-
    append(Left, Right, List),
    length(List, Length),
    HalfLength is Length div 2,
    length(Left, HalfLength).

binary_tree([], empty).
binary_tree(List, instant(Root, Left, Right)):-
      split(List, LeftHalf, [Root|RightHalf]),
      binary_tree(LeftHalf, Left),
      binary_tree(RightHalf, Right).

balanced_tree(L,T) :-
	quicksort(L, R),
	binary_tree(R, T).

% Results
% ?- balanced_tree([3,5,2,1,4,6],T).
% T = instant(4, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(6, instant(5, empty, empty), empty)) .
