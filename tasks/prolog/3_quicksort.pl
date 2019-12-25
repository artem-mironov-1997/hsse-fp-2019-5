qsort([], []).

divide(X, [],[],[]).
divide(X, [Y|T], [Y|Lhs], Rhs) :- X > Y, divide(X, T, Lhs, Rhs).
divide(X, [Y|T], Lhs, [Y|Rhs]) :- divide(X, T, Lhs, Rhs).

qsort([X|Tail], Result) :-         
	divide(X, Tail, Left, Right),
	qsort(Left, SortedLeft),
	qsort(Right, SortedRight),
	append(SortedLeft, [X|SortedRight], Result).

%?- qsort([-4, 2, -2, 0, -5], Sorted).
%Sorted = [-5, -4, -2, 0, 2]