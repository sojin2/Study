# Swift


* [집단 자료형](#집단자료형)
   * [Array](#배열)
   * [Set](#집합)
   * [Tupel](#튜플)
   * [Dictionary](#딕셔너리)

* 조건문 
   * [Switch case](#switch-case)

* 반복문
   * [For문](#for문)
   * [while, repeat~while 문](#while-반복문)

* [class&struct/Enum]
   * [Class](#class)
   * [Struct](#struct)
   * [Enum](#enum)
   
* [객체와 인스턴스](#객체와-인스턴스)

* [OOP와 POP](#oop와-pop)

# 집단 자료형
스위프트는 서로 관련 있는 데이터끼리 모아서 관리할 수 있도록 집단 자료형 (Collective Types)을 제공합니다.

집단 자료형을 사용하면 데이터를 손쉽게 그룹 단위로 묶을 수 있으므로 다량의 데이터를 다룰 때 무척 편리합니다.


종류

* 배열 (Array) : 일련 번호로 구분되는 순서에 따라 데이터가 정렬된 목록 형태의 자료형 
* 집합 (Set) : 중복되지 않은 유일 데이터들이 모인 집합 형태의 자료형
* 튜플 (Tuple) : 종류에 상관 없이 데이터들을 모은 자료형, 수정 및 삭제를 할 수 없음
* 딕셔너리(Dictionary) : 배열과 유사하나 일련 번호 대신 키(Key)를 사용하여 키-값으로 연관된 데이터들이 순서 없이 모인 자료형
   
배열과 집합, 튜플, 딕셔너리는 어떤 타입의 데이터라도 모두 저장할 수 있지만 튜플을 제외한 나머지는 저장되는 모든 데이터의 타입이 동일해야합니다.


# 배열
***

배열은 같은 타입의 값들을 순서가 있는 리스트 형식으로 저장합니다. 

* **순차적**으로 데이터가 저장 (서로 연관된 데이터들을 저장할 때 많이 사용)
* **삽입 순 저장**
* **수정 가능, 중복 요소 가능**
* 배열에 저장할 아이템의 타입에는 제약이 없지만, 하나의 배열에 **저장하는 아이템 타입은 모두 같아**야 한다. (단, Any를 사용하면 다양한 타입 가능)
* 선언 시 배열에 저장할 **아이템 타입을 명확히 정의**해야 한다.
* **배열의 크기는 동적으로 확장**할 수 있다.


### Array의 장점

임의 접근(random access)이 가능하므로, N번째 요소를 조회하는 데 있어서 성능이 빠르다.
-> 데이터가 연속적으로 저장되어있어서 변수가 저장된 메모리 주소만 알면 배열의 요소는 배열의 인덱스로 한 번에 빠르게 조회할 수 있다. - O(1) 실행시간


### Array의 단점

* 메모리 낭비 
-> 배열은 **처음 생성될 때 정해진 메모리 값을 할당** 받는다. 하지만 array에 들어갈 데이터가 많아져 메모리가 필요하게되면 리사이징, 메모리 추가할당이 필요하다. 그 과정에서 메모리 낭비가 생길 수 있다.

* 인덱스 값을 모르면 성능 낮아짐
-> 배열의 특정요소를 조회를하고싶을때 인덱스 값을 모른다면 인덱스 0번, 처음부터 순차적으로 조회되기 때문에 길이가 길다면 그만큼 조회가 느려진다.

* 데이터 삽입/삭제 비효율적
 -> 데이터를 삽입/삭제 후 나머지 배열 요소들의 위치를 모두 옮겨줘야하므로 성능이 좋지 않다. - O(n) 실행시간



### Array를 쓰기 좋은 상황

1. **순차열적인 데이터**를 저장할때
2. 어떠한 특정 요소를 **빠르게 읽어야 할때**
3. 데이터의 **사이즈가 자주 변하지 않을때**
4. 요소를 **자주 삭제해야 하지 않을때**




## 1.3. 배열을 정의하는 방법
    
       
### **(1). 정적 선언 & 형식 선언**


* 처음부터 배열을 구성하는 아이템을 포함하여 정의하는 방식
* 별도의 배열 선언이 필요 없다는 장점이 있음
* 배열의 타입을 명시하지 않아도 되지만, 빈 배열을 만들 경우에는 반드시 배열 타입을 명시해야함



```
// (let 또는 var) 배열 이름 = [배열 타입과 일치하는 값]

var cities = ["Seoul", "New York", "LA", "Santiage"] // 타입 추론에 의해 배열 타입으로 선언

// 배열의 아이템을 참조하는 방법

cities[0] // Seoul
cities[1] // New York
cities[2] // LA
cities[3] // Santiago
```

실제 코드에서는 위의 예시 처럼 미리 배열의 아이템과 크기를 선언하는 방법은 잘 사용하지 않고, 빈 배열을 선언 후 나중에 배열에 아이템을 넣는 방법을 많이 사용합니다.


### **(2). 동적 선언** 


선언 방법에는 선언과 초기화를 함께 선언하는 방법과 분리하는 방법이있습니다.      
아래 코드들을 보면 문법이 정식 문법과 단축 문법으로 나뉘는 것을 볼 수 있는데,
이 두가지의 차이점은 간단하게 Array의 선언 여부 입니다.

* 정식 문법 : (let 또는 var) 배열 이름: Array<타입>
* 단축 문법 : l(et 또는 var) 배열 이름 : [타입] 
   
이 두가지 문법중에 자주 사용하는 문법은 당연히 더 간단한 **단축 문법**이겠죠?   
아래 형식과 예시코드를 살펴보면서 이해해보도록 하겠습니다.

```
// 배열 선언 & 초기화

// 정식 문법

var/let 배열명 = Array<아이템 타입>()

var/let 배열명 : Array<아이템 타입> = [Float]() // 타입 어노테이션 + 제네릭 + 초기화

var/let 배열명 : [아이템 타입] = Array() // 타입 어노테이션 + 구방식의 초기화

// 단축 문법

var/let 배열명 = [아이템 타입]()

var/let 배열명 : [아이템 타입] = [] // 타입 어노테이션 + 초기화
```

위의 코드는 다양한 선언 및 초기화를 함께하는 형식을 소개하였습니다.
코드 형식을 보니깐 단축 문법이 왜 많이 사용되는지 알겠죠??
   
그렇다면 선언과 초기화를 나눌 수도 있을까요?
네 나눌 수 있습니다! 아래 코드를 같이 보시죠.

```
// 정식 문법

var cities : Array<String> // 선언
cities = Array() // 초기화


// 단축 문법

var country : [String] // 선언
country = [] // 초기화

```


위 글들을 전체적으로 보면 정적 선언보다 **동적 선언 방법**을 더 많이 사용하고,
정식 문법보다 **단축 문법**을 더 많이 사용하는 것 같습니다.




**주의할 점**


1. **빈 배열을 만들 때는 반드시 타입을 명시해야합니다.**


```
let emptyArr = [] // 에러
```

2. **다른 타입의 값을 한 배열에 넣으면 안 됩니다.**

```
let arr = [1, "소진", 3.5, "아"] // 에러
```

단! 여러 타입의 값을 한 배열 안에 다 넣을 방법이 없는 것은 아닙니다.   
Any를 사용하면 되는데 아래 예시 참고하여 이해해주세요!
   
```
// 여러 자료형(타입)
let anyArr: [Any] = [1, 2, "sojin", "소진"] // [1, 2, "sojin", "소진"]
```

왜 AnyObject는 안되나요?
AnyObject는 모든 클래스 타입을 지칭하는 프로토콜이기때문에 타입자리에 넣을 수 없습니다!




## **1.3. 응용하기**
   
      
### **(1). 배열에 값을 넣기**

아래 예시를 참고해서 이해해주세요.

```
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
```


### **(2). 크기가 정해진 배열**
   
```
// (repeating: 배열의 타입과 일치하는 값(1개), count: 값을 반복할 횟수)
 
let numArray1 = [Int](repeating: 0, count: 10) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
 
let numArray2 = Array(repeating: 0, count: 10) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
범위 연산자와의 차이점이라고 하면 범위 연산자는 특정 범위 내에서 1씩 증가한 값이 배열에 넣어지지만,

Array(repeating:count:) 메서드는 반복할 값 1개(repeating)가 지정된 횟수(count) 만큼 배열에 넣어집니다.
```

범위 연산자와의 차이점이라고 하면 범위 연산자는 특정 범위 내에서 1씩 증가한 값이 배열에 넣어지지만,   Array(repeating:count:) 메서드는 반복할 값 1개(repeating)가 지정된 횟수(count) 만큼 배열에 넣어집니다.

   
      
### **(3). 범위 연산자를 이용한 값 참조**
   
이  방식은 배열 값을 수정할때 적용하면 매우 유용하다고 합니다.

```
var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2] // ["a", "b", "c"]
alphabet[2...3] // ["c", "d"]
alphabet[1..<3] // ["b", "c"]

alphabet[1...2] = ["1", "2", "3"]
// alphabet ["a", "1", "2", "3", "d", "e"]

alphabet[2...4] = ["A"]
// alphabet ["a", "1", "A", "e"]
```

위의 마지막 부분 예시를 보면 해당 위치의 배열에 새로운 값을 넣어 변경 할 수도 있습니다.
   
      

### **(4). 동적 할당**
   
배열에 아이템을 동적으로 추가할 때에는 메소드를 사용하는데, 대표적인 것으로 아래 세가지만 소개하겠습니다.


* append(_:) : 아이템을 배열의 맨 뒤에 추가 ( 추가 전에 배열의 크기 +1만큼 확장하여 인덱스 공간 확보 함)
* insert(_:at:) :  아이템을 배열 맨 뒤가 아닌 원하는 위치에 직접 추가 (쉽게 말해 끼어들기)
* append(conteentsOf:) : 배열의 맨 뒤에 추가하지만, 개별 아이템이아닌 여러 개의 아이템을 한꺼번에 추가

    
위의 소개만 보면 잘 이해가 안되니 예시와 같이 참고해주세요!

```
var cities = Array<String>()

cities.append("Seoul") //["Seoul"]
cities.append("New York") //["Seoul", "New York"]
cities.insert("Tokyo", at: 1) //["Seoul", "Tokyo", "New York"]
cities.append(contentsOf: ["Dubai","Sydney"]) //["Seoul", "Tokyo", "New York", "Dubai","Sydney"]
```

위에 정적인 방법으로 선언을 했을때, 아래와 같이 아이템 값을 넣은 것 같은데. 이번에도 이렇게 추가 할 수 있을까요?

결론 부터 말하자면, 안됩니다. 아래 방식처럼 값을 추가하기 위해서는 배열에 그 인덱스가 이미 만들어져 있거나 확보된 경우로 제한되어있습니다!

```
cities[5] = "UK" // 추가X
```
   
      
### **(5). 순회 탐색**

```
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

```

# QnA

Q. 배열은 배열의 크기가 정해지지 않고 사용하는데, 이유는 무엇인가?
A: 미리 고정크기를 정해 놓고 메모리를 할당하게되면 쓰지 않는 배열이 있을 시 비효율적으로 메모리 자원을 사용하게 된다. 
때문에 메모리 동적할당이 메모리 사용에 더 효율적인 방법이다.


Q. 배열의 중간 데이터를 삭제하면 index가 번호가 -1씩 된다고 배웠는데, 어떻게 앞으로 옮겨지는 것 인가?
A: 제거할 inde의 위치를 찾음 -> 앞으로 원소를 이동 -> count 감소 (? 확인 후 수정)

***
   
# 집합

같은 타입의 서로 다른 값을 중복 없이 저장하고자 할 때 사용하는 집단 자료형 입니다.

* 순서가 그다지 중요하지 않은 데이터
* 중복 없이 한 번만 저장해야하는 데이터
* 해시(Hash) 연산의 결과 값을 이용하여 데이터를 저장하므로 집합에 저장할 데이터 타입은 해시 연상을 할 수 있는 타입이어야 합니다.


Q. 해시 연산이란?

: 해시 연산은 보통 해시 알고리즘이라 불리는 것으로서, 임의의 입력된 메시지를 고정 길이의 데이터 크기로 변환해주는 알고리즘입니다. 해시 알고리즘을 사용하면 아무리 긴 데이터나 아무리 짧은 길이의 데이터라 할 지라도 고정 길이의 데이터로 변환 할 수 있습니다.



## **2.1 집합의 정의**
집합을 정의할 때에는 배열 데이터를 사용하여 정의합니다. 하지만 단순히 배열 데이터를 사용하여 정의하게 되면 컴파일러는 이 데이터들을 집합이 아닌 배열로 인식합니다.  
이 같은 상황을 방지하고 집합 타입이라는 것을 컴파일러에 직접 알려주기 위해 타입  Set을 꼭 기재해야 합니다. 


###** (1) 초기값을 사용하여 바로 정의**

```

// (var 또는 let) 변수명 : Set = [] - 저장할 타입 생략

var genres : Set = ["Classic","Rock","Balad"] //Set이 없으면 배열로 선언 됨 주의!

// (var 또는 let) 변수명 : Set<타입> - 저장할 타입 생략하지 않은 경우

var genres : Set<String> = ["Classic","Rock","Balad"]
```


### **(2) 빈 집합을 선언하고 초기화하는 과정을 거쳐 정의**

```

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
```



## **2.2 집합 연산**

### **(1) 기본 집합 연산**


* intersection(_:) : 양쪽 집합에서 공통되는 아이템만 선택하여 새로운 집합을 만들어주는 메소드 (교집합)
* symmetricDifference(_:) : 양쪽 집합 중에서 어느 한쪽에만 있는 아이템을 선택하여 새로운 집합을 만들어주는 메소드 (공통 집합 X)
* union(_:) : 양쪽 집합에 있는 모든 아이템을 선택하여 새로운 집합을 만들어주는 메소드 (합집합)
* subtract(_:) : 한 쪽 집합에 있는 모든 아이템에서 다른 쪽 집합에도 속하는 공통 아이템을 제외하고 새로운 집합을 만들어주는 메소드 (차집합)



```
var oddDigits : Set = [1, 3, 5, 7, 9] // 홀수 집합
let evecDigits : Set = [0, 2, 4, 6, 8] // 짝수 집합
let primeDigits : Set = [2, 3, 5, 7] // 소수 집합

oddDigits.intersection(evecDigits).sorted() // []
oddDigits.symmetricDifference(primeDigits).sorted() // [1,2,9]
oddDigits.union(evecDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.subtract(primeDigits) //{1, 9}
oddDigits.sorted() // [1, 9]
```



### **(2) 부분 집합과 포함 관계 판단 연산**


* isSuperset(of:) : 주어진 집합의 값 전체가 특정 집합에 포함되는지를 판단하여 true,false를 반환합니다. 
-> 하나의 집합이 다른 집합의 부분집합인지에 대한 판단
* isStrictSubset(of:) : 주어진 집합이 특정 집합의 모든 값을 포함하는지를 판단하여 true,false를 반환합니다.
 ->   집합이 다른 집합의 상위 집합 역할을 하는가에 대한 판반
* isStrictSuperset(of:) : 주어진 집합이 특정 집합의 부분 집합인지 아니면 상위 집합인지를 판단하는 역할을 하지만 두 집합이 서로 같은 경우의 결과 값이 다르게 반환됩니다.     


두 집합이 서로 일치할 경우 ,
	* isSubset(of:), isSuperset(of:) 메소드는 수학적으로 서로가 서로의 부분 집합이자 상위 집합이 될 수 있으므로 true를 반환
	*  isStrictSuperset(of:), isDisjoint(with:) 메소드는 이를 더 엄격하게 판단하여 정확히 부분 집합, 또는 상위 집합일 때만 true를 반환 (서로 일치하는 집합은 동일한 집합으로 판단하지 부분 집합이나 상위 집합으로 판단하지 않는다.)


* isDisjoint(with:) : 두 집합 사이의 공통 값을 확인하여 아무런 공통 값이 없을 때 true를 , 공통 값이 하나라도 있으면 false 를 반환합니다.


```
let A : Set = [1, 3, 5, 7, 9]
let B : Set = [3,5]
let C : Set = [3,5]
let D : Set = [2, 4, 6]

B.isSubset(of: A) // true
A.isSuperset(of: B) // true
C.isStrictSubset(of: A) // true
C.isStrictSubset(of: B) // false
A.isDisjoint(with: D) // true
```


### **(3) 중복 아이템 제거하기**


```
var  A = [4 , 2, 5, 1, 7, 4, 9, 11, 3, 5, 4]

let B = Set(A) // 집합
A = Array(B) // 중복이 제거된 배열
// [2, 5, 11, 1, 7, 9, 3, 4]
```
***

# 튜플


튜플은 배열과 비슷한 형식이지만 배열과는 다르게 길이가 고정 되어습니다.

* 하나의 튜플에 여러가지 타입의 아이템을 저장가능
* 상수적 성격을 띠어 최초 선언 후 값을 추가하거나 삭제가 불가능
* 함수 반환값을 사용할 때 매우 유용하게 사용가능
* 리스트랑 비슷


튜플은  아래와 같은 타입을 담을 수 있습니다.

* **named type** - Int, String, Bool 등등
* **compound type** - Tuple type, function type

당장 이 부분만 보면 잘 이해가 안 가는데, 아래 응용 부분의 예제와 함께 이해해 봅시다.

## 3.1. 선언 방법 및 응용하기
선언 방법은 아주 쉽습니다. ()을 사용하여 아이템을 한꺼번에 묶어서 사용하면되는데요.
아래 예시와 같습니다.

```
// (let 또는 var) 배열명 = (<Tuple item1>, <Tuple item2>,...)

let tupleValue = ("a", "b", 1, 2.5, true)
```



### **(1).  Named type 담기**


가장 일반적으로 담는 데이터 형식 입니다.
튜플은 값을 접근하기 위해서는 **[] 대신  .을 사용**합니다.

```
let tupleValue = ("a", "b", 1, 2.5, true)

tupleValue.0 // "a"
tupleValue.1 // "b"
tupleValue.2 // 1
tupleValue.3 // 2.5
tupleValue.4 // true



var tuple =(1, "Hello, world!", true) // (1, "Hello, world!", true)

tuple.0 // 1
tuple.2 // true




var anotherTuple = (1, (tuple)) //(1, (1, "Hello, world!", true))
 
anotherTuple.1 // 1
anotherTuple.1.1 // "Hello, world!"
anotherTuple.1.2 // true
```


### **(2). function type 담기**

```
func a() -> Int { return 1 }

func b() -> String { return "Sojin" }

func c() -> Bool { return false }

var functionTuple = (a(), b(), c()) // (1, "Sojin", false)

functionTuple.0 // 1
functionTuple.2 // false
```

### (3).  튜플의 파라미터에 이름을 붙이기

```
// 예시 1

var namedCoffeeInfo = (coffee: “아메리카노”, price: 5100)

namedCoffeeInfo.coffee // 아메리카노
namedCoffeeInfo.price // 5100
namedCoffeeInfo.price = 5100


// 응용
let (coffee, price) = (“아메리카노”, 5100)

coffee // 아메리카노
price // 5100


// 예시 2

var namedTuple = (name:”Sojin”, age:999, likes: [“Swift”,”iOS”])

namedTuple.name //“Sojin”

namedTuple.age //999

namedTuple.likes //[“Swift”,”iOS”]
```

 예시 2에 likes을 보면 배열이 들어가 있는 것을 볼 수 있죠? 
배열도 named Type이기 때문에 튜플에 들어갈 수 있습니다.


###  **(4). 함수 메소드에서 응용하기**

```
*// 예시 1*

func getTupleValue() -> (String, String, Int){
   return(“sojin”, “min”, 100)
}

let(aa,bb,cc) = getTupleValue();

print(aa) *// “sojin”*
print(bb) *// “min”*
print(cc) *// 100*

let (aaa,bbb,_) = getTupleValue()

print(aaa) *// “sojin”*
print(bbb) *// “min”*


*// 예시 2*

func someFunction() -> (Int,String,Bool){

    return (1,”Sojin”,true)

}

var someTuple = someFunction()

someTuple.0 *//1*

someTuple.1 *//“Sojin”*

someTuple.2 *//true*



var (f,g,h) = someFunction()

print(f) *// 1*

print(g) *// “Sojin”*
```

**주의할 점**
 
튜플은 하나의 아이템만 있으면 아이템 타입의 일반 자료형이 됩니다.
 아래 예시 중 tpl04를 보면서 이해하시면 될 것 같습니다.


```
var tpl01 : (Int,Int) = (100,200)
var tpl02 : (Int, String, Int) = (100, “a”, 200)
var tpl03 : (Int, (String, String)) = (100, (“t”,”v”))
var tpl04 : (String) = (“sample string”) *// 튜플이 아니라 문자열 타입의 변수로 선언 됨*
```


## **튜플로 loop를 돌릴 수는 없을까?**

튜플로 for문을 돌리게 되면 “does not conform to protocol ‘Sequence’  라는 오류 메세지가 나옵니다.
튜플이 **Sequence라는 프로토콜을 준수하지 않기 때문에** 생기는 오류라고 합니다!  이러한 이유때문에 튜플로 루프를 돌릴 수 있는 방법은 없습니다.

그러나, **튜플을 Sequence 프로토콜을 따르는 다른 것에 넣어주면 루프를 돌 수 있다는 말이 됩니다.**
 Sequence 프로토콜을 따르는 대표적인 것은 배열 인데, 
**“배열”** 안에 튜플을 넣어 줄 수 있습니다!

```
var tupleArr = [(1, “Hello, world!”, true),(2, “Hello, world!”,false)]

var tuple = (1, “Hello, world!”, true)

var anotherTuple = (1,(tuple))


var tupleArr = [tuple,tuple]*//OK*
var errorTupleArr = [tuple,anotherTuple]*//error!!!!*
```
 
위와 같은 방법으로 넣으면 됩니다.

**배열에 튜플을 넣을 때 주의할 점**
: 넣어 주는 튜플의 타입과 순서, 개수 모두 같아야한다.


그럼 이제 루프를 돌려볼까요?

```
var tupleArr = [(1, “Hello, world!”, true) ,(2, “Hello, world!”,false)]

for index in tupleArr{

    print(index.0)*//1 2*

    print(index.1)*//“Hello, world!” “Hello, world!”*

    print(index.2)*//true false*

}
```

위와 같이 코드를 돌리게 되면 루프가 돌아가는 것을 알 수 있습니다.
원소에 이름을 넣게 되면 index.(이름)이 나오겠죠?


## 이외..

튜플은 **tpealias**와 같이 사용하면 깔끔하게 쓸 수 있다고 합니다.

```
// typealias 사용하기
typealias People = (name:String,age:Int, likes:[String])

// people 타입으로 튜플을 받을 수 있음
var person : People = (“Sojin”,123,[“Swift”,”iOS”])

// 여러개의 배열을 만들 수 있음
var peopleArr : [People] = [(“Sojin”,123,[“Swift”,”iOS”]),(“min”,987,[“Piano”,”Poet”])]
```


# 딕셔너리

사전에서 고유 단어와 그 의미가 연결되어 있는 것처럼, 고유 키(Key)와 그에 대응하는 값(Value)을 연결하여 데이터를 저장하는자료형 입니다.

**딕셔너리를 사용할 때 주의할 점**

* 하나의 키는 하나의 데이터에만 연결되어야 함
* 하나의 딕셔너리에서 키는 중복될 수 없습니다. 중복해서 선언하면 아이템 추가가 아니라 수정이 이루어져 기존 키에 연결된 데이터가 제거 됨
* 저장할 수 있는 데이터 타입에는 제한이 없지만, 하나의 딕셔너리에 저장하는 데이터 타입은 모두 일치해야 함
* 딕셔너리의 아이템은 순서가 없지만, 내부적으로 순서가 있으므로 for~in을 통한 순환 탐색 가능
* 키는 hash 연산이 가능한 타입이어야 함.


## **4.1. 딕셔너리 정의 방법**

```
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
```
   
      

## 4.2. 응용하기
   
### **(1). 딕셔너리에 저장된 아이템을 제거하는 방법**

* nil을 할당하는 방법
* 명시적으로 removeValue(forKey:) 메소드 사용

```
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
```
   
   
### **(2). 옵셔널(Optional)**

일단 먼저 옵셔널에대해서 생소한 개념이라 옵셔널의 정의 부터 알아보겠습니다. 옵셔널이란? 스위프트에서 도입된 새로운 개념으로서 언어 차원에서 프로그램의 안전성을 높이기위해 사용하는 개념을 말 합니다..
그럼 딕셔너리에서 왜 옵셔널을 사용할까요?
아래 예시 코드와 설명을 같이 보면서 이해해 봅시다.

```
print(newCapital )//["KR": "Seoul", "JP": "Sapporo"]

Optional(newCapital["Sapporo"]) // nil

Optional(newCapital["JP"]) // "Sapporo"

Optional(newCapital["KR"]) //"Seoul"

Optional(newCapital["EN"]) / / nil
```

옵셔널을 사용하여 해당 키를 검색?하면 값이 나오는걸 볼 수 있습니다.
물론, 없는 키값을 입력하면 nil 값이 나옵니다.
   
딕셔너리는 키 자체가 일련의 순서를 가지고 있지 않기때문에 해시 연산에 의한 결과 값 역시 연속되는 값이 아닙니다.  —> 키와 값에 대한 보장이 없음   
   
즉, 딕셔너리에 특정 키를 통해 접근 할 때 해당 키에 대응하는 value 값이 존재하지 않을 수 있기 때문에 **옵셔널 타입의 값을 반환하는겁니다.**   
      
딕셔너리 키에 대응되는 값을 논 옵셔널로서 사용해야한다면 **옵셔널 바인딩**을 사용하거나, **강제 언레핑**을 사용하여 논 옵셔널 값을 얻어낼 수도 있습니다.

### **(3). 순회 탐색**

```
// 딕셔너리의 순회 기능을 사용하여 순회 탐색

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

```

이와 같이 이번에는 집단 자료형에 대해서 살펴 보았습니다.
지금까지 배운 자료형을 정리해보면서 마무리 하겠습니다.


* 배열 : 순서 있는 데이터들을 저장할 때 사용하며 중복된 값을 저장할 수 있습니다. 저장된 데이터는 인덱스로 관리됩니다.
* 집합 : 순서 없는 데이터를 저장할 때 사용하며, 중복된 값은 한 번만 저장됩니다.
* 딕셔너리 : 순서 없는 데이터를 키-값 형태로 저장할 때 사용하며, 중복된 값을 저장할 수 있지만 중복된 키를 사용할 수 없습니다.
* 튜플 : 데이터를 나열해서 소괄호로 묶어 사용하며, 내부적으로 순서가 있지만, 순서 처리를 지원하지는 않습니다. 서로 다른 데이터 타입의 데이터를 저장할 수 있습니다.


# QnA

Q. set,dictionary는 왜 데이터가 순서에 맞게 들어가지 않나요?
A. 해시 연산을 사용해서 값을 저장하기때문에
* dictionary는 key-value가 한쌍인데, value값은 중복이될 수 있지만 key값은 중복이되면 안됨. 그래서 key 값을 해시 연산
* set은 값 자체를 해시 연산

Q. array,tuple,dictionary,set 중 heap 영역에 데이터를 저장하는 것은 무엇인가요?
A. set, dictionary입니다. 해시 연산을 사용하고 배열에 순서가 없는 집단 자료형으로 생각하면 기억하기 쉽습니다!
여기서 엄밀히 말하지만, dictionary는 key값이 heap 영역에 저장 되는 것이므로 전체가 heap 영역에 저장되는 것은 아닙니다.

***

# 조건문
   
## switch case


Switch 구문은 앞에서 다룬 if 와 guard 처럼 분기문의 일종이지만, 처리 방식은 앞에서와 다릅니다.
switch 구문은 입력받은 값을 조건식 여부가 아니라 패턴으로 비교하고 그 결과를 바탕으로 실행 블록을 결정하는 조건문입니다.


**Switch 구문 형태**

```
switch [비교 대상] {
	case [비교 패턴1] :
    	[비교 패턴1이 일치했을 때 실행할 구문]
    case [비교 패턴2], [비교 패턴3] :
    	[비교 패턴2 또는 3이 일치했을 때 실행할 구문]
    default:
    	[어느 비교 패턴과도 일치하지 않았을 때 실행할 구문]
 }
```


**Switch문 문법**

* 각 상태는 키워드 case를 통해 나타낼 수 있습니다.
* case 상태 끝에 콜론 ':'을 붙여 패턴을 종료합니다.
* 하나의 case문이 종료되면 switch 문이 종료됩니다.
* switch문은 모든 경우를 커버하기 위해서 마지막에 default 키워드를 사용해야합니다.

C나 자바 등 많은 언어에도 switch 구문이 있고 문법 역시 유사하지만, 실행 방식에서는 결정적인 차이점이 존재합니다.
무엇일까요?

* **C나 자바일 경우**
**비교 패턴이 일치할 경우 우선 실행 구문을 처리한 다음, 나머지 case에 대한 비교를 계속 진행합니다.**
       추가로 일**치하는 패턴이 있다면 이를 모두 실행**하고, 마지막 case를 비교한 후에야 분기문을 종료합니다.


* **스위프트일 경우**
일치하는 비교 패턴이 있을 경우 해당 블록의 **실행 코드를 처리하고, 더이상의 비교 없이 전체 분기문을 종료**합니다.
설사 일치하는 비교 패턴이 여러 개 있더라도**맨 처음 일치하는 case 구문 하나만 실행**하죠. (그래서 break 구문을 스위프트에서 생략할 수 있음)

이해가 어렵다면 아래의 예시 코드를 볼까요?
```
let val = 2

switch val {
	case 1 : 
    	print("일치한 값은 1입니다.")
    case 2 :
    	print("일치한 값은 2입니다.")
    case 3 :
    	print("일치한 값 2가 더 있습니다.")
   	default : 
    	print("어느 패턴과도 일치하지 않았습니다")
}

-------------------------------------------------------------------------

swift 실행 결과

일치한 값은 2입니다.

-------------------------------------------------------------------------

c와 자바에서의 실행 결과

일치한 값은 2입니다.
일치한 값 2가 더 있습니다.
어느 패턴과도 일치하지 않았습니다.
```


## 1-2. switch 구문에서의 Fall Through

switch 구문에는 패턴이 일치하는 case 블록을 실행하는 대신, 그 다음 case 블록으로 실행 흐름을 전달하는 문법을 말합니다.

* 스위프트 : **명시적** Fall through

```
let sampleChar : Character = "a"

switch sampleChar {
	case "a" :
    	fallthrough
    case "A" :
    	print("글자는 A 입니다.")
    default :
    	print("일치하는 글자가 없습니다.")
}

-------------------------------------------------------------------------

실행 결과

글자는 A 입니다.

```
예제 코드를 살펴보면 case"a" 안에 fallthrough가 명시되어있습니다.
스위프트에서는 암시적인 Fall through를 지원하지 않으며, case 실행 블록이 비어있어서도 안됩니다.

Q.F all through는 항상 다음 case문에만 걸리는 건가요? 아니면 일치하는 case문에 걸리나요?
A: Fall through는 무조건 다음 case문에 걸려서 종료됩니다.



## 1 - 3. switch 구문의 특성

### **1. 반드시 default 구문을 추가하여야 합니다.**

스위프트에서 switch 구문에 사용된 비교 대상은 반드시 하나의 비교 패턴과 일치해야 합니다. 이에 따라 모든 case 구문에서 일치된 패턴을 찾지 못했을 경우에 대비하여 switch 구문에는 반드시 default구문을 추가해야하며, 만약 default를 생략하면 완전하지 않은 구문으로 간주하여 오류가 발생합니다. (단, default 구문을 대신하여 모든 패턴을 매칭시킬 수 있는 구문이 존재하는 경우에 한하여 default 구문 생략 가능)


### **2. case 비교 패턴을 작성할 때, 하나의 case 키워드 다음에 하나 이상의 비교 패턴을 연이어 작성할 수 있습니다.**


두 가지 이상의 패턴에 대해 같은 구문을 실행해야 한다면, 하나의 case 키워드로 비교 패턴을 묶어 표현하면 됩니다.
이는 키 입력의 낭비를 줄이고 코드를 줄이고 코드를 보다 간결하게 만드는게에 효과적입니다.

```
var value = 3

switch value {
	case 0,1 :
    	print("0 또는 1입니다.")
    case 2,3 :
    	print("2 또는 3입니다.")
    default :
    	print("default 입니다.")
}

-------------------------------------------------------------------------

실행 결과

2 또는 3입니다.
```


### **3. switch 구문에서 튜플 내부의 아이템이 비교 대상과 부분적으로 일치할 경우, 스위프트는 case 구문의 비교 패턴 전체가 일치하는 것으로 간주합니다.**


이때, 일치하지 않는 나머지 부분을 상수나 변수 화하여 사용할 수 있습니다. 
잘 이해가지 않는 다면 아래 예제를 같이 봅시다.


```
var value = (2,3)

switch value {
	case let (x,3) : 
    	print("튜플의 두 번째 값이 3일 때 첫 번째 값은 \(x)입니다.")
    case let (3,y) :
    	print("튜플의 첫 번때 값이 3일 때 두 번때 값은 \(y)입니다.")
    case let (x,y) :
    	print("튜플의 값은 각각 \(x)\(y)입니다.")
}

-------------------------------------------------------------------------

실행 결과

튜플의 두 번째 값이 3일 때 첫 번째 값은 2입니다.
```

위 예제에서 비교대상 (2,3)과 부분적으로 일치하는 case 문을 실행하는 것을 볼 수 있습니다.
위 예제들 뿐만 아니라 switch 문을 다양하게 응용하여 사용할 수 있는데요. 더 많은 예제도 살펴 볼까요?


## 1-4. 예제

### (1) IntervalMatching

interval Matching이란 범위 연산자를 활용하여 단순히 값을 매칭하는 것뿐만이 아니라 다양한 패턴을 이용하여 매칭하는 것을 말합니다. 

 -> 글이 작성된 시간(초)을 범위에 따라 그룹지어 표현해주는 예시

```
var passtime = 1957

switch passtime {
	case 0..<60 :
    	print("방금 작성된 글입니다.")
    case 60..<3600 :
    	print("조금 전 작성된 글입니다.")
    case 3600..<86400 :
    	print("얼마 전 작성된 글입니다.")
    default :
    	print("예전에 작성된 글입니다.")
}

---------------------------------------------------------------------

실행 결과

조금 전 작성된 글입니다.

```


Q. 튜플(tuple)이 뭐야?
: 집단 자료형으로서, 괄호로 묶인 이형 집단 데이터 입니다.
자세한 설명은  [집단 자료형](#튜플)로 들어가면 알 수 있습니다.


### (2) 튜플 매칭


-> 튜플 형식의 테이터 비교하는 예시
```
var value = (2,3)

switch value {
	case (0..<2,3) :
    	print("범위 A에 포함되어있습니다.")
    case (2..<5, 0..<3) :
    	print("범위 B에 포함되어있습니다.")
    case (2..<5, 3..<5) :
    	print("범위 C에 포함되어있습니다.")
    default:
    	print("범위 D에 포함되어있습니다.")
}       

-------------------------------------------------------------------------

실행 결과

범위 C에 포함되어있습니다.
```


### (3) 값 바인딩


-> 좌표를 이용한 바인딩 예시
```
var value = (-1,0)

  switch value {
    case (0, 0):
        print(“\(value)는 원점 입니다.”)
    case (let x, 0):
        print(“좌표는 \(x),0 입니다.”)
    case (0, let y):
        print(“좌표는 0,\(y) 입니다.”)
    case (-2…2, -2…2):
        print(“\(value) 값은 해당 범위 안에 있습니다.”)
    default:
        print(“\(value) 값은 해당 범위 밖에 있습니다.”)
    }
}

-------------------------------------------------------------------------

실행 결과

좌표는 -1,0입니다.

```


### (4) where 문

이 예제는 튜플 값을 변수에 담고 조건 검사까지 한 경우입니다.

-> 좌표축의 값을 받아 문장으로 표현해주는 예시
```
var point = (3,-3)

switch point {
    case let (_,y) where -3 == y :
        print(“\(y)은 -3==y 선 상에 있습니다.”)
    case let (x,y) where x == y :
        print(“\(x)과 \(y)은 x==y 선 상에 있습니다.”)
    case let (x,y) where x == -y :
        print(“\(x)과 \(y)은 x==-y 선 상에 있습니다.”)
    case let (x,y) :
        print(“\(x)과 \(y)은 일반 좌표상에 있습니다.”)
}

---------------------------------------------------------------------------

실행 결과

3은 -3==y 선 상에 있습니다.

```


### (5) Enum 응용

```
enum Barcode {

    case upc(Int, Int, Int, Int)

    case qrCode(String)

}



var product = Barcode.upc(8, 85909, 51226, 3)

product = .qrCode(“ABCDEFG”)



switch product {

case .upc(let numberSystem, let manufacturer, let product, let check):

    print(“UPC: \(numberSystem), \(manufacturer), \(product), \(check).”)

case .qrCode(let productCode):

    print(“QR code: \(productCode).”)

}
```

***

# 반복문

반복문은 주어진 조건에 의해 특정 코드 블록을 반복적으로 실행할 수 있게 해주는 구문입니다.
프로그래밍에서 코드 블록의 반복을 루프(Loop)라고 부르고 반복되는 횟수를 루프 횟수라고 부릅니다.


반복문은 두 가지 방식으로 나눌 수 있습니다.


**1.** **For 반복문 : 횟수에 의한 반복**

**2.** **While 반복문: 조건에 의한 반복**
	* While 구문 : 매번 루프를 시작할 때 조건식을 평가하여 루프를 돌지 말지 결정합니다.
	* repeat ~ while 구문 : 루프를 완료할 때마다 조건을 평가하여 다음 루프 실행 여부를 결정합니다. ( 일단 주어진 코드 블록을 실행한 다음에 다시 한 번 루프를 실행할지 말지를 조건식을 통해 평가)

# for문
For 반복문은 in 키워드와 함께 사용되어 정해진 횟수만큼 주어진 코드 블록을 반복해서 실행합니다.

먼저, 구문의 형식을 살펴봅시다.

```
for <루프 상수> in <순회 대상>{

    <실행할 구문>

}
```

기본적으로 이 구문을 실행하기 위해서는 세 개의 항목이 필요합니다.


**1.** **루프 상수** : 구문이 반복될 때마다 순회 대상이 포함하고 있는 개별 아이템들을 차례로 넘겨받아 임의로 저장하고, 실행 블록 내에서 사용할 수 있도록 해주는 역할 ( 이 객체는 루프 구문이 순회할 때마다 자동으로 재 선언되므로 let 키워드를 사용하여 직접 선언할 필요가 없다는 점 유의)
**2.** **순회 대상**
**3.** **실행할 구문**

여기서 가장 중요한 것은 **순회 대상** 입니다.
순회 대상은 주로 순번을 가지는 집단 자료형이나 또는 범위를 가지는 데이터 등이 사용 되는데, 이 대상의 길이나 포함하고 있는 아이템의 개수만큼 구문이 반복 수행됩니다.
순회 대상으로 사용할 수 있는 데이터 타입에는 다음과 같은 것들이 있습니다.


* 배열(Array)
* 딕셔너리(Dictionary)
* 집합(Set) 
* 범위 데이터 :  범위 연산자에 의해 규칙적인 간격으로 나열된 정수들의 모음
* 문자열(String) : Character 타입의 데이터들이 모여 이루는 집단적 성격의 데이터


**범위**
a...b - a부터 b까지 포함
a..<b - a부터 b-1까지


예시를 통해 좀 더 살펴보도록 하겠습니다.


## 1-2. 문자열의 문자 순회

String 타입 자체는 순회 처리를 지원하지 않으므로 characters 속성을 사용해야 합니다.

아래 코드는 문자열의 크기만큼 총 5회 반복됩니다.

```
var lang = "swift"

for char in lang.characters{

  print("개별 문자는 \(char)입니다.");

}
```


## 1-3. 루프 상수 생략
언더바(_)를 사용하여 루프 상수를 생략할 수 있습니다.

```
let size = 5

let padChar = "0"

var keyword = "3"



for_in 1...5 { 

keyword = padchar + keyword

}

print("\(keyword)")

출력값
000003
```

위 코드는 size 값만큼 keyword 문자열의 왼쪽에 0을 채워 넣는 구문입니다.
주어진 값이 5까지이므로 1부터 5까지 모두 5회에 걸쳐 루프가 실행되며, 매 실행마다 왼쪽에 0이 추가됩니다.

이 구문에서는 루프 상수가 굳이 필요하지 않습니다.
따라서 루프상수 자리에 언더바로 대신하였는데, 변수나 상수가 들어가야 할 자리를 언더바로 채우는 것은 스위프트에서 다음과 같은 의미를 가집니다.


**" 그 위치에 뭔가 변수나 상수가 필요하다는 건 알지만, 우리에겐 필요가 없어요,**
**그러니 그냥 생략할게요. 실수로 빠트렸다고 생각 할까봐 표시는 해두었으니 문법이 틀렸다는 오류는 내지 마세요."**


## 1-3. for~in 구문의 중첩 (다중 루프)

for~in 구문 내에 또 다른 for~in을 작성하여 사용할 수 있다는 뜻입니다.
이러한 형태를 흔히들 **다중 루프**라고 부르는데, 특히 두 개의 루프 구문이 중첩된 코드를 별도로 **이중 루프**라고 부릅니다.
다중 루프를 효과적으로 사용하면 굉장한 시너지 효과를 낼 수 있지만, 반대로 코드의 해석을 난해하게 만드는 주범이 되기도 하므로 주의해서 사용해야 합니다.

```
for i in 1..<10 {

	for j in 1..<10 {

		pring("\(i) x \(j) = \(i * j)")

	}

}

```
# while 반복문

while 구문은 단순히 주어진 조건식의 결과가 false가 될 때까지 실행 구문을 계속 반복 수행합니다.
**’조건이 만족하는 동안은 계속 실행’** 된다고 생각하시면 됩니다.


while문을 사용해야 하는 경우는 다음과 같습니다.


**1.** **실행 횟수가 명확하지 않을 때**
**2.** **직접 실행해보기 전까지 싱행 횟수를 결코 알 수 없을 때**
**3.** **실행 횟수를 기반으로 할 수 없는 조건일 때**

**while 구문의 사용 형식**

```
while <조건식> {

<code block>

}
```

while 키워드 다음에는 조건식이 사용되는데, 조건식은 반드시 참(true)이나 거짓(false)을 결과 값으로 반환해야 합니다.
그래서 조건식에 주로 연산자가 사용되는 경우가 많습니다.


조건식이 

* true 일때 - 실행 블록 내의 코드가 반복해서 수행
* false 일때- 즉시 반복문의 실행은 종료되고 코드 블록을 빠져나가 바로 다음에 이어지는 구문을 실행

```
var n = 2
while n < 1000 {
	n = n * 2
}
print("n = \(n)")


출력 값
n = 1024
```

while 구문에 조건식 대신 true값을 직접 넣으면 한없이 반복 실행되는 **무한 루프**가 만들어 집니다.
코드 블록을 탈출할 수 있도록 break 문을 넣어주지 않는다면 이 프로그램은 프로세스가 종료되지 않는 한 영원히 실행 블록을 반복하게 됩니다.

```
while true {

	<실행 코드>
    
}
```



### 2-2. repeat~while 구문

repeat~while 반복문은 다른 언어에서 **do~while 구문** 에 해당한다고 생각하시면 됩니다.

**while 구문의 사용 형식**

```
repeat { 

<실행할 구문>

}
while<조건식>
```

조건식을 먼저 평가하여 실행 블록의 수행 여부를 결정하는 while 구문과 달리 repeat~while 구문은 코드 블록을 일단 실행한 다음에 조건식을 평가하여 반복 여부를 결정합니다.
이에 따라 repeat~while 구문은 실행 블록의 **수행을 최소 한 번은 보장**하는 특성을 가지는데, 이것이 while 구문과의 결정적 차이점입니다. while 구문은 조건식을 먼저 평가하여 false가 반환되면 실행 블록을 아예 수행하지 않으니까요.


간단히 정리하면, 

* **while 구문 - 한 번도 실행 안 될 수도 있음**
* **repeate~while 구문 - 무조건 한번은 실행 됨**


아래 코드를 보면서 좀 더 이해해보록 하겠습니다.

```
var n = 1024



*// while 문*

while n < 1000 {
	n = n * 2
}

print (“n = \(n)”

실행 결과
n = 1024

------------------------------------------------------------------------

*//repeat~while 문*

var count = 0

repeat {
    n = n * 2
    count = count + 1
}
while count < 5

print(“n = \(n)”)
print(“count = \(count)”)

실행 결과
n = 2048
count = 5
```

위 예제를 보면 동일한 코드를 실행하였는데, while구문과 repeat~while 구문의 결과 값이 다르게 나왔습니다.

**결과 값이 다르게 나온 이유가 무엇일까요?**
위에 설명했던 것과 같이 repeat~while은 무조건 한 번은 실행되기때문에 결과 값이 2048이 나온 것을 알 수 있습니다.


이와 같이,
repeat~while 구문은 while 구문을 사용해야하는 조건 중에서 반드시 **한 번은 실행할 필요가 있는 조건에** 사용됩니다.


***
# class&struct/Enum

# class


*  전통적인 OOP 관점에서의 클래스 
*  단일 상속만 가능합니다.( 다중 상속 안 됨)
*  참조타입 (=reference type) (call by reference)
*  iOS 프레임 워크의 대부분의 큰 뼈대는 모두 클래스로 구성되어있습니다.


속성 (property) : 클래스에서 제공되는 변수
메소드 (method) : 클래스에서 제공되는 함수


## **클래스 정의**
```
class 클래스명 {
 … }



class Exm { 
	var name = “Sojin”;
    
    func say(){ 
    	print(“Hello, “ + name + “!”); 
        
    } 
  }
```


위 클래스에는 name이라는 속성과 say라는 메소드가 작성되어있습니다. 이것들이 Exm 클래스에 제공되는 기능입니다.
say 메소드 안에 name 속성이 사용되고 있는 것 처럼 클래스에 있는 메소드에 내부는 그 클래스에 있는 속성과 메소드를 그대로 사용할 수 있도록 되어있습니다.


## **인스턴스 생성**
```
var obj:클래스명 = 클래스명();
```

## **class문 써보기**

```
class Exm {
    var name = “Sojin”
    
    func say(){
        print(“Hello, “ + name + “!”)
    }
}

var obj:Exm = Exm();

obj.say();

obj.name = “Hanako”;

obj.say();
```


## **상속하기**

```
class Helo {
    var name:String = “Sojin”;
    func say(){
        print(“Hello, “ + name + “!”);
        
    }
    
}

class Hello:Helo {
    var name2:String = “YAMADA”;
    func say2(){
        print(“Hi,” + name + “-“ + name2 + “!”);
        
    }
    
}
var obj:Hello = Hello();

obj.say();
obj.name = “Sojin”;
obj.name2 = “TANAKA”;
obj.say2();
```



# struct


*  C 언어 등의 구조체보다 다양한 기능
*  Class와 다르게 상속이 불가능 합니다.
*  값 타입
*  Swift의 대부분의 큰 뼈대는 모두 구조체로 구성되어있습니다.
Int, Double, String 타입들이 구현되어있는 정의 부분을 가보겠습니다.


```
struct 구조체 이름 {
 프로퍼티와 메서드들
}


public struct Int : SignedInteger, Comparable, Equatable

public struct Double 

public struct String
```

위 코드중 첫 번째 코드를 보면 상속 받은거 아닌가 라고 생각할 수 있습니다.
: 뒤에 나오는 것은 프로토콜이라고 생각하면 됩니다. "~한 프로토콜들을 채택했어" 라는 느낌으로 보시면 됩니다.


## **인스턴스 생성**

```
let structInstance = 구조체()
```



**struct의 값 타입은 뭔가요?**

값 타입은 데이터를 전달할 때 값을 복사하여 전달합니다. 말 그대로 '사본' 이라고 생각하면 됩니다. (원본은 그대로 유지)

```
struct MyData {
    var age:Int
    var name:String
    
    func getData() ->String {
        return "[\(name)(\(age))]"
        
    }
    
}

var data = MyData(age: 99, name: “Taro”)
var data2 = data
data2.name = “Sojin”
data2.age = 24
print(data.getData()) *// Taro(99)*
print(data2.getData()) *// Sojin(24)*
```


위 코드를 보면 class를 struct로 바꾸기만했는데 실행 결과가 달라졌습니다.
왜 일까요? comparePoint에 poin를 말 그대로 ‘복사’해서 comparePoint에만 값을 넣어주었기 때문입니다.


## Mutating function

Mutating function이란 구조체의 매서드가 구조체 내부에서 **데이터를 수정**할 때 선언하는 키워드입니다.

```
struct Point {
var x = 0 
var y = 0 

mutating func moveTo(x: Int, y: Int) {
	self.x = x  // 컴파일 에러남.
	self.y = y  // 컴파일 에러남. 
  }
}
  -> 컴파일 오류가 발생하지 않게 하기 위해서 func 키워드 앞에 mutating작성 해주어야함.

```

**중첩 타입**

* 타입 내부에 타입 정의
* 클래스, 구조체 , Enum 내부에 타입 정의

```
struct Rectangle { 
	struct Point {
		var x, 
		y : Int 
	}
	struct Size {
		var width, 
		height : Int
	}
	var origin : Point 
	var size : Size
init() { // 초기화 코드 
	} 
}

// 아래 처럼 사용할수 있음. 
let point = Rectangle.Point(x: 10, y: 10)
let size = Rectangle.Size(width: 100, height: 100)

```


### **구조체는 언제 써야할까요?**


* 메모리 참조가 아닌 값의 복사를 원할 때

* 자신을 상속할 필요가 없거나 자신이 다른타입을 상속받을 필요가 없을때 

* 연관된 몇몇의 값들을 모아서 하나의 데이터타입으로 표현하고 싶을때
swift 언어 가이드에서 아래 조건 중에 한가지 또는 그 이상 **해당하는 경우에는 구조체를 사용**하라고 기준을 제시해 주었는데요.


* 구조체의 주목적이 몇몇 연관성있는 간단한 데이터 값의 캡슐화일 경우
* 캡술화된 값들이 그 구조체의 인스턴스가 할당될때나 전달될때 참조보다는 복사가 예상될 경우
* 구조체에 저장되는 모든 프로퍼티들이 참조보다는 복사가 예상되는 값형식일 경우
* 구조체가 다른 형(type)에서부터 프로퍼티나 기능이 상속될 필요가 없을 경우



### **채택과 상속?**


* 클래스 상속 : 상속받을 클래스의 모든 기능을 물려 받는 기능
* 프로토콜 채택 : 내가 이제 이 프로토콜을 준수하겠어! 라는 뜻



### **클래스와 구조체의 공통점**

1. 서로 다른 타입(자료형)들을 하나로 묶을 수 있습니다.
2. 이러한 묶은 자료형들을 새로운 타입처럼 사용 가능합니다.
3. 클래스/ 구조체 안에서 함수/프로퍼티 정의가 가능합니다.
4. extension이 가능합니다.


### **클래스와 구조체의 차이점**


**1.** **구조체**는 value type, 클래스는 reference type 입니다.
**2.** **구조체**는 상속이 불가능합니다.
**3.** **구조체**에서는 AnyObject로 타입캐스팅이 불가능합니다.

**4.** **구조체**는 생성자를 구현하지 않을 시 기본 initializer를 사용할 수 있습니다.

**5.** **클래스**는 reference counting으로 메모리 관리가 가능합니다.


# enum


*  다른 언어의 열거형과는 많이 다른 존재입니다.
*  상속 불가
*  값 타입 (값이 없을 수도 있음. 즉 이름 그 자체 만으로 고유한 의미를 나타낼 수 있음)
*  유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정의한 것 예) 요일, 상태값, 월(Month)
*  열거형 자체가 하나의 데이터 타입
*  열거형의 case 하나하나 전부 하나의 유의미한 값으로 취급
*  선언 키워드 - enum

열거형의 간단한 예제를 보겠습니다.

```
 enum Janken {
    case Choki
    case Goo
     case Paa

 }
 enum 가위바위보 : String {
  case Choki = “가위”
     case Goo = “바위”
    case Paa = “보”

 }

var me = Janken.Goo
var you = 가위바위보.Goo
 print(me)
 // Goo
print(you.rawValue)
// 바위
```

***


#  객체와 인스턴스

# 1.객체(object)

## **1-1. 개념**

객체란 말 그대로 대상을 나타내는 단어입니다.
예를 들어, 사람 개인 한 명 한명을 모두 객체라 할 수 있고, 책 한 권 한 권을 객체라 할 수 있습니다.


모두 다른 특성을 가지고 있기 때문에 객체라고 할 수 있습니다.
이 객체들을 통하여 각 객체와 그 객체들간의 관계를 설계하는 것이 객체 지향 프로그래밍 입니다.


이 객체들 안에는 데이터(상태)와 메서드(행위)라는 것이 들어가 있습니다.
예를 들어 손님이고 생각해볼 때 커피를 마시고 싶은 상태이면, 커피를 주문한다라는 행위가 들어가 있습니다.




## **1-2. 특징**

* ‘클래스의 인스턴스(instance)’ 라고도 부른다.
* 객체는 모든 인스턴스를 대표하는 포괄적인 의미를 갖는다.
* oop의 관점에서 클래스의 타입으로 선언되었을 때 ‘객체’라고 부른다.



객체와 클래스를 많은 책 들에서 붕어빵과 붕어빵을 찍는 기계라고 표현합니다.


붕어빵을 찍어내는 기계는 붕어빵이라는 객체들을 생성하기 위한 틀을 제공합니다.
그래서 **붕어짱 찍는 기계는 클래스라 표현할 수 있고, 붕어빵 틀에서 만들어진 붕어빵들은 각각이 객체**가 됩니다.



# 2.인스턴스(instance)


## **2-1. 개념**


설계도를 바탕으로 소프트웨어 세계에 구현된 구체적인 실체
즉, 객체를 소프트웨어에 실체화 하면 그것을 ‘인스턴스’라고 부른다.
실체화된 인스턴스는 메모리에 할당된다.


* 객체를 생성하여 JVM(자바 가상 머신)이 관리하는 메모리에 적재된 것을 의미
* 어떤 클래스로부터 만들어진 객체 = 그 클래스의 인스턴스
* 클래스로부터 객체를 만드는 과정 = 인스턴스화


## **2-2.  특징**


* 인스턴스는 객체에 포함된다고 볼 수 있다.
* oop의 관점에서 객체가 메모리에 할당되어 실제 사용될 때 ‘인스턴스’라고 부른다.
* 추상적인 개념(또는 명세)과 구체적인 객체 사이의 관계 에 초점을 맞출 경우에 사용한다.
* ‘~의 인스턴스’ 의 형태로 사용된다.
* 객체는 클래스의 인스턴스다.
* 객체 간의 링크는 클래스 간의 연관 관계의 인스턴스다.
* 실행 프로세스는 프로그램의 인스턴스다.
* 클래스가 가지고 있는 메소드(method)를 모두 상속받는다.


즉, 인스턴스라는 용어는 반드시 클래스와 객체 사이의 관계로 한정지어서 사용할 필요는 없다.
인스턴스는 어떤 원본(추상적인 개념)으로부터 ‘생성된 복제본’을 의미한다.


## **- 객체(Object) 와 인스턴스(Instance)의 차이점**

* 클래스의 타입으로 선언되었을 때 객체라고 부르고, 그 객체가 메모리에 할당되어 실제 사용될 때 인스턴스라고 부른다.
* 객체는 현실 세계에 가깝고, 인스턴스는 소프트웨어 세계에 가깝다.
* 객체는 ‘실체’, 인스턴스는 ‘관계’에 초점을 맞춘다.
* 객체를 ‘클래스의 인스턴스’라고도 부른다.
* 방금 인스턴스화하여 레퍼런스를 할당한’ 객체를 인스턴스라고 말하지만, 이는 원본(추상적인 개념)으로부터 생성되었다는 것에 의미를 부여하는 것일 뿐 엄격하게 객체와 인스턴스를 나누긴 어렵다.


코드로 이해하기

```
class Exm1 {
    let num1 = 1
    let num2 = 2
    var num3 = 4
    
}

let test1 = Exm1()
let test2 = Exm2()

*// 인스턴스를 객체에 담아서 사용*
*// 객체는 인스턴스의 그릇*

*// 두개의 인스턴스를 사용 아래에 선언한 것들은 다 새로운 거라 생각하면 쉬움*

Exm1().num1
Exm1().num2

*//하나의 인스턴스 사용 —> 그래서 인스턴스를 객채에 담아서 사용 (사용 용이)*

test1.num1
test1.num2

print(“test num3 = \(test1.num3), \(Exm1().num3)”) *//test num3 = 4,4*

test1.num3 = 7

print(“test num3 = \(test1.num3), \(Exm1().num3)”) *//test num3 = 7, 4*

Exm1().num3 = 10

print(“test num2 = \(test1.num2), \(Exm1().num2)”)

let test5 = Exm1()

print(“\(test5.num3)”) *//4*

test5.num3 = 21
print(“\(test5.num3), \(test1.num3)”) *// 21,7*
```



## [정리하기]

### 틀을 가져오는건 인스턴스, 계속 사용하고 싶어서 인스턴스를 담아두는건 객체 (재생산 같은 것 //그릇?)


***

# oop와 pop
