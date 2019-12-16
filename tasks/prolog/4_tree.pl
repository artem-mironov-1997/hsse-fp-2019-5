% используя предикат quicksort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

quicksort(L,K):-
	L = [Head|Tail],
	part(Head, Tail, List1, List2),
	quicksort(List1, Srt1),
	quicksort(List2, Srt2),
	append(Srt1, [Head|Srt2], K).

quicksort([], []).

part(Current, [Head|Tail], [Head|LowEq], High):-
	Current >= Head,
	part(Current, Tail, LowEq, High).

part(Current, [Head|Tail], LowEq, [Head|High]):-
	part(Current, Tail, LowEq, High).

part(_, [], [], []).

split(List, Left, Right):-
	append(Left, Right, List),
	length(List, Len),
	Half is Len  div 2,
	length(Left, Half).

tree([], empty).

tree(List, instant(Root, LeftLeef, RightLeef)):-
	split(List, LeftList, [Root|RightList]),
	tree(LeftList, LeftLeef),
	tree(RightList, RightLeef).

balanced_tree(L, T):-
	quicksort(L, SL),
	tree(SL, T).

%========================================================================================

start:-
  Empty_list = [],
  balanced_tree(Empty_list, Empty_result),
	writeln(Empty_result), nl,
	List = [7, 3, 21, 42, 71, 8, 59, 6, 1],
	balanced_tree(List, Result),
	writeln(Result).

%========================================================================================

/*
instant(
  ROOT: 8,
  LEFT: instant(
    ROOT: 6,
    LEFT: instant(
      ROOT: 3,
      LEFT: instant(
        ROOT: 1,
        LEFT: empty,
        RIGH: empty
      ),
      RIGH: empty
    ),
    RIGH: instant(
      ROOT: 7,
      LEFT: empty,
      RIGH: empty
    )
  ),
  RIGH: instant(
    ROOT: 59,
    LEFT: instant(
      ROOT: 42,
      LEFT: instant(
        ROOT: 21,
        LEFT: empty,
        RIGH: empty
      ),
      RIGH: empty
    ),
    RIGH: instant(
      ROOT: 71,
      LEFT: empty,
      RIGH: empty
    )
  )
)
*/

%========================================================================================
