qsort([],[]).
qsort([H|T], K) :-
	divide(H,T,L,G),
	qsort(L,K1),
	qsort(G,K2),
	append(K1, [H|K2], K).

% Method for division List into 2 parts - more and less than H element
%
divide(H,[],[],[]).
divide(H,[X|T],[X|L],G) :-
	X=<H,
	divide(H,T,L,G).

divide(H,[X|T],L,[X|G]) :-
	X>H,
	divide(H,T,L,G).
