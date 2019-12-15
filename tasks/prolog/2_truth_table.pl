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
and(A,B) :- A, B.
or(A,B) :- A; B.
not(A,B) :- \+ A.
equ(A,B) :- or(and(A,B), and(not(A),not(B))).
xor(A,B) :- not(equ(A,B)).

bool_flag(true).
bool_flag(fail).

calc(Exp,true) :- Exp, !.
calc(_,fail).

truth_table(A,B,Exp) :-
    bool_flag(A),
    bool_flag(B),
    calc(Exp,Res),
    write(A),
    write('\t'),   
    write(B),
    write('\t'),
    writeln(Res),
    fail.
    
% ?-truth_table(A,B,and(A,or(A,B))).

% true true true
% true fail true
% fail true fail
% fail fail fail    
