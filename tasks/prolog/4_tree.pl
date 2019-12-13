% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort(L,K):-isort(L,[],K).
isort([],As,As).
isort([H|T],As,R):-insert(H,As,As1),isort(T,As1,R).

insert(X,[Y|T],[Y|T1]):-X>Y,insert(X,T,T1).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).

inl([N|Ns], T0, T) :-
    instant(N, T0, T1),
    inl(Ns, T1, T).
inl([], T, T).

instant(I, empty, t(I, empty, empty)).
instant(I, t(X, L, R), t(V, B, N)) :-
    (   I < X
    ->  instant(I, L, U),
        (V, B, N) = (U, X, R)
    ;   I > X
    ->  instant(I, R, U),
        (V, B, N) = (L, X, U)
    ;   (V, B, N) = (L, X, R)
    ).
    
balanced_tree([],[]):- write('empty').
balanced_tree(L,T) :- inl(L,empty,T).


?- balanced_tree([3,4,3,5,4],S).
S = t(3, empty, t(4, empty, t(5, empty, empty))) 
