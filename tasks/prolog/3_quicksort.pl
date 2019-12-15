% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).
qsort([Elem], [Elem]).
qsort([Root|Tail], Sorted):-
    partition(Root, Tail, LeftSide, RightSide),
    qsort(LeftSide, SortLeft),
    qsort(RightSide, SortedRight),
    append(SortLeft, [Root|SortedRight],Sorted).

partition(_,[],[],[]).
partition(Root, [Head|Tail], [Head|LeftSide], RightSide):- Head =< Root, partition(Root,  Tail, LeftSide, RightSide).
partition(Root, [Head|Tail], LeftSide, [Head|RightSide]) :- Head >= Root, partition(Root, Tail, LeftSide, RightSide).
