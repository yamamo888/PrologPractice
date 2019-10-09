% カウント

% --- リストの要素自体を数える --- 
% リストの中身が空の場合
count([],0).
count([X|M], N) :- count(M,L), N is X + L.


% --- リストの長さを数える ---
count([],0).
count([_|L],N) :- count(L,M), N is M + 1.