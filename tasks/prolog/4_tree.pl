% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


quicksort([],[]).
quicksort([],[]).
quicksort([X|Tail], Sorted) :-
    split(X, Tail, Small, Big),
    quicksort(Small, SortedSmall),
    quicksort(Big, SortedBig),
    append(SortedSmall, [X|SortedBig], Sorted).


split(X, [],[],[]).
split(X, [Y|Tail], [Y|Small], Big) :-X > Y, split(X, Tail, Small, Big).
split(X, [Y|Tail], Small, [Y|Big]) :-split(X, Tail, Small, Big).


split(_,[],[],[]).
split(X,[A|B],[A|Min],M) :- A =< X, split(X, B, Min, M).
split(X,[A|B],Min,[A|M]) :- A > X, split(X, B, Min, M).


divide(List, Left, Right):-
    append(Left, Right, List),
    length(List, ListLength),
    LengthHalf is div(ListLength, 2),
    length(Left, LengthHalf).


btree([], empty).
btree(List, instant(Root, L, R)):-
      divide(List, LH, [Root|RH]),
      btree(LH, L),
      btree(RH, R).


balanced_tree(L, T) :-
	quicksort(L, R),
	btree(R, T).


% gibalanced_tree([12, 1, 6, 7, 8, 15, 4, 5, 3], R).
% R = instant(6, instant(4, instant(3, instant(1, empty, empty), empty), instant(5, empty, empty)), instant(12, instant(8, instant(7, empty, empty), empty), instant(15, empty, empty)))