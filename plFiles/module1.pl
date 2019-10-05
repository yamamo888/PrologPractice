:- module(mdA, []).

wa(N1,N2,Ans) :- var(N1), N1 is Ans - N2, !.
wa(N1,N2,Ans) :- var(N2), N2 is Ans - N1, !.
wa(N1,N2,Ans) :- var(Ans), Ans is N1 + N2.