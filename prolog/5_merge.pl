% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2
% определяет список R, составленный из этих элементов

 mrg([],List,List).
 mrg(List,[],List).

mrg([HeadOfFirst|FirstList],[HeadOfSecond|SecondList],[HeadOfFirst|Result]) :-
     HeadOfFirst < HeadOfSecond,
     mrg(FirstList,[HeadOfSecond|SecondList],Result).

 mrg([HeadOfFirst|FirstList],[HeadOfSecond|SecondList],[HeadOfSecond|Result]) :-
     HeadOfFirst >= HeadOfSecond,
     mrg([HeadOfFirst|FirstList],SecondList,Result).
