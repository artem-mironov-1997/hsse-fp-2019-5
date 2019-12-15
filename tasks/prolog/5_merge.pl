% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([],L,L).
mrg(L,[],L).

mrg([Head1|Tail1],[Head2|Tail2],[Head1|R]) :- Head1 < Head2, mrg(Tail1,[Head2|Tail2],R).
mrg([Head1|Tail1],[Head2|Tail2],[Head2|R]) :- Head1 >= Head2, mrg([Head1|Tail1],Tail2,R).

% ?- mrg([1,4,7],[2,3,5,6],R).
% R = [1, 2, 3, 4, 5, 6, 7] .
