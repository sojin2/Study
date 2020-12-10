# Swift


[집단 자료형 - Array, Dictionary, Set, Tupel](#집단-자료형)
[조건문 - Switch case](#Switch-case)
[반복문 - while, repeat~while](#while,repeat~while)
[class&struct/Enum](#class&struct/Enum)
[객체와 인스턴스](#객체와-인스턴스)


## 집단 자료형


스위프트는 서로 관련 있는 데이터끼리 모아서 관리할 수 있도록 집단 자료형 (Collective Types)을 제공합니다.

집단 자료형을 사용하면 데이터를 손쉽게 그룹 단위로 묶을 수 있으므로 다량의 데이터를 다룰 때 무척 편리합니다.



종류

배열 (Array) : 일련 번호로 구분되는 순서에 따라 데이터가 정렬된 목록 형태의 자료형 (
집합 (Set) : 중복되지 않은 유일 데이터들이 모인 집합 형태의 자료형
튜플 (Tuple) : 종류에 상관 없이 데이터들을 모은 자료형, 수정 및 삭제를 할 수 없음
딕셔너리(Dictionary) : 배열과 유사하나 일련 번호 대신 키(Key)를 사용하여 키-값으로 연관된 데이터들이 순서 없이 모인 자료형
배열과 집합, 튜플, 딕셔너리는 어떤 타입의 데이터라도 모두 저장할 수 있지만

튜플을 제외한 나머지는 저장되는 모든 데이터의 타입이 동일해야합니다.

1. 배열 (Array)
배열은 같은 타입의 값들을 순서가 있는 리스트 형식으로 저장합니다. 






배열에 저장할 아이템의 타입에는 제약이 없지만, 하나의 배열에 저장하는 아이템 타입은 모두 같아야 함
선언 시 배열에 저장할 아이템 타입을 명확히 정의해야 함
배열의 크기는 동적으로 확장할 수 있음






1.3. 배열을 정의하는 방법
정적 선언 & 형식 선언
처음부터 배열을 구성하는 아이템을 포함하여 정의하는 방식
별도의 배열 선언이 필요 없다는 장점이 있음
배열의 타입을 명시하지 않아도 되지만, 빈 배열을 만들 경우에는 반드시 배열 타입을 명시해야함

<pre>
<code>
// (let 또는 var) 배열 이름 = [배열 타입과 일치하는 값]

var cities = ["Seoul", "New York", "LA", "Santiage"] // 타입 추론에 의해 배열 타입으로 선언

// 배열의 아이템을 참조하는 방법

cities[0] // Seoul
cities[1] // New York
cities[2] // LA
cities[3] // Santiago
</code>
</pre>


동적 선언 
선언 방법에는 선언과 초기화를 함께 선언하는 방법과 분리하는 방법이있습니다.



아래 코드들을 보면 문법이 정식 문법과 단축 문법으로 나뉘는 것을 볼 수 있는데,

이 두가지의 차이점은 간단하게 Array의 선언 여부 입니다.



정식 문법 : (let 또는 var) 배열 이름: Array<타입>
단축 문법 : l(et 또는 var) 배열 이름 : [타입] 
이 두가지 문법중에 자주 사용하는 문법은 당연히 더 간단한 단축 문법이겠죠?

아래 예시 코드들을 보면서 자세히 살펴보도록 하겠습니다.

</code>
</pre>
// 배열 선언 & 초기화

// 정식 문법

var cities = Array<String>()

var rows : Array<Float> = [Float]() // 타입 어노테이션 + 제네릭 + 초기화

var tables : [String] = Array() // 타입 어노테이션 + 구방식의 초기화


// 단축 문법

var cities = [String]()

var list : [Int] = [] // 타입 어노테이션 + 초기화


// 정식 문법

var cities : Array<String> // 선언
cities = Array() // 초기화


// 단축 문법

var country : [String] // 선언
country = [] // 초기화
</code>
</pre>


위 글들을 보면 정적 선언보다 동적 선언 방법을 더 많이 사용하고,

정식 문법보다 단축 문법을 더 많이 사용하는 것 같습니다.



주의할 점


1. 빈 배열을 만들 때는 반드시 타입을 명시해야합니다.


<pre>
<code>
let emptyArr = [] // 에러
</code>
</pre>

2. 다른 타입의 값을 한 배열에 넣으면 안 됩니다.


<pre>
<code>
let arr = [1, "소진", 3.5, "아"] // 에러
</code>
</pre>

그렇지만 여러 타입의 값을 한 배열 안에 다 넣을 방법이 없는 것은 아닙니다.

Any나 AnyObj 를 사용하면 되는데 아래 예시에서 같이 설명하겠습니다!








1.3. 응용하기
배열에 값을 넣기
아래 예시를 참고해서 이해해주세요.

<pre>
<code>
// 정식 문법
let cities: Array<String> = ["Seoul","New York"] // ["Seoul", "New York"]
 
// 단축 문법
let cities2: [String] = ["Tokyo", "Dubai"] // ["Tokyo", "Dubai"]
 
// 형식 추론
let cities3 = ["Sydney", "UK"] // ["Sydney", "UK"]
 
// 시퀀스
let num = Array(1...3) // [1, 2, 3]
 
// 여러 자료형(타입)
let anyArr: [Any] = [1, 2, "sojin", "소진"] // [1, 2, "sojin", "소진"]
</code>
</pre>

AnyObject는 안되나요?

AnyObject는 모든 클래스 타입을 지칭하는 프로토콜이기때문에 타입자리에 넣을 수 없습니다!



크기가 정해진 배열
<pre>
<code>
// (repeating: 배열의 타입과 일치하는 값(1개), count: 값을 반복할 횟수)
 
let numArray1 = [Int](repeating: 0, count: 10) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
 
let numArray2 = Array(repeating: 0, count: 10) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
범위 연산자와의 차이점이라고 하면 범위 연산자는 특정 범위 내에서 1씩 증가한 값이 배열에 넣어지지만,

Array(repeating:count:) 메서드는 반복할 값 1개(repeating)가 지정된 횟수(count) 만큼 배열에 넣어집니다.
</code>
</pre>

범위 연산자를 이용한 값 참조
이 범위 연산자를 이용한 데이터 읽어 오는 방식은 배열 값 수정에 적용하면 매우 유용합니다.

<pre>
<code>
var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2] // ["a", "b", "c"]
alphabet[2...3] // ["c", "d"]
alphabet[1..<3] // ["b", "c"]

alphabet[1...2] = ["1", "2", "3"]
// alphabet ["a", "1", "2", "3", "d", "e"]

alphabet[2...4] = ["A"]
// alphabet ["a", "1", "A", "e"]
</code>
</pre>

위의 마지막 부분 예시를 보면 해당 위치의 배열에 새로운 값을 넣어 변경 할 수도 있습니다.



동적 할당
배열에 아이템을 동적으로 추가할 때에는 메소드를 사용하는데, 대표적인 것으로 아래 세가지만 소개하겠습니다.



append(_:) : 아이템을 배열의 맨 뒤에 추가 ( 추가 전에 배열의 크기 +1만큼 확장하여 인덱스 공간 확보 함)
insert(_:at:) :  아이템을 배열 맨 뒤가 아닌 원하는 위치에 직접 추가 (쉽게 말해 끼어들기)
append(conteentsOf:) : 배열의 맨 뒤에 추가하지만, 개별 아이템이아닌 여러 개의 아이템을 한꺼번에 추가
위의 소개만 보면 잘 이해가 안되니 예시와 같이 참고해주세요!

<pre>
<code>
var cities = Array<String>()

cities.append("Seoul") //["Seoul"]
cities.append("New York") //["Seoul", "New York"]
cities.insert("Tokyo", at: 1) //["Seoul", "Tokyo", "New York"]
cities.append(contentsOf: ["Dubai","Sydney"]) //["Seoul", "Tokyo", "New York", "Dubai","Sydney"]
</code>
</pre>

위에 정적인 방법으로 선언을 했을때, 아래와 같이 아이템 값을 넣은 것 같은데. 이번에도 이렇게 추가 할 수 있을까요?

결론 부터 말하자면, 안됩니다. 아래 방식처럼 값을 추가하기 위해서는 배열에 그 인덱스가 이미 만들어져 있거나 확보된 경우로 제한되어있습니다!

<pre>
<code>
cities[5] = "UK" // 추가X
</code>
</pre>

순회 탐색

<pre>
<code>
var cities = ["Seoul", "New York", "LA", "Santiage"]
let length = cities.count


for i in 0..<length {
    print("\(i)번째 배열 원소는 \(cities[i])입니다")
}
--------------------------------------------------------------

0번째 배열 원소는 Seoul입니다
1번째 배열 원소는 New York입니다
2번째 배열 원소는 LA입니다
3번째 배열 원소는 Santiage입니다

--------------------------------------------------------------

for row in cities {
    print("배열의 원소는 \(row)입니다.")
}

--------------------------------------------------------------

배열의 원소는 Seoul입니다.
배열의 원소는 New York입니다.
배열의 원소는 LA입니다.
배열의 원소는 Santiage입니다.

--------------------------------------------------------------

for row2 in cities {
    let index = cities.index(of: row2)
    print("\(index!)번째 배열 원소는 \(row2)입니다")
}

--------------------------------------------------------------

0번째 배열 원소는 Seoul입니다
1번째 배열 원소는 New York입니다
2번째 배열 원소는 LA입니다
3번째 배열 원소는 Santiage입니다

</code>
</pre>


참고 사이트

2. 집합 (Set)
같은 타입의 서로 다른 값을 중복 없이 저장하고자 할 때 사용하는 집단 자료형 입니다.

순서가 그다지 중요하지 않은 데이터
중복 없이 한 번만 저장해야하는 데이터
해시(Hash) 연산의 결과 값을 이용하여 데이터를 저장하므로 집합에 저장할 데이터 타입은 해시 연상을 할 수 있는 타입이어야 합니다.



Q. 해시 연산이란?

: 해시 연산은 보통 해시 알고리즘이라 불리는 것으로서, 임의의 입력된 메시지를 고정 길이의 데이터 크기로 변환해주는 알고리즘입니다. 해시 알고리즘을 사용하면 아무리 긴 데이터나 아무리 짧은 길이의 데이터라 할 지라도 고정 길이의 데이터로 변환 할 수 있습니다.



2.1 집합의 정의
집합을 정의할 때에는 배열 데이터를 사용하여 정의합니다. 하지만 단순히 배열 데이터를 사용하여 정의하게 되면 컴파일러는 이 데이터들을 집합이 아닌 배열로 인식합니다. 이 같은 상황을 방지하고 집합 타입이라는 것을 텀파일러에 직접 알려주기 위해 타입 어노테이션 Set을 기재해야 합니다. 





(1) 초기값을 사용하여 바로 정의

<pre>
<code>

// (var 또는 let) 변수명 : Set = [] - 저장할 타입 생략

var genres : Set = ["Classic","Rock","Balad"] //Set이 없으면 배열로 선언 됨 주의!

// (var 또는 let) 변수명 : Set<타입> - 저장할 타입 생략하지 않은 경우

var genres : Set<String> = ["Classic","Rock","Balad"]
 </code>
</pre>


(2) 빈 집합을 선언하고 초기화하는 과정을 거쳐 정의

<pre>
<code>

// (var 또는 let) 변수명 = Set <타입>()


// 빈 집합을 정의


var genres = Set<String>()


// 집합에 아이템을 추가


genres.insert("Classic")
genres.insert("Rock")
genres.insert("Balad")



// 집합에 아이템을 삭제


genres.remove("Rock") 


// 집합에 특정 아이템이 있는지 확인


genres.contains("Rock") //해당 아이템 없음
</code>
</pre>

2.2 집합 연산


(1) 기본 집합 연산








intersection(_:) : 양쪽 집합에서 공통되는 아이템만 선택하여 새로운 집합을 만들어주는 메소드 (교집합)
symmetricDifference(_:) : 양쪽 집합 중에서 어느 한쪽에만 있는 아이템을 선택하여 새로운 집합을 만들어주는 메소드 (공통 집합 X)
union(_:) : 양쪽 집합에 있는 모든 아이템을 선택하여 새로운 집합을 만들어주는 메소드 (합집합)
subtract(_:) : 한 쪽 집합에 있는 모든 아이템에서 다른 쪽 집합에도 속하는 공통 아이템을 제외하고 새로운 집합을 만들어주는 메소드 (차집합)

<pre>
<code>
var oddDigits : Set = [1, 3, 5, 7, 9] // 홀수 집합
let evecDigits : Set = [0, 2, 4, 6, 8] // 짝수 집합
let primeDigits : Set = [2, 3, 5, 7] // 소수 집합

oddDigits.intersection(evecDigits).sorted() // []
oddDigits.symmetricDifference(primeDigits).sorted() // [1,2,9]
oddDigits.union(evecDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.subtract(primeDigits) //{1, 9}
oddDigits.sorted() // [1, 9]
</code>
</pre>





(2) 부분 집합과 포함 관계 판단 연산






isSuperset(of:) : 주어진 집합의 값 전체가 특정 집합에 포함되는지를 판단하여 true,false를 반환합니다.
 하나의 집합이 다른 집합의 부분집합인지에 대한 판단
isStrictSubset(of:) : 주어진 집합이 특정 집합의 모든 값을 포함하는지를 판단하여 true,false를 반환합니다.
 집합이 다른 집합의 상위 집합 역할을 하는가에 대한 판반
isStrictSuperset(of:) : 주어진 집합이 특정 집합의 부분 집합인지 아니면 상위 집합인지를 판단하는 역할을 하지만 두 집합이 서로 같은 경우의 결과 값이 다르게 반환됩니다. 두 집합이 서로 일치할 경우 
isSubset(of:), isSuperset(of:) 메소드는 수학적으로 서로가 서로의 부분 집합이자 상위 집합이 될 수 있으므로 true를 반환
isStrictSuperset(of:), isDisjoint(with:) 메소드는 이를 더 엄격하게 판단하여 정확히 부분 집합, 또는 상위 집합일 때만 true를 반환 (서로 일치하는 집합은 동일한 집합으로 판단하지 부분 집합이나 상위 집합으로 판단하지 않는다.)
isDisjoint(with:) : 두 집합 사이의 공통 값을 확인하여 아무런 공통 값이 없을 때 true를 , 공통 값이 하나라도 있으면 false 를 반환합니다.


<pre>
<code>
let A : Set = [1, 3, 5, 7, 9]
let B : Set = [3,5]
let C : Set = [3,5]
let D : Set = [2, 4, 6]

B.isSubset(of: A) // true
A.isSuperset(of: B) // true
C.isStrictSubset(of: A) // true
C.isStrictSubset(of: B) // false
A.isDisjoint(with: D) // true
</code>
</pre>

(3) 중복 아이템 제거하기

<pre>
<code>
var  A = [4 , 2, 5, 1, 7, 4, 9, 11, 3, 5, 4]

let B = Set(A) // 집합
A = Array(B) // 중복이 제거된 배열
// [2, 5, 11, 1, 7, 9, 3, 4]
</code>
</pre>

3. 튜플(Tuple)
스위프트에서 제공하는 특별한 성격의 집단 자료형으로서, 파이썬에서도 사용되는 자료형입니다.



하나의 튜플에 여러가지 타입의 아이템을 저장가능
상수적 성격을 띠어 최초 선언 후 값을 추가하거나 삭제가 불가능
함수 반환값을 사용할 때 매우 유용하게 사용가능
리스트랑 비슷


3.1. 튜플 정의 방법
튜플은 배열과 비슷하다고 볼 수 있지만, 배열과는 다르게 길이가 고정되어있습니다.

그래서 값을 접근할 때에도 [] 대신 .을 사용합니다.

<pre>
<code>
// (let 또는 var) 배열명 = (<Tuple item1>, <Tuple item2>,...)

let tupleValue = ("a", "b", 1, 2.5, true)

tupleValue.0 // "a"
tupleValue.1 // "b"
tupleValue.2 // 1
tupleValue.3 // 2.5
tupleValue.4 // true
</code>
</pre>

아래와 같이 튜플의 파라미터에 이름을 붙일 수도 있습니다.


<pre>
<code>
var namedCoffeeInfo = (coffee: "아메리카노", price: 5100)

namedCoffeeInfo.coffee // 아메리카노
namedCoffeeInfo.price // 5100
namedCoffeeInfo.price = 5100

// 타입 어노테이션 

var coffeeInfo: (String, Int)
var namedCoffeeInfo: (coffee: String, price: Int)

// 응용
let (coffee, price) = ("아메리카노", 5100)

coffee // 아메리카노
price // 5100
</code>
</pre>

튜플은 하나의 아이템만 있으면 아이템 타입의 일반 자료형이 됩니다.

아래 예시 중 tpl04를 보면서 이해하시면 될 것 같습니다.

<pre>
<code>
var tpl01 : (Int,Int) = (100,200)
var tpl02 : (Int, String, Int) = (100, "a", 200)
var tpl03 : (Int, (String, String)) = (100, ("t","v"))
var tpl04 : (String) = ("sample string") // 튜플이 아니라 문자열 타입의 변수로 선언 됨
</code>
</pre>

튜플이 진가를 발휘하는 곳 : 함수나 메소드

아래 코드를 참고해 주세요

<pre>
<code>
// 결과 갑으로 튜플을 반환하는 함수

func getTupleValue() -> (String, String, Int){
   return("t", "v", 100)
}

// 함수가 반환하는 튜플을 튜플 상수로 바인딩

let(a,b,c) = getTupleValue();

위 코드를 실행하면

a -> "t"
b -> "v"
c -> 100

// 튜플 값을 모두 받지 않는 경우

let (a,b,_) = getTupleValue()

a -> "t"
b -> "v"
</code>
</pre>



참고사이트



4. 딕셔너리
사전에서 고유 단어와 그 의미가 연결되어 있는 것처럼, 고유 키(Key)와 그에 대응하는 값(Value)을 연결하여 데이터를 저장하는자료형 입니다.

4.1 딕셔너리를 사용할 때 주의할 점
하나의 키는 하나의 데이터에만 연결되어야 함
하나의 딕셔너리에서 키는 중복될 수 없습니다. 중복해서 선언하면 아이템 추가가 아니라 수정이 이루어져 기존 키에 연결된 데이터가 제거 됨
저장할 수 있는 데이터 타입에는 제한이 없지만, 하나의 딕셔너리에 저장하는 데이터 타입은 모두 일치해야 함
딕셔너리의 아이템은 순서가 없지만, 내부적으로 순서가 있으므로 for~in을 통한 순환 탐색 가능
키는 hash 연산이 가능한 타입이어야 함.


4.2. 딕셔너리 정의 방법

<pre>
<code>
//(let 또는 var) 변수명 = [ 키 : 데이터, 키 : 데이터,...]


// 딕셔너리의 정적 선언과 값의 정의


var capital = ["KR":"Seoul", "EN":"London", "FR":"Paris"]

var students:Dictionary<String, Int> = ["jake":100, "philip":80, "amy":95]

var students2:[String: Int] = ["jake":100, "philip":80, "amy":95] 


// 선언 + 초기화


// (var 또는 let) 변수명:Dictionary<타입1,타입2> =Dictionary <타입1,타입2> ()

var capital : Dictionary<String, Int> = Dictionary<String, Int>()


// (var 또는 let) 변수명:Dictionary<타입1,타입2> = <타입1:타입2> ()

var capital : Dictionary<String, Int> = [String: Int]()


// (var 또는 let) 변수명:Dictionary<타입1,타입2> = [:]

var capital : Dictionary<String, Int> = [:]
 </code>
</pre>






4.3. 응용하기
딕셔너리에 저장된 아이템을 제거하는 방법



nil을 할당하는 방법
명시적으로 removeValue(forKey:) 메소드 사용

<pre>
<code>
import UIKit

var capital = ["KR" : "Seoul","EN" : "London","FR" : "Paris"]

capital["KR"]
capital["EN"]
capital["FR"]

print(capital) //"["FR": "Paris", "EN": "London", "KR": "Seoul"]

capital["JP"] = "Tokyo"
print(capital) //"["JP": "Tokyo", "EN": "London", "FR": "Paris", "KR": "Seoul"]

var newCapital = [String : String]()
newCapital["JP"] = "Tokyo"

if newCapital.isEmpty {
    print("딕셔너리가 비어 있는 상태입니다.")
} else {
    print("딕셔너리의 크기는 현재 \(newCapital.count)입니다")
}
// "딕셔너리의 크기는 현재 1입니다\n"


newCapital.updateValue("Seoul", forKey: "KR")
//"KR" : "Seoul" 데이터가 추가되고 nil을 리턴함

newCapital.updateValue("London", forKey: "EN")
//"EN" : "London" 데이터가 추가되고 nil을 리턴함

newCapital.updateValue("Sapporo", forKey: "JP")
//"JP" : "Sapporo" 데이터가 추가되고 "Tokyo"을 리턴함


// 아이템을 삭제하는 방법

//1. nil 할당

newCapital["CN"] = nil


//2. remove 메소드 할당

newCapital.removeValue(forKey: "CA")

//["JP": "Sapporo", "KR": "Seoul", "EN": "London"]


// "CA"에 해당하는 값을 삭제하고, 반환된 값을 removedValue에 할당한다.
if let removedValue = newCapital.removeValue(forKey: "EN") {
    print("삭제된 값은 \(removedValue)입니다.")
} else {
    print("아무 것도 삭제되지 않았습니다.")
}
// "삭제된 값은 London입니다.\n"
</code>
</pre>


옵셔널(Optional)

<pre>
<code>
print(newCapital)

Optional(newCapital["Sapporo"]) //["KR": "Seoul", "JP": "Sapporo"]

Optional(newCapital["JP"]) // nil

Optional(newCapital["KR"]) //"Sapporo"

Optional(newCapital["EN"]) //nil
</code>
</pre>


딕셔너리는 키 자체가 일련의 순서를 가지고 있지 않기때문에 해시 연산에 의한 결과 값 역시 연속되는 값이 아닙니다. 

--> 키와 값에 대한 보장이 없음



위와 같은 문제 때문에 딕셔너리의 접근 값은 옵셔널로 읽어오게 됩니다.

왜 값은 옵셔널로서 가져오는 걸까요?

딕셔너리에 특정 키를 통해 접근 할 때 해당 키에 대응하는 value 값이 존재하지 않을 수 있기 때문에 옵셔널 타입의 값이 반환합니다.

딕셔너리 키에 대응되는 값을 논 옵셔널로서 사용해야한다면 옵셔널 바인딩을 사용하거나, 강제 언레핑을 사용하여 논 옵셔널 값을 얻어낼 수도 있다고 합니다.



순회 탐색
//딕셔너리의 순회 기능을 사용하여 순회 탐색

<pre>
<code>
for row in newCapital {
    let (key, value) = row
    print("현재 데이터는 \(key) : \(value)")
}

for (key1, value2) in newCapital {
    print("현재 데이터는 \(key1) : \(value2)")
}

-----------------------------------------------
출력 값

현재 데이터는 JP : Sapporo
현재 데이터는 KR : Seoul

</code>
</pre>


이와 같이 이번에는 집단 자료형에 대해서 살펴 보았습니다.

지금까지 배운 자료형을 정리해보면서 마무리 하겠습니다.



배열 : 순서 있는 데이터들을 저장할 때 사용하며 중복된 값을 저장할 수 있습니다. 저장된 데이터는 인덱스로 관리됩니다.
집합 : 순서 없는 데이터를 저장할 때 사용하며, 중복된 값은 한 번만 저장됩니다.
딕셔너리 : 순서 없는 데이터를 키-값 형태로 저장할 때 사용하며, 중복된 값을 저장할 수 있지만 중복된 키를 사용할 수 없습니다.
튜플 ; 데이터를 나열해서 소괄호로 묶어 사용하며, 내부적으로 순서가 있지만, 순서 처리를 지원하지는 않습니다. 서로 다른 데이터 타입의 데이터를 저장할 수 있습니다.



## Switch case

## while,repeat~while

## class&struct/Enum

## 객체와 인스턴스
