% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)

boolean(A):-A=true;A=false.

and(A,B):-boolean(A),boolean(B),A,B.
or(A,B):-boolean(A),boolean(B),A;B.
xor(A,B):-boolean(A),boolean(B),A\=B.
not(A):-A=false.
equ(A,B):-boolean(A),boolean(B),A=B.

exec(A,true) :- A, !.
exec(_,false).


% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

truth_table(A,B,C) :- boolean(A), boolean(B), write(A), write('  '), write(B), write('  '), exec(C, R), writeln(R), false.
