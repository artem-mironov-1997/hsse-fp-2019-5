% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

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


split(List, Left, Right):-
    append(Left, Right, List),
    length(List, Length),
    Half is  Length div 2,
    length(Left, Half).

bin_tree([], empty).

bin_tree(List, instant(Root, Left, Right)):-
    split(List, LeftList, [Root|RightList]),
    bin_tree(LeftList, Left),
    bin_tree(RightList, Right).

balanced_tree(L,T):-
	qsort(L,K),
	bin_tree(K,T).