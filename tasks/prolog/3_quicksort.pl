% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

break2(_,[],[],[]).    
break2(X,[HEAD|TAIL], [HEAD|S],L):- X>HEAD,!,break2(X,TAIL,S,L).    
break2(X,[HEAD|TAIL], S,[HEAD|L]):- break2(X,TAIL,S,L).    
conc([],L,L).    
conc([X|L1],L2,[X|L3]):-conc(L1,L2,L3).    
qsort([],[]).    
qsort([X|TAIL],SORTLIST) :-break2(X, TAIL, S, L),    
			   qsort(S, SORTS),    
			   qsort(L, SORTL),    
			   conc(SORTS,[X|SORTL],SORTLIST).


%qsort([5,4,3,6],A).
% A = [3, 4, 5, 6]

