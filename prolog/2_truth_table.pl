% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

% - NOTE: Custom predicates
and(A, B) :- A, B.
or(A, B) :- A; B.
xor(A, B) :- A \= B.
not(A) :- A = fail.
equ(A,B) :- A = B.

% - NOTE: Define combinations
calculate(E, true) :- E, !.
calculate(_, fail).

% - NOTE: Defie boolean functions
bool(true).
bool(fail).

truth_table(A, B, E) :-
	bool(A),
    bool(B),
    calculate(E, R),
    format('~w ~w ~w~n', [A, B, R]),
    fail.

/*
-- NOTE: Testing
?- truth_table(A, B, and(A, or(A, B))).
true true true
true fail true
fail true fail
fail fail fail
*/
