---
title: JavaScript基础
date: "2017-04-08 06:26:35.141+01"
---

##维基百科的描述

>JavaScript，一种直译式脚本语言，是一种动态类型、基于原型的语言，内置支持类别。它的解释器被称为JavaScript引擎，为浏览器的一部分，广泛用于客户端的脚本语言，最早是在HTML网页上使用，用来给HTML网页增加动态功能。然而现在JavaScript也可被用于网络服务器，如Node.js。

>在1995年时，由网景公司的布兰登·艾克，在网景导航者浏览器上首次设计实现而成。因为网景公司与昇阳公司的营销合作，加上网景公司管理层希望它外观看起来像Java，因此取名为JavaScript。但实际上它的语义与Self及Scheme较为接近。

>为了获取技术优势，微软推出了JScript，与JavaScript同样可在浏览器上运行。为了统一规格，1997年，在ECMA（欧洲计算机制造商协会）的协调下，由网景、昇阳、微软和Borland公司组成的工作组确定统一标准：ECMA-262。因为JavaScript兼容于ECMA标准，因此也称为ECMAScript。

>一般来说，完整的JavaScript包括以下几个部分：

>ECMAScript，描述了该语言的语法和基本对象
>文档对象模型（DOM），描述处理网页内容的方法和接口
>浏览器对象模型（BOM），描述与浏览器进行交互的方法和接口
>它的基本特点如下：

> - 是一种解释性脚本语言（代码不进行预编译）。
> - 主要用来向HTML页面添加交互行为。
> - 可以直接嵌入HTML页面，但写成单独的js文件有利于结构和行为的分离。
> JavaScript常用来完成以下任务：

>  嵌入动态文本于HTML页面
>  对浏览器事件作出响应
>  读写HTML元素
>  在数据被提交到服务器之前验证数据
>  检测访客的浏览器信息
>  控制cookies，包括创建和修改等

##语法（Syntax）

这节介绍一些JavaScript的基本语法规则。

###语句和表达式（Statements versus expressions）

了解JavaScript的语法，这有助于了解（简而言之），它有两个主要的语法类型：语句和表达式。

语句通常“做某些事情”。程序是一组语句序列。举个例子，下面声明（创建）一个 变量 foo： var foo;
表达式产生值。他们通常位于赋值操作的邮编，函数参数，等。举个例子： 3 * 7
语句和表达式之间的区别最好通过实例说明，JavaScript（像Java）有两种不同的方式实现if-then-else。一种是用语句：
```javascript
var x;
if (y >= 0) {
    x = y;
} else {
    x = -y;
}
```
另一种是表达式：

`var x = y >= 0 ? y : -y;`
你可以将后者作为函数参数（但前者不行）：

`myFunction(y >= 0 ? y : -y)`
最后，每当JavaScript期待一个语句，你也可以用一个表达式代替。例如：

`foo(bar(7, 1));`
foo(...)；是一个语句（也叫做表达式语句），bar(7, 1)是一个表达式。他们都实现函数调用。

流程控制语句和语句块（Control flow statements and blocks）

流程控制语句，其语句体可以是单条语句。举两个例子：

```javascript
if (obj !== null) obj.foo();
    while (x > 0) x--;
```
然而，任何语句总能被语句块代替，花括号包含零或多条语句。因此，你也可以这样写：
```javascript
if (obj !== null) {
    obj.foo();
}

while (x > 0) {
    x--;
}
```
在本文中，我们只是用后一种方式。

###分号（Semicolons）

分号在JavaScript中是可选的。但省略他们可能带来意想不到的结果，所以我建议你不要那样做。

正如上面所看到的，分号作为语句的结尾，但语句块不需要。仅有一种情况下你将见到块后面有分号：函数表达式后面的函数体块。表达式作为语句的结尾，后面是分号：

```javascrpt
var x = 3 * 7;
var f = function () { };
```
###注释（Comments）

JavaScript有两种注释方式：单行注释和多行注释。单行注释以//开头，以换行符结尾：

