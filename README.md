# Prolog言語の練習
- 公式のチュートリアルを若干なぞったり ---> [公式](https://www.swi-prolog.org/pldoc/man?section=quickstart)
- 一番お世話になりました。本当に本当に本当にありがとうございます。 ---> [Prolog神pdf](http://www.k-techlabo.org/www_prolog/prolog_main.pdf)


## 項目 [Contents]

1. [Loading SWI-Prolog](#ID_1)
	1. おすすめSWISH(#ID_1-1)

2. [はじめの一歩](#ID_2)
	1. 推論(#ID_2-1)

3. [コンソール操作](#ID_3)

4. [ファイル操作](#ID_4)

5. [リスト](#ID_5)

5. [数式](#ID_6)

6. [Error](#ID_7)


<a id="ID_1"></a>

## 1. Loading SWI-Prolog 

まずは、ダウンロード。 ```https://www.swi-prolog.org/download/stable``` <br>

<a id="ID_1-1"></a>

### 1.1 おすすめSWISH

個人的に使いやすかった。(フクロウ君が可愛い...)　---> ```https://swish.swi-prolog.org/example/examples.swinb``` <br>
より詳しくは ---> ```https://qiita.com/rissy/items/c3e6edb368e325a65f16``` <br>

- おすすめポイント① ---> jupiter notebookみたいにnotebook方式で出来る

![swish_notebook]


クリックで出来るのでわかりやすい
![oko]
![next]
![stop]


- おすすめポイント② ---> リアルタイムで修正可能(後に追加予定...)

![realtime_swish]

- おすすめポイント③ ---> ダウンロードとか印刷直接できるとか! そんなんじゃなくってもっといっぱい便利機能あるはず()

<br>

<a id="ID_2"></a>

## 2. はじめの一歩

<a id="ID_2-1"></a>

### 2.1 推論

Prologは述語論理「AはBである」に基づき作成される。<br>
例えば、事実「山本は人間である」と規則「Aが人間であるならば、Aはいずれ死ぬ」から、「山本はいずれ死ぬ」が推論できる。<br>

以下は、Prologと述語論理との対応。

- 事実
	- 述語(対象) 
	- ex) ```human(yamamoto)```は、yamamotoはhumanであるという事実

- 規則
	- 帰結 :- 条件 
	- ex) ```mortal(A) :- human(A)```は、Aがhumanならば、Aはmortalであるという規則
	- P => Q (PならばQ)は Q :- P

以下は一連の流れ<br>

human.plを読み込み済み。(公式より)

``` prolog:human.pl
human(yamamoto).
mortal(A) :- human(A).
```

処理に対して質問する

```prolog
?- human(yamamoto). /* ユーザーからの入力(質問) */
true. /* 処理からの出力 */

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

### 2.2 単一化

- 変数に代入する操作。真理値ではないことに注意
	- ex) P(X,b) = P(X,Y) ---> X=a, Y=b ---> P(a,b)
	- ex) P(X,X) = p(Y,Z) ---> Y=X, Z=X ---> P(X,X)
	- ex) P(X,f(X,b)) = P(a,Y) ---> X=a,Y=f(a,b) ---> P(a,f(a,b))


### 2.3 使用可能linuxのコマンド例

- pwd
- ls
- make(更新)


### 2.4 Prologの基本の基本

- 行の終末には ``` . ``` ピリオドを忘れない。

- ``` ?- ```以降の入力は質問
	- human(yamamoto)は、human(yamamoto)の真or偽を質問 

- ```/ * ブロックコメントアウトです * /``` ```% 一行コメントアウトです```

- ```halt```強制終了

- 大文字アルファベットは変数

-　```" "```は文字コードか文字列(若干ややこしいから使いたくない)

- デバッグ ```trace``` デバッグ解除 ```notrace```

### 2.5 キーボード入力

```prolog
?- read(X).
|: test. % ユーザーの入力
X = test.
```


### 2.6 *.plファイルの読み込み

- 一番左にある```File```項目の```Consult```を選択。*.plファイルが読み込まれると、緑色(default)のコンパイルメッセージが出力される。

![select_consult]

成功すると```true.```<br>
失敗すると```ERROR: source_sink `likes' does not exist```

- もしくは、``` consult('*.pl').```


![loading_pl]


### 2.7 コンソールでルールの作成

「ルール」helloと入力したら、Hello worldを出力。

``` prolog
|: [user].
|: hello :- format('Hello world~n').
|: CTRL + D

?- hello.
Hello world
true.
```

### 2.8 連語

- 「かつ」は、```,``` で「または」は、```;````
	- ex) Q,Rがともに真ならばPは真である ---> P(A,B) :- Q(A),R(B).
	- ex) Aかつ(BまたはC)ならばD ---> D :- A,(B;C).
	- ex) (AまたはB)ならばC ---> C :- A;B.


- ```rengo.pl```は、以下の条件に基づく。
	- (事実) 人間の山本と溝渕、犬のポチ・ハチ・ウメキチがいる
	- (事実) 女性の山本以外は雄である
	- (規則) 男女は結婚することができる
	- (規則) 人間も犬も寿命がある


```prolog:rengo.pl

% ---- 事実 -----

% 人間
human(yamamoto).
human(mizobuchi).

% 犬
dog(pochi).
dog(hachi).
dog(umekichi).

% 性別
male(mizobuchi)
male(pochi).
male(hachi).
male(umekichi).

female(yamamoto).

% ---- 規則 -----

% 連語表現
% 結婚
marriageable(A,B) :- male(A),female(B).
marriageable(A,B) :- male(B),female(A).

% 寿命
martal(A) :- human(A).
martal(A) :- dog(A).
```

### 2.9 否定

- ```rengo.pl```は、以下の条件に基づく。
	- (事実) 人間の山本と犬のポチ・ハチ・ウメキチがいる
	- (事実) 女性の山本以外は雄である
	- (規則) 動物は死んでいないならば寿命がある


```prolog:not.pl
% ---- 事実 -----

% 人間
human(yamamoto).

% 犬
dog(pochi).
dog(hachi).
dog(umekichi).

% 性別
male(pochi).
male(hachi).
male(umekichi).

female(yamamoto).

% ---- 規則 -----
% 否定表現
% 寿命
mortal(A) :- animal(A), not(deceased(A)).
```

***

<a id="ID_3"></a>


## 3. コンソール操作

- ファイルではなく直接コンソールで試すときは、```[user].```モジュールを定義する。

like.plを読み込み済み。(公式より)

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

質問```likes(sam,X)```を入力しEnterを押すと
```prolog
?- likes(sam,X).
X = dahl 
```

```X = dahl```の後に、入力待ち状態になるので
ルールに対して、質問するときは、```;```

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

それ以上回答がいらないときは、```Enter```

``` prolog
?- likes(sam,X).
X = dahl .
```

### 3.1 候補

``` prolog
?- listing(mild).
mild(dahl).
mild(tandoori).
mild(kurma).

true.
```

***

<a id="ID_4"></a>

## 4. ファイル操作

### 4.1 ファイル読み込み

- ``` swipl *.pl ```

### 4.2 作業ディレクトリ(出来なかった)

- ``` working_directory(A).```

### 4.3 ディレクトリ変更(出来なかった)

- ``` working_directory((A,'c:/Users/test').```

### 4.4 ソースファイルの分割

- ``` :- multifile(test1/4).```
- 最後に読み込まれたファイルの定義のみが有効にならないようにする(定義の上書き保存を防ぐ)

### 4.4 ファイルへの出力

- ```tell("test.txt"). true.```


### 4.5 別 *plファイルの読み込み

- ```include```で読み込む

- ex) ```include1.pl```と```include2.pl```を```include12.pl```で読み込む。

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

% 別*plファイルの読み込み
:- include('include1.pl').
:- include('include2.pl').
```

***

<a id="ID_5"></a>

## 5. リスト

- 複数の要素を書き並べるための可変長のデータ構造
	- ex) yamamoto, mizobuchi, sasakiを含むリスト ---> [yamamoto,mizobuhi,sasaki] (pythonと一緒。)
	- ex) 二重リストもできる ---> [yamamoto,mizobuchi,[kaoru,tomoya],sasaki]
	- ex) 空リスト ---> []
	- ex) リストの連結構造？？ ---> [yamamoto|mizobuchi] = [kaoru,tomoya,yuki]. yamamoto = kaoru, mizobuchi = [tomoya,yuki]

以下、listの定義。

```prolog:list.pl
% 空リスト
list([]).
% Lがリストの時Lの先頭に任意の要素を加えたものはリストである
list([_|L]) :- list(L).
```


### 5.1 リストの単一化

- [X,Y]と[a,b] ---> X=a,Y=b

- [X|Y]と[a,b,c] ---> X=a,Y=[b,c]
	- [a|X] ---> 先頭の要素がaで残りがXであるようなリスト
	- [a,b|X] ---> 先頭からa,bと並び、残りがXであるようなリスト
	- ※注意 [a|b,Y] ---> パイプの右に2つ以上の要素を並べることはできない
	- ※注意 [a|X] ---> aは要素でXはリスト

- [a,b|X]と[a,b] ---> X=[],[a,b]


### 5.2 append
```append(List1,List2,List1 and List2)```

- 連結
	- ex) append([1,2,3],[4,5,6],X). ---> X = [1,2,3,4,5,6]
- 末尾取得
	- ex) append([1,2,3],X,[1,2,3,4,5]). ---> X = [4,5]
- 前取得
	- ex) append(X,[3,4,5],[1,2,3,4,5]) ---> X = [1,2]



以下、appendがよくわからなかったので、appendを遊び倒したサイト(http://basicwerk.com/blog/archives/1637)を遊び倒した。


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

```


### 5.3 sort
- リストの要素を整列


***

<a id="ID_6"></a>

## 6. 数式

- 数式は```is```を使う
- is(変数,計算式) ---> A is 1+2. × 3 is A+2

![math_is]


### 6.1 変数

- 単一化に用いる ---> 英大文字で始まる記号列 A or アンダーバーで始まる記号列 _variable


### 6.2 自作演算子(よくわかってない)

- ```op(結合の強さ,結合の方向,演算子のシンボル)```で、ユーザー独自に演算子を定義できる。
	- ex) op(500,yfx,plus). ?- A = 1 plus 2. ---> A = 1 plus 2.

### 6.3 比較演算子

- 等しい ---> ==
- 等しい数値 ---> =:=
	- ex) 2 =:= 1+1. true.
- 異なる数値 ---> =\=
	- ex) 12 =\= 24. true.
	
- 異なる式 ---> \==
	- ex) a \== b. true.
- 不等号 ---> <,>,=<,>=


***

<a id="ID_7"></a>


## [Error]

Syntax error: Unexpected end of file

- 原因 構文の後ろに . 付け忘れ


***

<a id="ID_7"></a>

## 7. 辞書

- make:
	- ファイルの上書き保存
