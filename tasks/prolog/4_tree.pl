% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([], []).
qsort([H|T], Sorted):-
	pivoting(H, T, L1, L2),
	qsort(L1, Sorted1),
	qsort(L2, Sorted2),
	append(Sorted1, [H|Sorted2], Sorted).
   
pivoting(_, [], [], []).
pivoting(H1, [X|T], [X|L], G):- X =< H1, pivoting(H1, T, L, G).
pivoting(H1, [X|T], L, [X|G]):- X > H1, pivoting(H1, T, L, G).

split(Middle,[Head|Tail],[Head|L1],L2) :- 
    Head =< Middle, 
    split(Middle,Tail,L1,L2). 

split(Middle,[Head|Tail],L1,[Head|L2]) :- 
    Head > Middle,
    split(Middle,Tail,L1,L2).

split(_,[],[],[]).

div(L, A, B) :-
    append(A, B, L),
    length(L, N),
    Half is N div 2,
    length(A, Half).   

balanced_tree(L, T) :-
    qsort(L, SortL),
    build_binary_tree(SortL,T).

build_binary_tree(L, instant(Root, Left, Right)) :-
	div(L,L1,[Root|L2]),
    balanced_tree(L1,Left),
    balanced_tree(L2,Right).

build_binary_tree([], empty).


% ?- balanced_tree([4,3,5,1,2],T).
% T = instant(3, instant(2, instant(1, empty, empty), empty), instant(5, instant(4, empty, empty), empty))
% false