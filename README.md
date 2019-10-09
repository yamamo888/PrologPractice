# Prolog����̗��K
- �����̃`���[�g���A�����኱�Ȃ������� ---> https://www.swi-prolog.org/pldoc/man?section=quickstart
- ��Ԃ����b�ɂȂ�܂����B�{���ɖ{���ɖ{���ɂ��肪�Ƃ��������܂��B ---> http://www.k-techlabo.org/www_prolog/prolog_main.pdf


## ���� [Contents]

1. [Loading SWI-Prolog](#ID_1)
	1. ��������SWISH (#ID_1-1)

2. [�͂��߂̈��] (#ID_2)
	1. ���_ (#ID_2-1)

3. [�R���\�[������] (#ID_3)

4. [�t�@�C������] (#ID_4)

5. [���X�g] (#ID_5)

5. [����] (#ID_6)

6. [Error] (#ID_7)


<a id="ID_1"></a>

## 1. Loading SWI-Prolog 

�܂��́A�_�E�����[�h�B ```https://www.swi-prolog.org/download/stable``` <br>

<a id="ID_1-1"></a>

### 1.1 ��������SWISH

�l�I�Ɏg���₷�������B(�t�N���E�N������...)�@---> ```https://swish.swi-prolog.org/example/examples.swinb``` <br>
���ڂ����� ---> ```https://qiita.com/rissy/items/c3e6edb368e325a65f16``` <br>

- �������߃|�C���g�@ ---> jupiter notebook�݂�����notebook�����ŏo����

![swish_notebook]


�N���b�N�ŏo����̂ł킩��₷��
![oko]
![next]
![stop]


- �������߃|�C���g�A ---> ���A���^�C���ŏC���\(��ɒǉ��\��...)

![realtime_swish]

- �������߃|�C���g�B ---> �_�E�����[�h�Ƃ�������ڂł���Ƃ�! ����Ȃ񂶂�Ȃ����Ă����Ƃ����ς��֗��@�\����͂�()

<br>

<a id="ID_2"></a>

## 2. �͂��߂̈��

<a id="ID_2-1"></a>

### 2.1 ���_

Prolog�͏q��_���uA��B�ł���v�Ɋ�Â��쐬�����B<br>
�Ⴆ�΁A�����u�R�{�͐l�Ԃł���v�ƋK���uA���l�Ԃł���Ȃ�΁AA�͂����ꎀ�ʁv����A�u�R�{�͂����ꎀ�ʁv�����_�ł���B<br>

�ȉ��́AProlog�Əq��_���Ƃ̑Ή��B

- ����
	- �q��(�Ώ�) 
	- ex) ```human(yamamoto)```�́Ayamamoto��human�ł���Ƃ�������

- �K��
	- �A�� :- ���� 
	- ex) ```mortal(A) :- human(A)```�́AA��human�Ȃ�΁AA��mortal�ł���Ƃ����K��
	- P => Q (P�Ȃ��Q)�� Q :- P

�ȉ��͈�A�̗���<br>

human.pl��ǂݍ��ݍς݁B(�������)

``` prolog:human.pl
human(yamamoto).
mortal(A) :- human(A).
```

�����ɑ΂��Ď��₷��

```prolog
?- human(yamamoto). /* ���[�U�[����̓���(����) */
true. /* ��������̏o�� */

?- mortal(yamamoto).
true.

```

``` prolog
?- consult(human).
true.

?- human(A).
A = yamamoto.

?- mortal(A).
A = yamamoto.

```

### 2.2 �P�ꉻ

- �ϐ��ɑ�����鑀��B�^���l�ł͂Ȃ����Ƃɒ���
	- ex) P(X,b) = P(X,Y) ---> X=a, Y=b ---> P(a,b)
	- ex) P(X,X) = p(Y,Z) ---> Y=X, Z=X ---> P(X,X)
	- ex) P(X,f(X,b)) = P(a,Y) ---> X=a,Y=f(a,b) ---> P(a,f(a,b))


### 2.3 �g�p�\linux�̃R�}���h��

- pwd
- ls
- make(�X�V)


### 2.4 Prolog�̊�{�̊�{

- �s�̏I���ɂ� ``` . ``` �s���I�h��Y��Ȃ��B

- ``` ?- ```�ȍ~�̓��͎͂���
	- human(yamamoto)�́Ahuman(yamamoto)�̐^or�U������ 

- ```/ * �u���b�N�R�����g�A�E�g�ł� * /``` ```% ��s�R�����g�A�E�g�ł�```

- ```halt```�����I��

- �啶���A���t�@�x�b�g�͕ϐ�

