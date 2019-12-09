% определить предикаты:
	 and(A,B):-A,B.
	 or(A, B):-A;B.
	 not(A):- \+A.
	 xor(A, B):- or(A,B), not(and(A,B)).
	 equ(A,B):-A==B.
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности:
	truth_table(A,B,E) :- 
		member(A,[true,false]),
		member(B,[true,false]),
		(E->Result=true;Result=false),
		format('~w  ~w  ~w~n',[A,B,Result]), fail.

% Например:
% ?- truth_table(A,B,xor(not(A),and(B,or(not(A),equ(A,B))))).
% true  true  true
% true  false  false
% false  true  false
% false  false  true




