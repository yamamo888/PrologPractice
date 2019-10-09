?- append(X,Y,[a,b,c])

X = [],
Y = [a,b,c];

X = [a],
Y = [b,c];

X = [a,b],
Y = [c];

X = [a,b,c],
Y = [].
false.


% --- 以下あまり理解できていない


% jがアトムなのでくっつかない
?- append(j,[m,t],L).
false.

% 正しい動作
?- append([j],[m,t],L).
L=[j,m,t].


% --- 以下CARとCDRの例 ---

?- append(X,Y,[8,9|12]).
X=[],
Y=[8,9,12];
X=[8],
Y=[9,12].

?- append([X],[Y],[8,9]).
X=8,
Y=9.

?- append(X,[Y],[8,9,12]).
X=[8,9],
Y=12;
false.

?- append([X],Y,[8,9,12]).
X=8,
Y=[9,12].