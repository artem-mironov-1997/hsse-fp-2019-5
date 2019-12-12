% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort(L,K):-q_sort(L,[],K).
q_sort([],Acc,Acc).
q_sort([H|T],Acc,Sorted):-
	change(H,T,L1,L2),
	q_sort(L1,Acc,Sorted1),q_sort(L2,[H|Sorted1],Sorted).
change(_,[],[],[]).
change(H,[X|T],[X|L],G) :- X>H,change(H,T,L,G).
change(H,[X|T],L,[X|G]) :- X=<H,change(H,T,L,G).

split(List, Left, Right):-
    append(Left, Right, List),
    length(List, Length),
    Half is div(Length, 2),
    length(Left, Half).

balanced_tree_1([], empty).
balanced_tree_1(List, instant(Root, Left, Right)) :-
	split(List, LeftPart, [Root|RightPart]),
	balanced_tree_1(LeftPart, Left),
	balanced_tree_1(RightPart, Right).

balanced_tree(List, Tree) :-
	qsort(List, SortedList),
	balanced_tree_1(SortedList, Tree).

%?- balanced_tree([], T).
%T = empty ;
%
%?- balanced_tree([2,3,1,5,7,10,8], T).
%T = instant(5, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(8, instant(7, empty, empty), instant(10, empty, empty))) ;
%false.