% ---- ���� -----

% �l��
human(yamamoto).
human(mizobuchi).

% ��
dog(pochi).
dog(hachi).
dog(umekichi).

% ����
male(mizobuchi)
male(pochi).
male(hachi).
male(umekichi).

female(yamamoto).

% ---- �K�� -----

% �A��\��
% ����
marriageable(A,B) :- male(A),female(B).
marriageable(A,B) :- male(B),female(A).

% ����
martal(A) :- human(A).
martal(A) :- dog(A).
