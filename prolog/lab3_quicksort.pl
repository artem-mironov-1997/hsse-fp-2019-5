qsort([], []).
qsort([H|T], List) :- 
	pivot(H, T, L1, L2),
    qsort(L1, List1), 
	qsort(L2, List2),
    append(List1, [H|List2], List).

pivot(_, [], [], []).
pivot(Piv, [H|T], [H|LessT], LargerT) :- Piv >= H, pivot(Piv, T, LessT, LargerT).
pivot(Piv, [H|T], LessT, [H|LargerT]) :- Piv < H, pivot(Piv, T, LessT, LargerT).

%?- qsort([6,12,5,67,43,34,50],K).
%K = [5, 6, 12, 34, 43, 50, 67]
