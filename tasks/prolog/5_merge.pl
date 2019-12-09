% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2
% определяет список R, составленный из этих элементов
mrg([], [], []).
mrg([], List, List).
mrg(List, [], List).

mrg([Head1 | Tail1], [Head2 | Tail2], [Head1 | TailRes]) :-
    Head1 < Head2,
    mrg(Tail1, [Head2 | Tail2], TailRes),
    !.

mrg([Head1 | Tail1], [Head2 | Tail2], [Head2 | TailRes]) :-
    mrg([Head1 | Tail1], Tail2, TailRes).

/*
?- mrg([3,6,9],[2,4,6],L).
L = [2, 3, 4, 6, 6, 9].

?- mrg([3,6,9,2],[],L).
L = [3, 6, 9, 2] 

?- mrg([],[543,8,766,423],L).
L = [543, 8, 766, 423] 
*/
