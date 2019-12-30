  
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

boolean(true).
boolean(false).

and(A, B):- A, B.

or(A, B):- A; B.
or(A,_):- A.
or(_,B):- B.

xor(A, B):- or(and(not(A), B),and(A, not(B))).

not(A) :- A, !, false.
not(_).

equ(A, B) :- A = B.

exec(A,true) :- A, !.
exec(_,false).

truth_table(A,B, Expr) :- boolean(A), boolean(B), write(A), write('  '), write(B), write('  '), exec(Expr, Result), writeln(Result), false.

% ?-truth_table(A,B,and(A,or(A,B))).

% true true true
% true fail true
% fail true fail
% fail fail fail


