% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
qsort([], []).
qsort([Head | Tail], Sorted) :-
    partition(Head, Tail, Left, Right),
    qsort(Left, SortedLeft),
    qsort(Right, SortedRight),
    append(SortedLeft, [Head | SortedRight], Sorted).

partition(H, [], [], []).
partition(H, [X | T], [X | L], G) :- X =< H, partition(H, T, L, G).
partition(H, [X | T], L, [X | G]) :- X > H, partition(H, T, L, G).


divided(List, LeftSide, RightSide) :-
    append(LeftSide, RightSide, List),
    length(List, Len),
    LengthMoiety is Len div 2,
    length(LeftSide, LengthMoiety).

tree_fun_utils([], empty).
tree_fun_utils(List, instant(Root, LeftSide, RightSide)):-
    divided(List, LeftList, [Root | RightList]),
    tree_fun_utils(LeftList, LeftSide),
    tree_fun_utils(RightList, RightSide).

balanced_tree(L, T) :-
    qsort(L, SL),
    tree_fun_utils(SL, T).
