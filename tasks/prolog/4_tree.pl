% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

consult(['3_quicksort.pl']).

balanced_tree(L,T):-
	qsort(L,Sorted),
	balancing(Sorted,T).

split(List, L, R):-
	append(L, R, List),
	length(List, Length),
	Mid is Length div 2,
	length(L, Mid).
	
balancing(List, instant(Root, L, R)):-
	split(List, LeafLeft, [Root|LeafRight]),
	balancing(LeafLeft, L),
	balancing(LeafRight, R).

balancing([], empty).

% ?- balanced_tree([1,-1,-2,0,9,19,-13,3,7,8],T).
% T = instant(3, instant(-1, instant(-2, instant(-13, empty, empty), empty), instant(1, instant(0, empty, empty), empty)), instant(9, instant(8,instant% (7, empty, empty), empty), instant(19, empty, empty))) 
