% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% Sort
qsort([],[]).   

qsort([Head|Tail], SortList) :- split(Head, Tail, LeftPart, RightPart),
                              qsort(LeftPart, LeftSortList),
                              qsort(RightPart, RightSortList),
                              append(LeftSort, [Head|RightSortList], SortList).

split(X, [], [], []).
split(X, [Y|Tail], [Y|LeftPart], RightPart) :- X > Y, split(X, Tail, LeftPart, RightPart).
split(X, [Y|Tail], LeftPart, [Y|RightPart]) :- split(X, Tail, LeftPart, RightPart).


balance(ListTree, LeftTree, RightTree) :-
    append(LeftTree, RightTree, ListTree),
    length(ListTree, Numbers),
    length(LeftTree, Numbersdiv2),
    Numbersdiv2 is Numbers div 2.

balanced_tree_accum([], empty).
balanced_tree_accum(ListTree, instant(RootTree, LeftTree, RightTree)) :- 
	balance(ListTree, Left, [RootTree|Right]),
    balanced_tree_accum(Left, LeftTree),
    balanced_tree_accum(Right, RightTree).
    
balanced_tree(ListTree, Tree) :- 
	qsort(ListTree, SortList), 
	balanced_tree_accum(SortList, Tree).
	

% ?- balanced_tree([7, 6, 5, 4, 3, 2, 1], T).
% T = instant(4, instant(2, instant(1,empty, empty), instant(3, empty, empty)), instant(6, instant(5,empty, empty), instant(7, empty, empty)))
	
