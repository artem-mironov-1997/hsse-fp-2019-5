 
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
 
and(A, B) :- A, B.

or(A, B) :- A; B.

xor(A, B) :- or(A), A \= B.

not(A) :- A = fasle.

equ(A,B) :- A = B.

%  truth_table(A,B, expression)    
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail
%  

bool(true).
bool(fail).

evaluate(E, true) :- E, !.
evaluate(_, false).

printTable(A,B,R) :- write(A),write('\t'),write(B),write('\t'),writeln(R).

truth_table(A,B,E) :- bool(A),bool(B),evaluate(E,R),printTable(A,B,R),false. 