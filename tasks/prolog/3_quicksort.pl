% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

quicksort([],[]).
quicksort([X|Tail], Sorted) :-
   split(X, Tail, Small, Big),
    quicksort(Small, SortedSmall),
    quicksort(Big, SortedBig),
    append(SortedSmall, [X|SortedBig], Sorted).

split(X, [],[],[]).
split(X, [Y|Tail], [Y|Small], Big) :-X > Y, split(X, Tail, Small, Big).
split(X, [Y|Tail], Small, [Y|Big]) :-split(X, Tail, Small, Big).

/** <examples>
?- quicksort([6,4,8,1,6,2,3], K)
*/