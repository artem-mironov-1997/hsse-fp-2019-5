qsort(L,K) :- i_sort(L,[],K).
i_sort([],Acc,Acc).
i_sort([H|T],Acc,R) :- insert(H,Acc,Acc1), i_sort(T,Acc1,R).
   
insert(X,[Y|T],[Y|T1]) :- X > Y, insert(X,T,T1).
insert(X,[Y|T],[X,Y|T]) :- X =< Y.
insert(X,[],[X]).