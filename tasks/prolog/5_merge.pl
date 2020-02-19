
% Procedure for insertion Value into Sorted List
%
insert(Value, [], [Value]).
insert(Value, [X|L], [X|Res]) :-
    Value >= X,
    insert(Value, L, Res).

insert(Value, [X|L], [Value, X|Res]) :-
    Value < X,
    Res = L.

% Predicate for merging two sorted lists
%
mrg([], L2, L2).
mrg([X1|L1], L2, R) :-
    insert(X1, L2, R2),
    mrg(L1, R2, R).



