% --- リストの反転 ---
% 空リストの逆順は空リストである
% リスト[X|L]の逆順は、Lの逆順がR1ならば、R1の最後にXを付け加えたリストである

/* 1
reverse([],[]).
reverse([X|L],R) :- reverse(L,R1), append(R1,[X],R).
*/

/* 2
reverse([],R,R).
reverse([X|L],Y,R) :- reverse(L,[X|Y],R).
*/

% 3
reverse(L,R) :- reverse(L,[],R).