```javascript 
x++; // 单行（single-line）注释
```
多行注释用/**/包裹
```javascript
/* 
 这是多行注释
 多行哦
 */
```
###变量和赋值（Variables and assignment）

JavaScript中的变量在使用之前必须先声明：

var foo;  // 声明变量“foo”
####赋值（Assignment）

你可以在生命变量的同时给它赋值：

```javascript
var foo = 6;
```
你也可以给已经存在的变量重新赋值：
```javascript
foo = 4;  // 更改变量的值
```
####复合赋值操作符（Compount assignment operators）

有很多符合赋值操作符，例如+=。下面的两个赋值操作等价：

```javascript
x += 1;
x = x + 1;
```
####标识符和变量名（Identifiers and variable names）

标识符就是事物的名字，在JavaScript中他们扮演不同的语法角色。例如，变量的名称是一个标识符。

大体上，标识符的第一个字符可以是任何Unicode字符，美元标志符（$）或下划线（_）。后面的字符可以是任意字符和数字。因此，下面全是合法的标识符：
```javascript
arg0
_tmp
$elem
π
```
一些标识符是“保留关键字”——他们是语法的一部分，不能用作变量名：
```javascript
arguments break case catch class const continue debugger default delete do else enum eval export extends false finally for function if implements import in instanceof interface let new null package private protected public return static super switch this throw true try typeof var void while with yield
```
从技术上讲，下面三个标识符不是保留字，但也不应该作为变量名：
```javascript
Infinity NaN undefined
```
###值（Values）

JavaScript有所有我们期待的编程语言值类型：布尔，数字，字符串，数组等。JavaScript中的所有值都有属性。每个属性有一个键（或名字）和一个值。考虑记录的域（fields of record）。你可以使用点（.）操作符读取属性：

value.propKey
举个例子：字符串“abc”有属性lenght（长度）。
```javascript
 > var str = 'abc';
 > str.length
   3
```
上面的代码也可以写成下面这样：
```javascript
> 'abc'.length
  3
```
点操作符也可以用来给属性赋值：
```javascript
 > var obj = {};  // 空对象
 > obj.foo = 123; // 创建属性“foo”，设置它为123
   123
 > obj.foo
   123
```
你也可以通过它（.）调用方法：
```javascript
> 'hello'.toUpperCase()
  'HELLO'
```
上面，我们在值“hello”上面调用方法 toUpperCase()。

原始类型值和对象（Primitive values versus objects）

JavaScript定义了不同值之间的区别：

原始值包括：boolean，number，string，null和undefined，
所有其他的值都是对象。实际上对象被定义为——所有不为原始类型的值。
两者之间的主要区别在于他们是如何被比较的：每一个对象有一个独一无二的标志，并且仅和自己相等：
```javascript
> var obj1 = {};  // 一个空对象
> var obj2 = {};  // 另一个空对象
> obj1 === obj2
  false
> obj1 === obj1
  true
```
相反，所有原始值只要编码值相同就被认为是相同的：
```javascript
> var prim1 = 123;
> var prim2 = 123;
> prim1 === prim2
  true
```
接下来的两节介绍原始值和对象的更多细节。

原始类型值（Primitive values）

下面的全是原始类型值（简称：原始值）：

布尔类型：true，false
数字类型：1736，1.351
字符串类型: 'abc'，"abc"
两个“无值（non-values）”：undefined，null
原始值的特征：

值做比较时：“内容”做比较。
```javascript
> 3 === 3
  true
> 'abc' === 'abc'
  true
```
无法更改：值的属性无法更改，无法添加和移除属性。
```javascript
> var str = 'abc';
> str.foo = 3; // try to create property `foo` ⇒ no effect
> str.foo  // unknown property
  undefined 
```
(获取未知属性总返回undefined)

原始值的集合是固定的（fixed set of values）：你不能自定义原始值。
###对象（Objects）

所有非原始值（non-primitive）的值都是对象。最常见的几种对象类型是：

简单对象（类型是Object）能通过对象字面量创建：
```javascript
{ firstName: 'Jane', lastName: 'Doe' }
```
上面的对象有两个属性：firstName属性的值是“Jane”，lastName属性的值是“Doe”。

