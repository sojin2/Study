# Swift

* [집단 자료형](#집단자료형)
   * [Array](#배열)
   * [Set](#집합)
   * [Tupel](#튜플)
   * [Dictionary](#딕셔너리)
   
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

