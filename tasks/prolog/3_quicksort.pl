% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 
/* Sort recursive */

qsort([],[]).
qsort([Elem], [Elem]).
qsort([Pivot|Tail], Result):-
    partition(Pivot, Tail, Smallers, Largers),
    qsort(Smallers, SortedSmalls),
    qsort(Largers, SortedLarges),
    append(SortedSmalls, [Pivot|SortedLarges],Result).

/* Segmentation list */

partition(_,[],[],[]).
partition(Pivot, [Head|Tail], [Head|Smallers], Largers):- Head =< Pivot, partition(Pivot,  Tail, Smallers, Largers).
partition(Pivot, [Head|Tail], Smallers, [Head|Largers]) :- Head >= Pivot, partition(Pivot, Tail, Smallers, Largers).
© 2019 GitHub, Inc.
