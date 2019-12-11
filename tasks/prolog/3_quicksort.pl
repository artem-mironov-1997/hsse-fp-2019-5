% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([],[]).   

qsort([X|Tail], SortedResult) :-         
	qsplit(X, Tail, Left, Right),
	qsort(Left, SortedLeft),
	qsort(Right, SortedRight),
	append(SortedLeft, [X|SortedRight], SortedResult).

qsplit(X, [],[],[]).
qsplit(X, [Y|Tail], [Y|Left], Right) :- X > Y, qsplit(X, Tail, Left, Right).
qsplit(X, [Y|Tail], Left, [Y|Right]) :- qsplit(X, Tail, Left, Right).
