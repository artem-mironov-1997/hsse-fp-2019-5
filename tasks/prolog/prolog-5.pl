% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов
mrg(L1, L2, R):-
	L1 = [Head1|Tail1],
	L2 = [Head2|Tail2],
	merge([Head1|Tail1],[Head2|Tail2], R).

mrg(L1, [], L1).
mrg([], L2, L2).
mrg([],[],[]).

merge([Head1|Tail1], [Head2|Tail2], [Head1|Tail]):-
	Head1 < Head2, !,
	merge(Tail1, [Head2|Tail2], Tail).

merge([Head1|Tail1], [Head2|Tail2], [Head2|Tail]):-
	merge([Head1|Tail1], Tail2, Tail).

merge(L1, [], L1).
merge([], L2, L2).
merge([],[],[]).

merge([], [], []).
merge([], List2, List2).
merge(List1, [], Lis1).
merge([Head1|Tail1], [Head2|Tail2], [Head1|Root]) :- Head1 =< Head2, !, merge(Tail1, [Head2|Tail2], Root).
merge([Head1|Tail1], [Head2|Tail2], [Head2|Root]) :- merge([Head1|Tail1], Tail2, Root).

merge:-
	List1 = [9,6,8],
	List2 = [7,11,1],
	List3 = [],
	write(List1), write(' merged with '), write(List2), nl,
	mrg(List1,List2,Result1),
	write(Result1), nl,
	write(List1), write(' merged with '), write(List3), nl,
	mrg(List1,[],Result2),
	write(Result2), nl,
	write(List3), write(' merged with '), write(List2), nl,
	mrg([],List2,Result3),
	write(Result3).

% Resuts
% [9, 6, 8] merged with [7, 11, 1]
% [1, 6, 7, 8, 9, 11]
% [9, 6, 8] merged with []
% [9, 6, 8]
% [] merged with [7, 11, 1]
% [7, 11, 1]
% true