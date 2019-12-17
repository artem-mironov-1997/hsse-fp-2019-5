% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

% NOTE: Handle situation when there's nothing to ...
% ... sort.
qsort([], []).

% NOTE: Defining rules for the recursive sort.
% - Terminating rule
split(X, [],[],[]).
% - Left side 
split(X, [Y|T], [Y|Lhs], Rhs) :- X > Y, split(X, T, Lhs, Rhs).
% - Right side 
split(X, [Y|T], Lhs, [Y|Rhs]) :- split(X, T, Lhs, Rhs).

% - Sorting function
qsort([X|Tail], Result) :-         
	split(X, Tail, Left, Right),
	qsort(Left, SortedLeft),
	qsort(Right, SortedRight),
	append(SortedLeft, [X|SortedRight], Result).

/**
* Example: 
* ?- qsort([-1, 1, 0, 5, 7],Sorted).
* Sorted = [-1, 0, 1, 5, 7] 
*/