数组（类型是 Array）能通过数组字面量创建：
```javascript
[ 'apple', 'banana', 'cherry' ]
```
上面的数组有三个元素，可以通过数字索引访问。例如“apple”的索引是0.

正则表达式对象（类型是 RegExp）能通过正则表达式字面量创建。

/^a+b+$/

对象的特征：

比较的是引用：比较的是标识符，每个值有自己的标识符。
```javascript
> {} === {}  // 两个不同的空对象
  false


> var obj1 = {};
> var obj2 = obj1;
> obj1 === obj2
  true
```
默认可以更改。
```javascript
 > var obj = {};
 > obj.foo = 123;
 > obj.foo
   123
```
-** 用户可扩展（user-extensible）：**你可以通过构造函数定义新的对象类型。

数组所有的数据结构（如）都是对象，但并不是所有的对象都是数据结构。例如：正则表达式是对象，但不是一个数据结构。

undefined 和 null（undefined and null）

多少有些不必要，JavaScript有两个“无值（non-values）”：undefined 和 null。

undefined的意思是“没有值（no value）”。为初始化的变量是undefined：
```javascript
> var foo;
> foo
undefined
```
如果你读取不存在的属性，将返回undefined：
```javascript
> var obj = {}; // 空对象
> obj.foo
  undefined
```
未传递的参数也是undefined：
```javascript
> function f(x) { return x }
> f()
  undefined
```
null的意思是“没有对象（no object）”。它被用来表示对象的无值（参数，链上的对象等）。

通常情况下你应该把undefined和null看成是等价的，如果他们代表相同意义的无值的话。检查他们的一种方式是通过严格比较：
```javascript
if (x === undefined || x === null) {
    ...
}
```
另一种在实际中使用的方法是认为undefined 和 null 都是false：
```javascript
if (!x) {
    ...
}
```
**警告：**false，0，NaN 和 “” 都被当作false。

###包装类型（Wrapper types）

对象类型的实例Foo（包括内建类型，例如Array和其他自定义类型）从对象Foo.prototype上获取方法。你可以通过读这个方法但不调用它的方式验证这点：
```javascript
> [].push === Array.prototype.push
  true
```
相反，原始类型是没有类型的，所以每个原始类型有一个关联类型，称之为包装类型：

布尔值的包装类型是 Boolean。布尔值从Boolean.prototype上获取方法：
```javascript
> true.toString === Boolean.prototype.toString
  true
```
注意包装类型的名字首个字母是大写的B。如果在JavaScript中布尔值的类型可以访问，那么它可能会被成为布尔对象。

数字值的包装类型是Number。
字符串值的包装类型是String。
包装类型也有实例（他们的实例是对象），但不常用。相反，包装类型有其他用处：如果你将他们作为函数调用，他们可以将值转换为原始类型。
```javascript
> Number('123')
  123
> String(true)
  'true'
```
通过typeof 和 instanceof 将值分类（Categorizing values via typeof and instanceof）

有两个操作符可以用来将值分类：typeof 主要用来操作原始值，instanceof 主要用来造作对象。

typeof 使用方法如下：
```javascript
typeof «value»
```
它返回描述 value “类型”的一个字符串。例如：
```javascript
> typeof true
  'boolean'
> typeof 'abc'
  'string'
> typeof {} // 空对象字面量
  'object'
> typeof [] // 空数组字面量
  'object'
```
下标列出了所有typeof的结果：

操作数	结果
```javascript
undefined	'undefined'
null	'object'
Boolean value	'boolean'
Number value	'number'
String value	'string'
Function	'function'
All other values	'object'
```
有两个东西和我们所说的原始值和对象是矛盾的：

函数的类型是“function”而不是“object”。鉴于函数（类型为“function”）是对象（类型是对象）的子类型，这不是一个错误。
null的类型是“object”。这是一个bug，但从没被修复，因为修复后会破坏现有的代码。
instanceof使用方法如下：