-�@```" "```�͕����R�[�h��������(�኱��₱��������g�������Ȃ�)

- �f�o�b�O ```trace``` �f�o�b�O���� ```notrace```

### 2.5 �L�[�{�[�h����

```prolog
?- read(X).
|: test. % ���[�U�[�̓���
X = test.
```


### 2.6 *.pl�t�@�C���̓ǂݍ���

- ��ԍ��ɂ���```File```���ڂ�```Consult```��I���B*.pl�t�@�C�����ǂݍ��܂��ƁA�ΐF(default)�̃R���p�C�����b�Z�[�W���o�͂����B

![select_consult]

���������```true.```<br>
���s�����```ERROR: source_sink `likes' does not exist```

- �������́A``` consult('*.pl').```


![loading_pl]


### 2.7 �R���\�[���Ń��[���̍쐬

�u���[���vhello�Ɠ��͂�����AHello world���o�́B

``` prolog
|: [user].
|: hello :- format('Hello world~n').
|: CTRL + D

?- hello.
Hello world
true.
```

### 2.8 �A��

- �u���v�́A```,``` �Łu�܂��́v�́A```;````
	- ex) Q,R���Ƃ��ɐ^�Ȃ��P�͐^�ł��� ---> P(A,B) :- Q(A),R(B).
	- ex) A����(B�܂���C)�Ȃ��D ---> D :- A,(B;C).
	- ex) (A�܂���B)�Ȃ��C ---> C :- A;B.


- ```rengo.pl```�́A�ȉ��̏����Ɋ�Â��B
	- (����) �l�Ԃ̎R�{�ƍa���A���̃|�`�E�n�`�E�E���L�`������
	- (����) �����̎R�{�ȊO�͗Y�ł���
	- (�K��) �j���͌������邱�Ƃ��ł���
	- (�K��) �l�Ԃ���������������


```prolog:rengo.pl

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
```

### 2.9 �ے�

- ```rengo.pl```�́A�ȉ��̏����Ɋ�Â��B
	- (����) �l�Ԃ̎R�{�ƌ��̃|�`�E�n�`�E�E���L�`������
	- (����) �����̎R�{�ȊO�͗Y�ł���
	- (�K��) �����͎���ł��Ȃ��Ȃ�Ύ���������


```prolog:not.pl
% ---- ���� -----

% �l��
human(yamamoto).

% ��
dog(pochi).
dog(hachi).
dog(umekichi).

% ����
male(pochi).
male(hachi).
male(umekichi).

female(yamamoto).

% ---- �K�� -----
% �ے�\��
% ����
mortal(A) :- animal(A), not(deceased(A)).
```

***

<a id="ID_3"></a>


## 3. �R���\�[������

- �t�@�C���ł͂Ȃ����ڃR���\�[���Ŏ����Ƃ��́A```[user].```���W���[�����`����B

like.pl��ǂݍ��ݍς݁B(�������)

``` prolog:like.pl
%% Demo coming from http://clwww.essex.ac.uk/course/LG519/2-facts/index_18.html
%%
%% Please load this file into SWI-Prolog
%%
%% Sam's likes and dislikes in food
%%
%% Considering the following will give some practice
%% in thinking about backtracking.
%%
%% You can also run this demo online at
%% http://swish.swi-prolog.org/?code=https://github.com/SWI-Prolog/swipl-devel/raw/master/demo/likes.pl&q=likes(sam,Food).

/** <examples>
?- likes(sam,dahl).
?- likes(sam,chop_suey).
?- likes(sam,pizza).
?- likes(sam,chips).
?- likes(sam,curry).
*/

likes(sam,Food) :-
    indian(Food),
    mild(Food).
likes(sam,Food) :-
    chinese(Food).
likes(sam,Food) :-
    italian(Food).
likes(sam,chips).

indian(curry).
indian(dahl).
indian(tandoori).
indian(kurma).

mild(dahl).
mild(tandoori).
mild(kurma).

chinese(chow_mein).
chinese(chop_suey).
chinese(sweet_and_sour).
```

����```likes(sam,X)```����͂�Enter��������
```prolog
?- likes(sam,X).
X = dahl 
```

```X = dahl```�̌�ɁA���͑҂���ԂɂȂ�̂�
���[���ɑ΂��āA���₷��Ƃ��́A```;```

```prolog
?- likes(sam,X).
X = dahl ;
X = tandoori ;
X = kurma ;
X = chow_mein ;
X = chop_suey ;
X = sweet_and_sour ;
X = pizza ;
```

����ȏ�񓚂�����Ȃ��Ƃ��́A```Enter```

``` prolog
?- likes(sam,X).
X = dahl .
```

### 3.1 ���

``` prolog
?- listing(mild).
mild(dahl).
mild(tandoori).
mild(kurma).

true.
```

***

<a id="ID_4"></a>

## 4. �t�@�C������

### 4.1 �t�@�C���o��

### 4.2 �t�@�C���̏�������

### 4.3 ��ƃf�B���N�g��(�o���Ȃ�����)

- ``` working_directory(A).```

### 4.4 �f�B���N�g���ύX(�o���Ȃ�����)

- ``` working_directory((A,'c:/Users/test').```

### 4.5 �\�[�X�t�@�C���̕���

- ``` :- multifile(test1/4).```
- �Ō�ɓǂݍ��܂ꂽ�t�@�C���̒�`�݂̂��L���ɂȂ�Ȃ��悤�ɂ���(��`�̏㏑���ۑ���h��)

### 4.6 �t�@�C���ւ̏o��

- ```tell("test.txt"). true.```


### 4.7 �� *pl�t�@�C���̓ǂݍ���

- ```include```�œǂݍ���

- ex) ```include1.pl```��```include2.pl```��```include12.pl```�œǂݍ��ށB

```prolog:include1.pl
wa(N1,N2,Ans) :- var(N1), N1 is Ans - N2,!.
wa(N1,N2,Ans) :- var(N2), N2 is Ans - N2,!.
wa(N1,N2,Ans) :- var(Ans), Ans is N1 + N2.
```

```prolog:include2.pl
wa(N1,N2,Ans) :- var(N1), N1 is Ans / N2,!.
wa(N1,N2,Ans) :- var(N2), N2 is Ans / N2,!.
wa(N1,N2,Ans) :- var(Ans), Ans is N1 * N2.
```

```prolog:include12.pl
:- encodeing(utf8).
:- module(md1,[wa/3,seki/3]).

% ��*pl�t�@�C���̓ǂݍ���
:- include('include1.pl').
:- include('include2.pl').
```

***

<a id="ID_5"></a>

## 5. ���X�g

- �����̗v�f���������ׂ邽�߂̉ϒ��̃f�[�^�\��
	- ex) yamamoto, mizobuchi, sasaki���܂ރ��X�g ---> [yamamoto,mizobuhi,sasaki] (python�ƈꏏ�B)
	- ex) ��d���X�g���ł��� ---> [yamamoto,mizobuchi,[kaoru,tomoya],sasaki]
	- ex) �󃊃X�g ---> []
	- ex) ���X�g�̘A���\���H�H ---> [yamamoto|mizobuchi] = [kaoru,tomoya,yuki]. yamamoto = kaoru, mizobuchi = [tomoya,yuki]

�ȉ��Alist�̒�`�B

```prolog:list.pl
% �󃊃X�g
list([]).
% L�����X�g�̎�L�̐擪�ɔC�ӂ̗v�f�����������̂̓��X�g�ł���
list([_|L]) :- list(L).
```


### 5.1 ���X�g�̒P�ꉻ

- [X,Y]��[a,b] ---> X=a,Y=b

- [X|Y]��[a,b,c] ---> X=a,Y=[b,c]
	- [a|X] ---> �擪�̗v�f��a�Ŏc�肪X�ł���悤�ȃ��X�g
	- [a,b|X] ---> �擪����a,b�ƕ��сA�c�肪X�ł���悤�ȃ��X�g
	- ������ [a|b,Y] ---> �p�C�v�̉E��2�ȏ�̗v�f����ׂ邱�Ƃ͂ł��Ȃ�
	- ������ [a|X] ---> a�͗v�f��X�̓��X�g

- [a,b|X]��[a,b] ---> X=[],[a,b]


### 5.2 append
```append(List1,List2,List1 and List2)```

- �A��
	- ex) append([1,2,3],[4,5,6],X). ---> X = [1,2,3,4,5,6]
- �����擾
	- ex) append([1,2,3],X,[1,2,3,4,5]). ---> X = [4,5]
- �O�擾
	- ex) append(X,[3,4,5],[1,2,3,4,5]) ---> X = [1,2]



�ȉ��Aappend���悭�킩��Ȃ������̂ŁAappend��V�ѓ|�����T�C�g(http://basicwerk.com/blog/archives/1637)��V�ѓ|�����B


```prolog:append3.pl

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


% --- �ȉ����܂藝���ł��Ă��Ȃ�


% j���A�g���Ȃ̂ł������Ȃ�
?- append(j,[m,t],L).
false.

% ����������
?- append([j],[m,t],L).
L=[j,m,t].


% --- �ȉ�CAR��CDR�̗� ---

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

```


### 5.3 sort
- ���X�g�̗v�f�𐮗�


***

<a id="ID_6"></a>

## 6. ����

- ������```is```���g��
- is(�ϐ�,�v�Z��) ---> A is 1+2. �~ 3 is A+2

![math_is]


### 6.1 �ϐ�

- �P�ꉻ�ɗp���� ---> �p�啶���Ŏn�܂�L���� A or �A���_�[�o�[�Ŏn�܂�L���� _variable


### 6.2 ���쉉�Z�q(�悭�킩���ĂȂ�)

- ```op(�����̋���,�����̕���,���Z�q�̃V���{��)```�ŁA���[�U�[�Ǝ��ɉ��Z�q���`�ł���B
	- ex) op(500,yfx,plus). ?- A = 1 plus 2. ---> A = 1 plus 2.

### 6.3 ��r���Z�q

- ������ ---> ==
- ���������l ---> =:=
	- ex) 2 =:= 1+1. true.
- �قȂ鐔�l ---> =\=
	- ex) 12 =\= 24. true.
	
- �قȂ鎮 ---> \==
	- ex) a \== b. true.
- �s���� ---> <,>,=<,>=


***

<a id="ID_7"></a>


## [Error]

Syntax error: Unexpected end of file

- ���� �\���̌��� . �t���Y��



