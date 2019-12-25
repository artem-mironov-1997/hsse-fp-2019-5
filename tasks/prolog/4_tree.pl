qsort([], []).

divide(X, [],[],[]).
divide(X, [Y|T], [Y|Lhs], Rhs) :- X > Y, divide(X, T, Lhs, Rhs).
divide(X, [Y|T], Lhs, [Y|Rhs]) :- divide(X, T, Lhs, Rhs).

qsort([X|Tail], Result) :-
	divide(X, Tail, Left, Right),
	qsort(Left, SortedLeft),
	qsort(Right, SortedRight),
	append(SortedLeft, [X|SortedRight], Result).

separate(L, A, B) :-
    append(A, B, L),
    length(L, N),
    Half is N div 2,
    length(A, Half).   

balanced_tree(L, T) :-
    qsort(L, SortL),
    build_balanced_tree(SortL,T).

build_balanced_tree(L, instant(Root, Left, Right)) :-
	separate(L,L1,[Root|L2]),
    balanced_tree(L1,Left),
    balanced_tree(L2,Right).

build_balanced_tree([], empty).

%?-build_balanced_tree([-4, 2, -2, 0, -5], Tree).
%Tree = instant(-2, instant(2, instant(-4, empty, empty), empty), instant(0, instant(-5, empty, empty), empty))
    