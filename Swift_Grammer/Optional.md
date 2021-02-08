# **optional**
nil을 사용할 수 있는 타입과 사용할 수 없는 타입을 구분하고, 사용할 수 있는 타입을 가리켜 옵셔널 타입이라고 부릅니다.



* nil이 아닌 경우
* nil인 경우

-> 당장에 오류가 발생하지 않더라도 잠재적으로 오류가 발생할 가능성이 있는 상황에 사용


옵셔널 래핑
옵셔널 언래핑

### (1) optional이 왜 필요할까?

nil의 가능성을 명시적으로 표현

- nil 가능성을 문서화 하지 않아도 코드만으로 충분히 표현 가능
  - 문자/ 주석 작성 시간을 절약

  <br>

- 전달 받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용
  - 효율적인 코딩
  - 예외 상황을 최소화하는 안전한 코딩

```
optional = enum + general



enum Optional<wrapped> : ExpressibleByNilLiteral {

case none - 옵셔널 값이 없다

case some ( wrapped) - 옵셔널 값이 있다

}



let Optionalvalue: optional<Int> = nil

let Oprionalvalue: Int? = nil
```

## **1.2 옵셔널 표시법**
---

### **(1) ? : 일반적인 옵셔널**

```
// 옵셔널

var optionalValue: Int? = 100

switch optionalValue {

case .none:
    print("This Optional variable is nill")
case .some:
    print("Value is \(value)")

}
// nil 할당 가능

optionalValue = nil

// 기존 변수처럼 사용 불가 - 옵셔널과 일반 값을 다른 타입이므로 연산 불가
optionalValue = optionalValue + 1
```

### **(2) ! : 암시적 추출 옵셔널**

```
// 암시적 추출 옵셔널 !

var optionalValue: Int! = 100

switch optionalValue {

case .none:
    print("This Optional variable is nill")
case .some(let value):
    print("Value is \(value)")

}

// 기존 변수 처럼 사용 가능
optionalValue = optionalValue + 1

// nil 할당 가능
optionalValue = nill

// 잘못된 접근으로 인한 런타임 오류
optionalValue = optionalValue + 1
```


## **1.3 옵셔널 추출 법**
---

### **?**
<타입>? 의 뜻은 해당 타입이 들어갈 수도 있고 nil이 들어가 있을 수도 있어 라는 뜻입니다.

```
 var someValue : Int? = 30

 var Value = someValue
 ```

위의 코드를 보면 Int?를 볼 수 있습니다. someValue 는 정수가 들어갈수도 nil이 들어갈 수도 있겠네요?

그럼 Value의 데이터 타입은 무엇일까요??

```
var someValue :Int? = 30

var Value : Int = someValue
```

위의 코드를 실행해보면 오류가 뜹니다. 그렇다면 Value의 데이터 타입은 Int? 이겠죠???



코드 하나를 더 보겠습니다.
```
// 옵셔널 타입은 다른 데이터 타입과 다르게 취급한다.

func printName(_ name: String) {
    print(name)
}

var myName: String? = nil

printName(myName)
// 전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생
```

위의 코드를 보면 String? 옵셔널 타입인 myName이 printName함수에 들어가지 못하는 것을 볼 수 있습니다.

이 코드의 뜻은 Optional과 Optional이 아닌 것들은 서로 다른 타입이라는 것 입니다.!


### **(1) ! : 강제 언래핑(Unwrapping)**

<br>

강제 언래핑(Unwrapping) 쉽게 말해서 변수 안에 값이 있든 말든 그냥 깨부시고 값을 가지고 오겠다는 것 입니다. <br>
깨부셨더니 운 좋게 값이 있을 수도 없을 수도 있겠죠..

그래서 ! 사용은 조심해야 합니다.

스위프트 언어 가이드를 보면 아래와 같이 말합니다.

```
"느낌표(!)를 사용하여 값이 존재하지 않는 옵셔널 값에 접근하려 시도하면
런타임 에러가 발생합니다.
느낌표를 사용하여 강제 언랩핑을 하기 전에는
항상 옵셔널 값이 nil이 아니라는 것을 확실히 해야 합니다."
```
즉, nil이 아니라는 것이 확실하지도 않은 상태에서 !를 남용하여 쓰게 되면 오류가 날 가능성이 높습니다.


```
// 강제 추출

func printName(_ name: String) {
    print(name)
}

var myName: String? = "yagom"

printName(myName!) //yagom

myName = nil

print(myName!)
// 강제 추출시 값이 없으므로 런타임 오류 발생

var yourName: String! = nil

printName(yourName)
//nil 값이 전달되기 때문에 런타임 오류 발생
```

### **(2) 옵셔널 바인딩 (Optional Binding)**


#### **if - let : 옵셔널 바인딩**

- 옵셔널의 값을 꺼내오는 방법 중 하나
- nil 체크 + 안전한 값 추출

```
// if - let

func printName(_ name: String) {
    print(name)
}

var myName: String! = nil

if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}

// name 상수는 if-let 구문 내에서만 사용가능합니다.
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
printName(name)


var myName: String? = "yagom"
var yourName: String? = nill

if let name = myName, let friend = yourName {
    print("\(nam) and \(friend)")
}
// yourName이 nil이기 때문에 실행되지 않습니다.

yourName = "haha"

if let name = myNae, let friend = yourName {
    print("\(name) and \(friend)")
}
//yagom and hana
```


#### **guard let**
특성상 함수(메서드)에서만 쓰이며, guard 구문의 조건을 만족하지 못하면
else문으로 빠져서 함수의 실행을 종료 시킬 때 사용함(return)


```
func test(_name: String?, _age: Int?) }
	guard let name = name, let age = age, age < 5 else {
    	return
    }
}
```


## **옵셔널 체이닝 (Optional Chaining)**
하위 property에 optional 값이 있는지 연속적으로 확인하면서, 중간에 하나라도 nil이 발견된다면 nil이 반환되는 형식

```
class Person {

    var residence: Residence?

}


class Residence {


    var numberOfRooms = 1

}



let sojin = Person()


if let roomCount = sojin.residence?.numberOfRooms { //옵셔널 체이닝


    print("sojin's residence has \(roomCount) room(s).")


} else {


   print("Unable to retrieve the number of rooms.")


}



결과 : Unable to retrieve the number of rooms.
```

위의 코드 중 옵셔널 체이닝을 사용한 부분을 보면 sojin의 residence가 nil이 아니라면, 다음으로 넘어가

residence의 numberOfRooms를 또 확인합니다. 여기서는 sojin의 residence가 nil이기 때문에 else문을 수행하게 된것 입니다.



**residence 뒤에 붙은 ? 표시를 사용한 이유는?<br>**
-> residence가 nil을 반환할 수도 있고 아닐 수도 있기 때문에
