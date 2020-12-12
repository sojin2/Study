# Swift


* [집단 자료형](#집단자료형)
   * [Array](#배열)
   * [Dictionary](#딕셔너리)
   * [Set](#함수)
   * [Tupel](#튜플)
      
* 조건문 
   * [Switch case](#switch-case)
      
* 반복문
   * [For문](#for문)
   * [while, repeat~while 문](#while,repeat~while-문)
      
* [class&struct/Enum](#class&struct/Enum)
   
* [객체와 인스턴스](#객체와-인스턴스)


# 집단 자료형
스위프트는 서로 관련 있는 데이터끼리 모아서 관리할 수 있도록 집단 자료형 (Collective Types)을 제공합니다.

집단 자료형을 사용하면 데이터를 손쉽게 그룹 단위로 묶을 수 있으므로 다량의 데이터를 다룰 때 무척 편리합니다.


종류

*배열 (Array) : 일련 번호로 구분되는 순서에 따라 데이터가 정렬된 목록 형태의 자료형 
*집합 (Set) : 중복되지 않은 유일 데이터들이 모인 집합 형태의 자료형
*튜플 (Tuple) : 종류에 상관 없이 데이터들을 모은 자료형, 수정 및 삭제를 할 수 없음
*딕셔너리(Dictionary) : 배열과 유사하나 일련 번호 대신 키(Key)를 사용하여 키-값으로 연관된 데이터들이 순서 없이 모인 자료형
   
배열과 집합, 튜플, 딕셔너리는 어떤 타입의 데이터라도 모두 저장할 수 있지만 튜플을 제외한 나머지는 저장되는 모든 데이터의 타입이 동일해야합니다.

***

## 배열
   #  배열 (Array)
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



### 1.3. 배열을 정의하는 방법
    
**정적 선언 & 형식 선언**
   
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

**동적 선언** 
   
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


   
### **1.3. 응용하기**
   
**배열에 값을 넣기**

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


**크기가 정해진 배열**
   
```
// (repeating: 배열의 타입과 일치하는 값(1개), count: 값을 반복할 횟수)
 
let numArray1 = [Int](repeating: 0, count: 10) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
 
let numArray2 = Array(repeating: 0, count: 10) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
범위 연산자와의 차이점이라고 하면 범위 연산자는 특정 범위 내에서 1씩 증가한 값이 배열에 넣어지지만,

Array(repeating:count:) 메서드는 반복할 값 1개(repeating)가 지정된 횟수(count) 만큼 배열에 넣어집니다.
```

범위 연산자와의 차이점이라고 하면 범위 연산자는 특정 범위 내에서 1씩 증가한 값이 배열에 넣어지지만,   Array(repeating:count:) 메서드는 반복할 값 1개(repeating)가 지정된 횟수(count) 만큼 배열에 넣어집니다.


**범위 연산자를 이용한 값 참조**
   
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



**동적 할당**
   
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


**순회 탐색**

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


## 딕셔너리

사전에서 고유 단어와 그 의미가 연결되어 있는 것처럼, 고유 키(Key)와 그에 대응하는 값(Value)을 연결하여 데이터를 저장하는자료형 입니다.

**딕셔너리를 사용할 때 주의할 점**

* 하나의 키는 하나의 데이터에만 연결되어야 함
* 하나의 딕셔너리에서 키는 중복될 수 없습니다. 중복해서 선언하면 아이템 추가가 아니라 수정이 이루어져 기존 키에 연결된 데이터가 제거 됨
* 저장할 수 있는 데이터 타입에는 제한이 없지만, 하나의 딕셔너리에 저장하는 데이터 타입은 모두 일치해야 함
* 딕셔너리의 아이템은 순서가 없지만, 내부적으로 순서가 있으므로 for~in을 통한 순환 탐색 가능
* 키는 hash 연산이 가능한 타입이어야 함.


**### 4.1. 딕셔너리 정의 방법**

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





### 4.2. 응용하기
   
**딕셔너리에 저장된 아이템을 제거하는 방법**

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


**옵셔널(Optional)**

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

**순회 탐색**

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

#집단자료형#
   
## 함수
   
## 튜플
***
# 조건문
   
## switch case
***
# 반복문
   
## for문
   
## while,repeat~while
***
# class&struct/Enum
***
# 객체와 인스턴스
***
