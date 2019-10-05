% ---- éñé¿ -----

% êlä‘
human(yamamoto).
human(mizobuchi).

% å¢
dog(pochi).
dog(hachi).
dog(umekichi).

% ê´ï 
male(mizobuchi)
male(pochi).
male(hachi).
male(umekichi).

female(yamamoto).

% ---- ãKë• -----

% òAåÍï\åª
% åãç•
marriageable(A,B) :- male(A),female(B).
marriageable(A,B) :- male(B),female(A).

% éıñΩ
martal(A) :- human(A).
martal(A) :- dog(A).