«value» instanceof «Constr»
如果 value 是一个对象，并且value 是由构造函数Constr创建的（考虑：类）。例如：
```javascript
> var b = new Bar();  // 通过构造函数Bar创建对象
> b instanceof Bar
  true
> {} instanceof Object
  true
> [] instanceof Array
  true
> [] instanceof Object  // 数字是对象的子类型
  true
```
###布尔（Booleans）

布尔类型原始值包括true和false。下面的操作符产生布尔值：

二元逻辑运算符：&&（与），||（或）
前缀逻辑运算符：!（非）
等值运算符：=== !== == !=
比较运算符（字符串或数字）：> >= < <=
真值和假值（Truthy and falsy）

每当JavaScript希望一个布尔值时（例如：if语句的条件），可以使用任何值。它将被理解（转换）为true或false。下面的值被理解为false：

undefined, null
布尔: false
数字: -0, NaN
字符串: ''
所有其他值被认为true。被理解为false的值成为假值（falsy），被理解为true的值成为真值（truthy）。可以使用Boolean作为函数测试值被理解为什么。
```javascript
> Boolean(undefined)
  false
> Boolean(0)
  false
> Boolean(3)
  true
```
####二元逻辑运算符（Binary logical operators）

JavaScript中的二元逻辑运算符是短路运算——如果第一个操作数可以确定结果，第二个操作数将不被验证。例如，在下面的代码中，函数foo()不会被调用。

false && foo()
true  || foo()
此外，二元逻辑运算符返回操作数中的一个——可能是一个布尔值，也可能不是。一张真值表用来决定返回哪个值：

与：如果第一个操作数是假值，返回第一个。否则返回第二个操作数。
```javascript
> NaN && 'abc'
  NaN
> 123 && 'abc'
  'abc'
```
或：如果第一个操作数是真值，返回第一个。否则，返回第二个操作数。
```javascript
> 'abc' || 123
  'abc'
> '' || 123
  123
```
####等值运算符（Equality operators）

在JavaScript中检测相等，你可以使用严格相等（===）和严格不等（!==）。或者你也可以使用非严格相等（==）和非严格不等（!=）。经验规则：总是用严格运算符，假装非严格运算符不存在。严格相等更安全。

###数字（Numbers）

JavaScript中的所有数字都是浮点型（虽然大部分的JavaScript引擎内部也使用整数）。至于为什么这样设计，查看这里（每一个JavaScript开发者应该了解的浮点知识）。
```javascript
> 1 === 1.0
  true
```
特殊数字：
NaN (“不是一个数字 not a number”): 错误值。
```javascript
> Number('xyz')  // 'xyz' 不能被转换为数字
  NaN
```
Infinity：也是最大错误值（溢出）.
```javascript
> 3 / 0
  Infinity
> Math.pow(2, 1024)  // 数字太大了
  Infinity
```
Infinity 有时很有用，因为它比任何其他数字都大。同样，-Infinity 比其他任何数字都小。

JavaScript有两个零，+0 和 -0。它通常不让你看到，并简单将两个零都显示为0：
```javascript
> +0
  0
> -0
  0
```
因此最好假装只有一个零（正如我们看到假值时所做的那样：-0 和 +0 都是假值）。

###运算符（Operators）

JavaScript中有下列算数运算符：

加: number1 + number2
减: number1 - number2
乘: number1 * number2
除: number1 / number2
求模: number1 % number2
自增: ++variable, variable++
自减: --variable, variable--
负值: -value
转换为数字: +value
全局对象Math通过函数提供更多算数运算操作。

JavaScript中也有位运算符（例如：位与 &）。

###字符串（Strings）

字符串可以直接通过字符串字面量创建。这些字面量被单引号或双引号包裹。反斜线（\）转义字符并且产生一些控制字符。例如：
```javascript
'abc'
"abc"

'Did she say "Hello"?'
"Did she say \"Hello\"?"

'That\'s nice!'
"That's nice!"

'Line 1\nLine 2'  // 换行
'Backlash: \\'
```
可以通过方括号访问单个字符：
```javascript
> var str = 'abc';
> str[1]
  'b'
```
length属性是字符串的字符数量。
```javascript
> 'abc'.length
  3
```
提醒：字符串是不可变的，如果你想改变现有字符串，你需要创建一个行的字符串。

