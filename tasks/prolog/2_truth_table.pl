and(A,B) :- A, B.
or(A,B) :- A; B.
xor(A,B) :- A \= B.
not(A) :- \+ A.
equ(A,B) :- A = B.

bool(true).
bool(fail).

calc(E, true):- E, !.
calc(_, fail).

truth_table(A, B, E):- bool(A),bool(B),
	write(A), write(' '), write(B), write(' '),
	calc(E, R), writeln(R), fail.
truth_table(_,_,_):- nl, true.


%?- truth_table(A, B, or(A, not(xor(A, B)))).
%true true true
%true fail true
%fail true fail
%fail fail true