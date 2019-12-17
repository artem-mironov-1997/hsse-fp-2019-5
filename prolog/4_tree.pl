% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% NOTE: Handle situation when there's nothing to ...
% ... sort.
qsort([], []).
% NOTE: Defining rules for the recursive sort.
% - Terminating rule for the quick sort recursion
split(X, [],[],[]).
% - Separating left side 
split(X, [Y|T], [Y|Lhs], Rhs) :- X > Y, split(X, T, Lhs, Rhs).
% - Separating right side 
split(X, [Y|T], Lhs, [Y|Rhs]) :- split(X, T, Lhs, Rhs).

% - Sorting function
qsort([X|Tail], Result) :-         
	split(X, Tail, Left, Right),
	qsort(Left, SortedLeft),
	qsort(Right, SortedRight),
	append(SortedLeft, [X|SortedRight], Result).

% Separates the tree into 2 halfs
separate(List, Left, Right) :-
    append(Left, Right, List),
    length(List, CurrentLength),
    HalfOfLength is div(CurrentLength, 2),
    length(CurrentLength, HalfOfLength).

% NOTE: Custom rules for the binary tree cnstruction.
% - Terminating rule for the binary tree construction
balanced_tree_util([], empty).
% - Recursive construction of the binary tree
balanced_tree_util(List, instant(Root, Lhs, Rhs)) :-
    separate(List, LeftPart, [Root | RightPart]),
    balanced_tree_util(LeftPart, Lhs),
    balanced_tree_util(RightPart, Rhs).

balanced_tree(L, T) :-
	qsort(L, SortedList),
	balanced_tree_util(SortedList, T).
