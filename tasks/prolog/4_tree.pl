instant(empty, empty, empty).

% Definition of balanced_tree predicate

balanced_tree([], empty).
balanced_tree(L, T) :-
    qsort(L, Sorted),
    make_tree(Sorted, T).

% Procedure for making tree T from asc. sorted list L

make_tree([], empty).
make_tree(L, T) :-
        % N is length of the list
        length(L, N),
	N_Mid is N // 2,

	% Getting the middle element of list - the Root of current Tree
	get_elem(L, N_Mid, Root),

	%Getting the left part of list - the left child of Tree Root
	sublist(L, 0, N_Mid, 0, LList),

	%Getting the right part of list - the right child of Tree Root
	sublist(L, N_Mid+1, N, 0, RList),

	%Definition of the future Tree
	T = instant(Root, LTree, RTree),

	% Making Trees from Lists
	make_tree(RList, RTree),
	make_tree(LList, LTree).


% Procedure getting element Elem from list L by its index N
% (indexing from zero)

get_elem([X|L], 0, X).
get_elem([X|L], N, Elem) :-
	N1 is N - 1,
	get_elem(L, N1, Elem).


% Procedure getting Sublist from list L (from N1 to N2-1)

sublist([X|L], N1, N2, N, Sublist) :-
	N < N1,
	sublist(L, N1, N2, N+1, Sublist).

sublist([X|L], N1, N2, N, [X|Sublist]) :-
	N >= N1,
	N < N2,
	sublist(L, N1, N2, N+1, Sublist).

sublist(L, N1, N2, N, []) :-
	N >= N2.


% Procedure for sorting from previous task

qsort([],[]).
qsort([H|T], K) :-
	divide(H,T,L,G),
	qsort(L,K1),
	qsort(G,K2),
	append(K1, [H|K2], K).

divide(H,[],[],[]).
divide(H,[X|T],[X|L],G) :-
	X=<H,
	divide(H,T,L,G).

divide(H,[X|T],L,[X|G]) :-
	X>H,
	divide(H,T,L,G).




