% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

part(_,[],[],[]).
qsort([],[]).

part(X, [Head|Tail], [Head|Lowest], Highest):-
	X > Head,
	part(X, Tail, Lowest, Highest).
part(X, [Head|Tail], Lowest, [Head|Highest]):-
	part(X, Tail, Lowest, Highest).

qsort(L,K):-
	L = [Head|Tail],
	part(Head, Tail, List1, List2),
	qsort(List1, Sorted1),
	qsort(List2, Sorted2),
	append(Sorted1, [Head|Sorted2], K).

example:- List = [-7, -8, 1, 7, 0, 5], qsort(List, Sorted), write(Sorted).	