$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([], L1, L1).
mrg(L2, [], L2).

mrg([List1|Tail1], [List2|Tail2], [List1|TailResult]) :- List1 < List2, mrg(Tail1, [List2|Tail2], TailResult), !.
mrg([List1|Tail1], [List2|Tail2], [List2|TailResult]) :- mrg([List1|Tail1], Tail2, TailResult).
