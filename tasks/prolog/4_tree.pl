% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

partition(_,[],[],[]).
partition(Pivot, [Head|Tail], [Head|Smallers], Largers):- Head =< Pivot, partition(Pivot,  Tail, Smallers, Largers).
partition(Pivot, [Head|Tail], Smallers, [Head|Largers]) :- Head >= Pivot, partition(Pivot, Tail, Smallers, Largers).

qsort([], []).
qsort([Pivot|Tail], Result):-
    partition(Pivot, Tail, Smallers, Largers),
    qsort(Smallers, SortedSmalls),
    qsort(Largers, SortedLarges),
    append(SortedSmalls, [Pivot|SortedLarges],Result).

same_length(List1,List2) :-
	length(List1, Length1),
	length(List2, Length2),
	(Length1 =:= Length2;
	Length1 =:= (Length2 - 1)).

divide(List, LeftList, RightList) :-
	append(LeftList, RightList, List),
	same_length(LeftList, RightList), !.


balanced_tree_without_sort([], empty).

balanced_tree_without_sort(List, instant(Root, empty, empty)) :-
	List = [Root|[]], !.

balanced_tree_without_sort([First, Second], instant(Second, Left, empty)) :-
	First < Second,
	balanced_tree([First], Left), !.

balanced_tree_without_sort([First, Second], instant(First, Left, empty)) :-
	First >= Second,
	balanced_tree([Second], Left), !.

balanced_tree_without_sort(SortedList, instant(Mid, Left, Right)) :-
	divide(SortedList, LeftList, [Mid|RightList]),
	balanced_tree_without_sort(LeftList, Left),
	balanced_tree_without_sort(RightList, Right), !.

balanced_tree(List, instant(Mid, Left, Right)) :-
	qsort(List, Sorted),
	divide(Sorted, LeftList, [Mid|RightList]),
	balanced_tree_without_sort(LeftList, Left),
balanced_tree_without_sort(RightList, Right), !.