####字符串运算符（String operators）

字符串可以通过加号操作符（+）拼接，如果其中一个操作数为字符串，会将另一个操作数也转换为字符串。
```javascript
> var messageCount = 3;
> 'You have '+messageCount+' messages'
  'You have 3 messages'
```
连续执行拼接操作可以使用 += 操作符：
```javascript
> var str = '';
> str += 'Multiple ';
> str += 'pieces ';
> str += 'are concatenated.';
> str
  'Multiple pieces are concatenated.'
```
####字符串方法（String methods）

字符串有许多有用的方法。例如：
```javascript
> 'abc'.slice(1)  // 复制子字符串
  'bc'
> 'abc'.slice(1, 2)
  'b'

> '\t xyz  '.trim()  // 移除空白字符
  'xyz'

> 'mjölnir'.toUpperCase()
  'MJÖLNIR'

> 'abc'.indexOf('b')  // 查找字符串
  1
> 'abc'.indexOf('x')
  -1
```

###语句（Statements）

####条件（Conditionals）

if语句通过布尔条件决定执行那个分支：
```javascript
if (myvar === 0) {
    // then
}

if (myvar === 0) {
    // then
} else {
    // else
}

if (myvar === 0) {
    // then
} else if (myvar === 1) {
    // else-if
} else if (myvar === 2) {
    // else-if
} else {
    // else
}
```
下面的switch语句，furit的值决定那个分支被执行。
```javascript
switch (fruit) {
    case 'banana':
        // ...
        break;
    case 'apple':
        // ...
        break;
    default:  // 所有其他情况
        // ...
}
```
####循环（Loops）

for 循环的格式如下：

for(初始化; 当条件成立时循环; 下一步操作)
例子：
```javascript
for (var i=0; i < arr.length; i++) {
    console.log(arr[i]);
}
```
当条件成立时while循环继续循环它的循环体。
```javascript
// 和上面的for循环相等
var i = 0;
while (i < arr.length) {
    console.log(arr[i]);
    i++;
}
```
当条件成立时，do-while循环继续循环。由于条件位于循环体之后，所以循环体总是被至少至少执行一次。
```javascript
do {
    // ...
} while(条件);
```
在所有的循环中：

break中断循环
continue开始一个新的循环迭代
函数（Functions）

定义函数的一种方法是通过函数声明：
```javascript
function add(param1, param2) {
    return param1 + param2;
}
```
上面的代码定义一个名称叫做add的函数，有两个参数param1和param2，并且返回参数的和。下面是你如何调用这个函数：
```javascript
> add(6, 1)
  7
> add('a', 'b')
  'ab'
```
另一种定义add()函数的方法是通过函数表达式：
```javascript
var add = function (param1, param2) {
    return param1 + param2;
};
```
函数表达式产生一个值，因此可以直接将函数作为参数传递给其他函数：

someOtherFunction(function (p1, p2) { ... });
函数声明提升（Function declarations are hoisted）

函数声明会被提升，他们全被移动到当前作用域开始之处。这允许你在函数声明之前调用它们：
```javascript
function foo() {
    bar();  // 没问题，bar被提升
    function bar() {
        ...
    }
}
```
注意：虽然变量声明也会被提升，但赋值的过程不会被提升：
```javascript
function foo() {
    bar();  // 有问题，bar是undefined
    var bar = function () {
        // ...
    };
}
```
####特殊变量arguments（The special variable arguments）

在JavaScript中你可以调用任意函数并传递任意数量的参数——语言绝不会抱怨。那可以工作，然而，使所有参数可访问需要通过特殊变量 arguments。arguments 看起来像数组，但它没有数组的方法。
```javascript
> function f() { return arguments }
> var args = f('a', 'b', 'c');
> args.length
3
> args[0]  // 获取索引为0的元素
'a'
```
####太多或太少参数（Too many or too few arguments）

