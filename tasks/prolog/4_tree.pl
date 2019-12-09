% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

pivot(_, [], [], []).
pivot(Pivot, [Head|Tail], [Head|Left], Right) :- 
	Pivot >= Head, 
	pivot(Pivot, Tail, Left, Right). 

qsort([], []).
pivot(Pivot, [Head|Tail], Left, [Head|Right]) :- 
	pivot(Pivot, Tail, Left, Right).

qsort([Head|Tail], M) :- 
	pivot(Head, Tail, Left, Right), 
	qsort(Left, LeftM), 
	qsort(Right, RightM),
	append(LeftM, [Head|RightM], M).

split(List, Left, Right):-
    append(Left, Right, List),
    length(List, Len),
    Half is Len div 2,
    length(Left, Half).

create_balanced_tree([], empty).
create_balanced_tree(List, instant(Root, Left, Right)):-
    split(List, LeftList, [Root|RightList]),
    create_balanced_tree(LeftList, Left),
    create_balanced_tree(RightList, Right).

balanced_tree(L,T):-
	qsort(L,K),
	create_balanced_tree(K,T).
	
/*
?- balanced_tree([4,3,2,9,8,6,5], T).
T = instant(5, instant(3, instant(2, empty, empty), instant(4, empty, empty)), instant(8, instant(6, empty, empty), instant(9, empty, empty))) 
?- balanced_tree([],T).
T = empty 
*/
