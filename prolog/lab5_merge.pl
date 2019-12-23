mrg(L1, L2, R):- merge(L1, L2, R).
merge([],[],[]).
merge(L1, [], L1).
merge([], L1, L1).

merge(L1, L2, R) :- 
		L1 = [H1|T1], 
		L2 = [H2|_], 
		H1 =< H2, 
		R = [H1|TResult], 
		mrg(T1, L2, TResult).
merge(L1, L2, R) :- 
		L1 = [H1|_], 
		L2 = [H2|T2], 
		H1 > H2, 
		R = [H2|TResult],  
		mrg(L1, T2, TResult).


%?- mrg([-11,5],[],R).
%R = [-11, 5]

%?- mrg([],[9,10],R).
%R = [9, 10]

%?- mrg([],[],R).
%R = []

%?- mrg([-7,-5,17,1],[-3,7,9,34],R).
%R = [-7, -5, -3, 7, 9, 17, 1, 34]