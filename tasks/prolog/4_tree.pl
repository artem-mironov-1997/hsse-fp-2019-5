% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([],[]).   

qsort([X|Tail], SortedResult) :-         
	qsplit(X, T, L, R),
	qsort(L, SL),
	qsort(R, SR),
	append(SL, [X|SR], SR).

qsplit(X, [],[],[]).
qsplit(X, [Y|T], [Y|L], R) :- X > Y, qsplit(X, T, L, R).
qsplit(X, [Y|T], L, [Y|R]) :- qsplit(X, T, L, R).

split_in_half(List, Left, Right):-
    append(Left, Right, List),
    length(List, ListLength),
    LengthHalf is div(ListLength, 2),
    length(Left, LengthHalf).

balanced_tree_kek([], empty).
balanced_tree_kek(List, instant(Root, Left, Right)) :-
	split_in_half(List, LeftList, [Root|RightList]),
	balanced_tree_kek(LeftList, Left),
	balanced_tree_kek(RightList, Right).
	
balanced_tree(List, Tree) :-
	qsort(List, SortedList),
	balanced_tree_kek(SortedList, Tree).