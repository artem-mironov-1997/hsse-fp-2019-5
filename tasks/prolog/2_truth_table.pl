bool(true).
bool(false).

not(false) :- true.
not(true) :- false.

and(X, Y):- X, Y.

or(X, Y):- X.
or(X, Y):- Y.

xor(X, Y):- X, not(Y).
xor(X, Y):- Y, not(X).

equ(X, Y):- X, Y.
equ(X, Y):- not(X), not(Y).

evaluate(Expr, true) :- Expr, !.
evaluate(Expr, false).

writeXY(X, Y):- write(X), write(" "), write(Y), write(" ").

truth_table(X, Y, Expr) :-
    bool(X),
    bool(Y),
    writeXY(X, Y),
    evaluate(Expr, Res),
    write(Res),
    write("\n"),
    fail.