让我们通过下面的函数探索JavaScript中传递太多或太少参数时如何处理（函数 toArray在后面提到）
```javascript
function f(x, y) {
    console.log(x, y);
    console.log(toArray(arguments));
}
```
多出的参数将被忽略（可以通过arguments访问）：
```javascript
> f('a', 'b', 'c')
a b
[ 'a', 'b', 'c' ]
```
缺少的参数将是undefined：
```javascript
> f('a')
a undefined
[ 'a' ]
> f()
undefined undefined
[]
```
####可选参数（Optional parameters）

下面是一个常见模式，给参数设置默认值：
```javascript
function pair(x, y) {
    x = x || 0;  // (*)
    y = y || 0;
    return [ x, y ];
}
```
在（*）这行，如果x是真值（除了：null，undefined 等），||操作符返回x。否则，它返回第二个操作数。
```javascript
> pair()
[ 0, 0 ]
> pair(3)
[ 3, 0 ]
> pair(3, 5)
[ 3, 5 ] 
```
强制数量（Enforcing an arity）

如果你想强制参数的数量，你可以检测arguments.length：
```javascript
function pair(x, y) {
    if (arguments.length !== 2) {
        throw new Error('Need exactly 2 arguments');
    }
    ...
}
```
将arguments 转换为数组（Converting arguments to an array）

arguments 不是一个数组，它仅仅是类数组（array-like）：它有一个length属性，并且你可以通过方括号索引方式访问它的元素。然而，你不能移除元素，或在它上面调用任何数组方法。因此，有时你需要将其转换为数组。这就是下面函数的作用。
```javascript
function toArray(arrayLikeObject) {
    return [].slice.call(arrayLikeObject);
}
```
###异常处理（Exception handling）

异常处理最常见的方式像下面这样：
```javascript
function throwException() {
    throw new Error('Problem!');
}

try {
    throwException();
} catch (e) {
    console.log(e);  // 错误：信息
    console.log(e.stack);  // 非标准，但大部分浏览器支持
}
```
try分支包裹易出错的代码，如果try分支内部抛出异常，catch分支将会执行。

###严格模式（Strict mode）

严格模式开启检测和一些其他措施，是JavaScript变成更整洁的语言。推荐使用严格模式。为了开启严格模式，只需在JavaScript文件或script标签第一行添加如下语句：

'use strict';
你也可以在每个函数上选择性开启严格模式，只需将上面的代码放在函数的开头：
```javascript
function functionInStrictMode() {
    'use strict';
}
```
下面的两小节看下严格模式的三大好处。

###明确错误（Explicit errors）

让我们看一个例子，严格模式给我们明确的错误，否则JavaScript总是静默失败：下面的函数 f() 执行一些非法操作，它试图更改所有字符串都有的只读属性——length：
```javascript
function f() {
    'abc'.length = 5;
}
```
当你调用上面的函数，它静默失败，赋值操作被简单忽略。让我们将 f() 在严格模式下运行：
```javascript
function f_strict() {
    'use strict';
    'abc'.length = 5;
}
```
现在浏览器报给我们一些错误：
```javascript
> f_strict()
TypeError: Cannot assign to read only property 'length' of abc
```
不是方法的函数中的this（this in non-method functions）

在严格模式下，不作为方法的函数中的this值是undefined：
```javascript
function f_strict() {
    'use strict';
    return this;
}
console.log(f_strict() === undefined);  // true
```
在非严格模式下，this的值是被称作全局对象（global object）（在浏览器里是window）：
```javascript
function f() {
    return this;
}
console.log(f() === window);  // true
```
####不再自动创建全局变量（No auto-created global variables）

在非严格模式下，如果你给不存在的变量赋值，JavaScript会自动创建一个全局变量：
```javascript
> function f() { foo = 5 }
> f()  // 不会报错
> foo
5
```
在严格模式下，这会产生一个错误：
```javascript
> function f_strict() { 'use strict'; foo2 = 4; }
> f_strict()
ReferenceError: foo2 is not defined
```