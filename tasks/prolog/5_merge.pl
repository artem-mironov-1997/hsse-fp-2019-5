% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2
% определяет список R, составленный из этих элементов

mrg(L1, L2, R):-
	L1 = [Head1|Tail1],
	L2 = [Head2|Tail2],
	merge([Head1|Tail1],[Head2|Tail2], R).

mrg(L1, [], L1).
mrg([], L2, L2).
mrg([], [], []).

merge([Head1|Tail1], [Head2|Tail2], [Head1|Tail]):-
	Head1 < Head2, !,
	merge(Tail1, [Head2|Tail2], Tail).

merge([Head1|Tail1], [Head2|Tail2], [Head2|Tail]):-
	merge([Head1|Tail1], Tail2, Tail).

merge(L1, [], L1).
merge([], L2, L2).
merge([], [], []).

%========================================================================================

test:-
	List1 = [6, 71, 23],
	List2 = [47, 39, 8],
	List3 = [26, 92, 11],
	write(List1), write(' merged with '), write(List2), nl,
	mrg(List1, List2, Result1),
	write(Result1), nl,
	write(List1), write(' merged with '), write(List3), nl,
	mrg(List1, List3, Result2),
	write(Result2), nl,
	write(List3), write(' merged with '), write(List2), nl,
	mrg(List3, List2, Result3),
	write(Result3).

%========================================================================================

[6,71,23] merged with [47,39,8]
[6,47,39,8,71,23]
[6,71,23] merged with [26,92,11]
[6,26,71,23,92,11]
[26,92,11] merged with [47,39,8]
[26,47,39,8,92,11]

%========================================================================================
