% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

mass(_,[],[],[]).

% Head - H, T - tail
mass(sort,[H|T],[H|L1],L2) :- 	
	H =< sort, 
	mass(sort,T,L1,L2).
	
mass(sort,[H|T],L1,[H|L2]) :- 
	H > sort, 
	mass(sort,T,L1,L2).

qsort([H|T],R) :-
    mass(H,[H|T],[H1|L1],L2),
    qsort(L1,R1), 
	qsort(L2,R2),
    append(R1,[H1|R2],R).
	
qsort([],[]).

split(List, Left, Right):-
    append(Left, Right, List),
    length(List, Length),
    HalfLength is Length div 2,
    length(Left, HalfLength).

binary_tree([], empty).

binary_tree(List, instant(Root, Left, Right)):-
      split(List, LeftH, [Root|RightH]),
      binary_tree(LeftH, Left),
      binary_tree(RightH, Right).

balanced_tree(L,T) :-
	qsort(L, K),
	binary_tree(K, T).
