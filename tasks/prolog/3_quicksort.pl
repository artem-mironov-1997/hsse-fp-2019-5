% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).   

qsort([X|Tail], SortedResult) :-         
	qsplit(X, T, L, R),
	qsort(L, SL),
	qsort(R, SR),
	append(SL, [X|SR], SR).

qsplit(X, [],[],[]).
qsplit(X, [Y|T], [Y|L], R) :- X > Y, qsplit(X, T, L, R).
qsplit(X, [Y|T], L, [Y|R]) :- qsplit(X, T, L, R).