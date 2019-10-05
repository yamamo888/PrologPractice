# Prolog����̗��K
- �����̃`���[�g���A�����኱�Ȃ������� ---> https://www.swi-prolog.org/pldoc/man?section=quickstart
- ��Ԃ����b�ɂȂ�܂����B�{���ɖ{���ɖ{���ɂ��肪�Ƃ��������܂��B ---> http://www.k-techlabo.org/www_prolog/prolog_main.pdf


## ���� [Contents]

1. [Loading SWI-Prolog](#ID_1)

2. [Getting started quickly] (#ID_2)
	1.1 [�͂��߂̈��] (#ID_2-1)
	1.2 [*.pl�t�@�C���̓ǂݍ���] (#ID_2-2)
	1.3 [�R���\�[���Ń��[���̍쐬] (#ID_2-3)
	1.4 [�N�G�����s] (#ID_1-4)
	1.5 [���] (#ID_1-5)


100. [Error]


<a id="ID_0"></a>

## Loading SWI-Prolog 

�܂��́A�_�E�����[�h�B ```https://www.swi-prolog.org/download/stable```

<br>

<a id="ID_1"></a>

## Getting started quickly

<a id="ID_1-1"></a>

## �͂��߂̈��

### ���_

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

### �P�ꉻ

- �ϐ��ɑ�����鑀��B�^���l�ł͂Ȃ����Ƃɒ���
	- ex) P(X,b) = P(X,Y) ---> X=a, Y=b ---> P(a,b)
	- ex) P(X,X) = p(Y,Z) ---> Y=X, Z=X ---> P(X,X)
	- ex) P(X,f(X,b)) = P(a,Y) ---> X=a,Y=f(a,b) ---> P(a,f(a,b))


### �g�p�\linux�̃R�}���h��

- pwd
- ls
- make(�X�V)


### Prolog�̊�{�̊�{

- �s�̏I���ɂ� ``` . ``` �s���I�h��Y��Ȃ��B

- ``` ?- ```�ȍ~�̓��͎͂���
	- human(yamamoto)�́Ahuman(yamamoto)�̐^or�U������ 

- ```/ * �u���b�N�R�����g�A�E�g�ł� * /``` ```% ��s�R�����g�A�E�g�ł�```

- ```halt```�����I��

- �啶���A���t�@�x�b�g�͕ϐ�

-�@```" "```�͕����R�[�h��������(�኱��₱��������g�������Ȃ�)

- �f�o�b�O ```trace``` �f�o�b�O���� ```notrace```

### �L�[�{�[�h����

```prolog
?- read(X).
|: test. % ���[�U�[�̓���
X = test.
```


### *.pl�t�@�C���̓ǂݍ���

- ��ԍ��ɂ���```File```���ڂ�```Consult```��I���B*.pl�t�@�C�����ǂݍ��܂��ƁA�ΐF(default)�̃R���p�C�����b�Z�[�W���o�͂����B

![select_consult]

���������```true.```<br>
���s�����```ERROR: source_sink `likes' does not exist```

- �������́A``` consult('*.pl').```


![loading_pl]

<a id="ID_1-2"></a>

### �R���\�[���Ń��[���̍쐬

�u���[���vhello�Ɠ��͂�����AHello world���o�́B

``` prolog
|: [user].
|: hello :- format('Hello world~n').
|: CTRL + D

?- hello.
Hello world
true.
```

### �A��

- �A��́A```,```
- ex) Q,R���Ƃ��ɐ^�Ȃ��P�͐^�ł��� ---> P(A,B) :- Q(A),R(B).


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

### �ے�

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

<a id="ID_1-3"></a>


## �R���\�[������

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


<a id="ID_1-4"></a>

### ���

``` prolog
?- listing(mild).
mild(dahl).
mild(tandoori).
mild(kurma).

true.
```

***

<a id="ID_1-4"></a>

## �t�@�C������

### �t�@�C���o��

### �t�@�C���̏�������

### ��ƃf�B���N�g��(�o���Ȃ�����)

- ``` working_directory(A).```

### �f�B���N�g���ύX(�o���Ȃ�����)

- ``` working_directory((A,'c:/Users/test').```

### �\�[�X�t�@�C���̕���

- ``` :- multifile(test1/4).```
- �Ō�ɓǂݍ��܂ꂽ�t�@�C���̒�`�݂̂��L���ɂȂ�Ȃ��悤�ɂ���(��`�̏㏑���ۑ���h��)

### �t�@�C���ւ̏o��

- ```tell("test.txt"). true.```


### �� *pl�t�@�C���̓ǂݍ���

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

<a id="ID_1-4"></a>

## ���X�g

- �����̗v�f���������ׂ邽�߂̉ϒ��̃f�[�^�\��
- ex) yamamoto, mizobuchi, sasaki���܂ރ��X�g ---> [yamamoto,mizobuhi,sasaki] (python�ƈꏏ�B)
- ex) ��d���X�g���ł��� ---> [yamamoto,mizobuchi,[kaoru,tomoya],sasaki]
- ex) �󃊃X�g ---> []
- ex) ���X�g�̘A���\���H�H ---> [yamamoto|mizobuchi] = [kaoru,tomoya,yuki]. yamamoto = kaoru, mizobuchi = [tomoya,yuki]


### sort
- ���X�g�̗v�f�𐮗�


***

<a id="ID_1-4"></a>

## ����

- ������```is```���g��
- is(�ϐ�,�v�Z��) ---> A is 1+2. �~ 3 is A+2

![math_is]


### �ϐ�
- �P�ꉻ�ɗp���� ---> �p�啶���Ŏn�܂�L���� A or �A���_�[�o�[�Ŏn�܂�L���� _variable


### ���쉉�Z�q(�悭�킩���ĂȂ�)
- ```op(�����̋���,�����̕���,���Z�q�̃V���{��)```�ŁA���[�U�[�Ǝ��ɉ��Z�q���`�ł���B
	- ex) op(500,yfx,plus). ?- A = 1 plus 2. ---> A = 1 plus 2.

### ��r���Z�q
- ������ ---> ==
- ���������l ---> =:=
	- ex) 2 =:= 1+1. true.
- �قȂ鐔�l ---> =\=
	- ex) 12 =\= 24. true.
	
- �قȂ鎮 ---> \==
	- ex) a \== b. true.
- �s���� ---> <,>,=<,>=




### [Error]

Syntax error: Unexpected end of file

- ���� �\���̌��� . �t���Y��



