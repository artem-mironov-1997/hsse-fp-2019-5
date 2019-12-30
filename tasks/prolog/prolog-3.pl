% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
qsort([],[]).   

qsort([Head|Tail], SortList) :- split(Head, Tail, LeftPart, RightPart),
                              qsort(LeftPart, LeftSortList),
                              qsort(RightPart, RightSortList),
                              append(LeftSort, [Head|RightSortList], SortList).

split(X, [], [], []).
split(X, [Y|Tail], [Y|LeftPart], RightPart) :- X > Y, split(X, Tail, LeftPart, RightPart).
split(X, [Y|Tail], LeftPart, [Y|RightPart]) :- split(X, Tail, LeftPart, RightPart).

sort:-
	Massiv = [-23, 19, 157, 88, -10, 0, -14, 26, 78, -3, 41, 11, 177, -56],
	qsort(Massiv, SortMassiv),
	write(SortMassiv).

% Results
% ?- sort.
% [-56, -23, -14, -10, -3, 0, 11, 19, 26, 41, 78, 88, 157, 177]
% true 


