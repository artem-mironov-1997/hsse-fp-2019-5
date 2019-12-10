% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

mass(_,[],[],[]).

% Head - H, T - tail
mass(sort,[H|T],[H|L1],L2) :- 	
	H =< sort, 
	mass(sort,T,L1,L2).
	
mass(sort,[H|T],L1,[H|L2]) :- 
	H > sort, 
	mass(sort,T,L1,L2).

qsort([H|T],R) :-
    mass(H,[H|T],[H1|L1],L2),
    qsort(L1,R1), 
	qsort(L2,R2),
    append(R1,[H1|R2],R).
	
qsort([],[]).

?- qsort([3,4,1,6],K), writeln(K).
% [1,3,4,6]
