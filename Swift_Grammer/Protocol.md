
프로토콜은 오브젝티브-C에서도 쓰였던 개념으로, 클래스나 구조체가 어떤 기준을 만족하거나 또는 특수한 목적을 달성하기 위해 구현해야하는 메소드와 프로퍼티 목록입니다.

프로토콜의 대표적인 기능은 다음과 같습니다.


1. 구조체나 클래스를 구현하는 과정에서도 프로토콜을 사용하여 구현할 **메소드의 형식을 공통으로 정의**할 수 있다

2. 프로토콜을 구현한 객체의 메소드나 **속성을 은닉**하고 프로토콜에서 **선언된 명세의 내용만 제공**하는 기능


한마디로 **<span style="color:red">"특정 기능이나 속성에 대한 설계도"</span>** 라고 할 수 있습니다.


그럼 이제 프로토콜에 대해서 자세히 알아볼까요?

# **1. Protocol**

---

* 프로토콜을 특정 역할을 수행하기 위한 메서드, 프로퍼티, 이니셜 라이저 등의 <span style="color:red">요구 사항을 정의</span>

* 구조체, 클래스, 열거형은 프로토콜을 채택(Adopted)해서 <span style="color:red">프로토콜의 요구사항을 실제로 구현</span>

* 어떤 프로토콜의 요구사항을 모두 따르는 타입은 그 <span style="color:red">'프로토콜을 준수한다(Conform)'</span>고 표현

* 프로토콜의 요구사항을 충족시키려면 <span style="color:red">프로토콜이 제시하는 기능을 모두 구현</span>



추가적으로, 프로토콜은 구현해야할 요구사항을 지정하는 것 이외에도, 프로토콜을 확장하여 이러한 요구사항 중 일부를 구현하거나, conforming타입에서 활용할 수 있는 추가 기능을 구현할 수 있습니다.


**메소드, 프로퍼티등을 <span style="color:red">"정의"</span>만 하고, 이 프로토콜을 채택한 곳에서 <span style="color:red">"구현"</span>을 한다.**

### **(1) 프로토콜 정의 문법**

---

```
protocol 프로토콜 이름 {
    /* 정의부 */
}
```
아까 위에서 프로토콜은 정의만 하고, 채택한 곳에서 구현 한다고했죠???



**"프로토콜을 구현한다"**라는 말의 뜻은,

'프로토콜에 선언된 명세에 따라 실질적으로 프로퍼티에 **값을 할당하여 선언하거나 메소드의 내용**을 작성한다' 입니다.



**프로토콜을 구현할 수 있는 구현체들은 무엇이 있을까요?**



* 구조체(Structure)
* 클래스(Class)
* 열거형(Enumeration)
* 익스텐션(Extension)


그럼 이제 채택을 하기위한 형식을 볼까요?

```
Struct/Class/enum/extention 객체명: 구현할 프로토콜명 {

}
```

만약 슈퍼클래스(SomeSuperclass)가 있고, 서브클래스(SomeClass)에서 프로토콜을 채택 할 시에는 아래와 같은 형식을 사용합니다.

```
class SomeClass: SomeSuperclass, SomeProtocol{

    // class definition goes here

}
```


## **1.1 Protocol property**

---

* 프로토콜에 선언되는 프로퍼티에는 초기값을 할당 할 수 없음
* 연산 프로퍼티인지 저장 프로퍼티인지도 구분하지 않음
* 프로퍼티의 종류, 이름, 변수/상수, 타입, 읽기 전용/쓰기 전용인지에 대해서만 정의


실제로 프로퍼티를 선언한 예를 봅시다


```
protocol SomePropertyProtocol {
    var name: String { get set }
    var description: String { get }
}
```

인스턴스 프로퍼티 name 과 description 두 개를 SomePropertyProtocol 프로토콜에 선언하였습니다.
프로퍼티 명세에는 초기값을 할당하는 대신 각각 읽기(get)와 쓰기(set)에 대한 여부를 키워드로 표시한 것을 알 수 있습니다.



* name 프로퍼티 : 읽기와 쓰기 모두 가능
* description프로퍼티 : 읽기만 가능

--> 저장 프로퍼티로 사용하려면 get과 set 키워드를 모두 추가해야 합니다.



이제 정의를 했으니, 구현을 해볼까요???


```
struct RubyMember: SomePropertyProtocol {
    var name = "홍길동"
    var description: String {
        return "Name:\(self.name)"
    }
}
```

SomePropertyProtocol 프로토콜을 구현한 구조체입니다. <br>
구현할 대상 프로토콜을 선언하고, 그에 맞는 프로퍼티 명세를 내부에서 구현하고 있습니다.



get과 set으로 선언된 name는 저장 프로퍼티로 <br>
get만 선언된 description 프로퍼티는 연산 프로퍼티로 구현하고 있는 것을 볼 수 있습니다.



프로토콜에서 선언된 프로퍼티 중 일부를 누락하면 오류가 발생하지만 프로토콜과 상관 없이 필요한 프로퍼티를 구현체에 서 더 추가하는 것은 아무런 문제가 되지 않습니다.





## **1.2 Protocol Method**

---

```
protocol SomeMethodProtocol {
    func execute(cmd: String)
    func showPort(p: Int) -> String
}
```
프로토콜 SomeMethodProtocol은 두 개의 인스턴스 메소드를 포함하고 있습니다.



반드시 메소드에 매개변수를 정의해야하는 것은 아닙니다.메소드의 반환값 역시 선택사항으로,메소드의 성격에 맞게 생략하거나 작성해주면 됩니다.

<br><br>

**프로토콜의 메소드가 클래스의 메소드와 다른 점**

* 메소드의 선언 뒤에 중괄호 블록이 없습니다.

--> 프로토콜에 선언되는 메소드는 메소드 종류, 메소드 이름, 파라미터 타입, 파라미터 이름, 변환 타입까지 정의할 수 있지만 실행할 내용은 작성할 수 없습니다. 따라서 중괄호 붙이는 것이 허용되지 않습니다.

<br><br>

그럼 이제 앞에 정의한 SomeMethodProtocol 프로토콜을 구현해볼까요?

```
struct RubyService: SomeMethodProtocol {

    func execute(cmd: String) {

        if cmd == "start" {

            print("실행합니다.")

        }
    }

    func showPort(p: Int) -> String {

        return "Port : \(p)"

    }
}
```
코드를 보면 프로토콜에 정의된 두 개의 메소드를 형식에 맞게 구현하고 있습니다. <br>
RubyService 구조체를 보면 정의된 매개 변수명이 프로토콜에 선언된 매소드의 매개변수명과 동일한 것을 알 수 있습니다.


프로토콜에서 정의된 메소드는 **구현체에서도 매개 변수명까지 완전히 일치**해야합니다.<br>
아래는 외부 매개변수명이 포함된 프로토콜 메소드와 이를 구현한 예제 입니다.

```
protocol NewMethodProtocol {
    mutating func execute(cmd command: String, desc: String)
    func showPort(p: Int, memo desc: String) -> String
}

struct RubyNewService: NewMethodProtocol {
    func execute(cmd command: String, desc: String) {
        if command == "start" {
            print("\(desc)를 실행합니다.")
        }
    }

    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo: \(desc)"
    }
}
```

이렇게 내부 매개변수의 경우에는 프로토콜을 그래도 따르지 않고 필요한 대로 변형하여 사용하는 것이 가능합니다.<br>
단, 어떤 경우에도 프로토콜에 정의된 메소드명과 외부 파라미터명을 항상 그대로 따라야합니다.





## **1.3 프로토콜에서의 Mutating, static**

---

### **(1). Mutating** <br><br>
구조체 내의 메소드가 프로퍼티 값을 변경하는 경우 , 메소드 앞에 반드시 mutating 키워드를 붙여 이 메소드가 프로퍼티 값을 수정하는 메소드임을 표시하도록 강제하고 있습니다.

구조체나 열거형은 프로토콜의 메소드에 mutating 키워드가 추가되어 있지 않을 경우 프로퍼티의 값을 변경할 수 없기때문에, 프로토콜에 mutating 키워드가 함께 추가되어 있어야 합니다.

<br>

**일반적인 프로토콜에서 메소드 선언에 mutating 키워드가 붙지 않는 경우**

1. 구조체나 열거형 등 값 타입의 객체에서 내부 프로퍼티의 값을 변경하기를 원치 않을 때
2. 주로 클래스를 대상으로 간주하고 작성된 프로토콜일 때

<br>

```
protocol MService {
    mutating func execute(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyMService: MService {
    var paramCommand: String?

    mutating func execute(cmd: String) {
        self.paramCommand = cmd
        if cmd == "start" {
            print("실행합니다")
        }
    }

    func showPort(p: Int) -> String{
        return "Port: \(p), now command: \(self.paramCommand!)"
    }
}

// mutating 키워드 생략하는 경우

struct RubyMService2: MService {
    var paramCommand: String?

    func execute(cmd: String) {
        if cmd == "start" {
            print("실행합니다")
        }
    }

    func showPort(p: Int) -> String {
        return "Port: \(p), now command : \(self.paramCommand!)"
    }
}

// class일 경우

class RubyThread: MService {
    var paramCommand: String?

    func execute(cmd: String) {
        self.paramCommand = cmd

        if cmd == "start" {
             print("실행합니다")
        }
    }


    func showPort(p: Int) -> String {
        return "Port : \(p), now command: \(self.paramCommand!)"
    }
}
```



### **(2) static**
타입 메소드나 타입 프로퍼티를 프로토콜에 선언하기 위해 사용하는 키워드 입니다.

<br>

**Q. class도 있는데 굳이 static 키워드만 사용하는 이유는?**

A. class 키워드는 클래스에 국한되어있기때문입니다. 따라서 클래스에서 프로토콜을 구현할 때 필요에 따라 static 키워드 대신 class 키워드를 사용하는 것은 프로토콜 명세를 올바르게 구현하는 것으로 간주합니다.

<br>

```
protocol SomeTypeProperty {
    static var defaultValue: String { get set }
    static func getDefaultValue() -> String
}


struct TypeStruct: SomeTypeProperty {

    static var defaultValue = "default"

    static func getDefaultValue() -> String {

        return defaultValue

    }
}


class ValueObject: SomeTypeProperty {
    static var defaultValue = "default"
    class func getDefaultValue() -> String {
        return defaultValue
    }
}

```


## **1.4 프로토콜과 초기화 메소드**

---

* 실행 블록 작성 X
* 단순히 이름과 매개 변수명, 매개변수의 타입만 작성
* 내부 매개변수명을 따로 추가해도 되지만, 구현체에서 강제되는 요소는 아님
* 이름은 init 으로 통일

protocol SomeInitProtocol {
    init()
    init(cmd: String)
}


### **주의할 점**
<br>

1. 구현되는 초기화 메소드의 이름과 매개변수명은 프로토콜의 명세에 작성된 것과 완전히 일치해야 한다. (임의로 변경할 경우 프로토콜을 제대로 구현하지 않은 것으로 간주)
2. 프로토콜 명세에 선언된 초기화 메소드는 그것이 기본 제공되는 초기화 메소드일지라도 직접 구현해야 함
3. 클래스에서 초기화 메소드를 구현할 때는 required 키워드를 붙여야 함

<br>

```
protocol SomeInitProtocol {
    init()
    init(cmd: String)
}

struct SInt: SomeInitProtocol {
    var cmd: String

    init() {
        self.cmd = "start"
    }

    init(cmd: String) {
        self.cmd = cmd
    }
}

class CInit: SomeInitProtocol {
    var cmd: String

    required init() {
        self.cmd = "start"
    }

    required init(cmd: String) {
        self.cmd = cmd
    }
}
```
<br>


클래스는 상속과 프로토콜 구현이 동시에 가능한 객체인데 부모 클래스로부터 물려받은 초기화 구문과 프로토콜로부터 구현해야하는 초기화 메소드가 충돌하는 경우가 종종 생깁니다. 그렇기 때문에 아래 규칙에 따라 키워드를 붙여줘야 합니다.


* 부모 클래스를 상속 받지 않을 때 : **required** 키워드만 추가
* 부모 클래스를 상속 받을 때 : **ovrride, required** 키워드 모두 추가

<br>

```
protocol Init {
    init()
}

class Parent {
    init() {

    }
}

class child: Parent, Init {
    override required init() {

    }
}
```



## **1.5 메소드와 연산 프로퍼티**

<br>

메소드와 연산 프로퍼티에도 동일한 문제가 생길 수 있는데, 이때도 동일한 규칙이 적용됩니다.

<br>

* 클래스에서 구현과 동시에 override 키워드를 붙임
* requited 는 붙이지 않음 (초기화 메소드에서만 사용)

<br>

```
protocol Init {
    func getValue()
}

class Parent {
    func getValue() {

    }
}

class Child: Parent, Init {
    override func getValue() {

    }
}

```

다음 코드는 앞에 선언한 SomeInitProtocol과 SomeMethodProtocol 프로토콜 모두 구현하는 구조체 예시 입니다.

```
struct MultiImplement: NewMethodProtocol, SomeInitProtocol {
    var cmd: String

    init() {
        self.cmd = "default"
    }

    init(cmd: String) {
        self.cmd = cmd
    }

    mutating func execute(cmd command: String, desc: String) {
        self.cmd = cmd
        if cmd == "start" {
            print("시작합니다")
        }
    }

    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo : \(desc)"
    }

}

```
<br>

## **1.6 타입으로서 프로토콜**

---

* 상수나 변수, 그리고 프로퍼티의 타입으로 사용할 수 있음
* 함수, 메소드 또는 초기화 구문에서 매개변수 타입이나 반환 타입으로 프로토콜을 사용할 수 있음
* 배열이나 사전, 혹은 다른 컨테이너의 타입으로 사용할 수 있음

예시를 보면서 이해를 해봅시다.
```
class Bicycle: Wheel {
    var moveState = false

    func spin() {
        self.pedal()
    }

    func hold() {
        self.pullBreak()
    }

    func pedal() {
        self.moveState = true
    }

    func pullBreak() {
        self.moveState = false
    }
}

let trans = Bicycle()
trans.moveState //false
trans.pedal()
trans.pullBreak()
trans.spin()
trans.hold()

// 타입 어노테이션에 프로토콜타입을 사용하여 wheel 타입상수에 할당

let trans2: Wheel = Bicycle()

//클래스 본래의 타입인 Bicycle이 아니라 Wheel 타입의 상수에 할당된 trans가 사용할 수 있는 프로퍼티나 메소드
trans2.spin()
trans2.hold()
```

## **1.7 프로토콜의 활용**

---

### **(1). 확장 구문과 프로토콜**

<br>

익스텐션은 기존에 정의되었던 객체 자체를 확장하여 **새로운 기능을 추가하는 역할**이므로

익스텐션에서 프로토콜을 구현한다는 것은 일반적으로 구조체나 클래스, 열거형에서 프로토콜을 구현하는 것과 차이가 거의 없습니다.


```
extension <기존 객체> : <구현할 프로토콜1>,<구현할 프로토콜2>... {
      // 프로토콜의 요소에 대한 구현 내용
 }
```

예시 코드를 봅시다.

```
class Man {
    var name: String?

    init(name: String = "홍길동"){
        self.name = name
    }
}

protocol Job {
    func doWork()
}

extension Man:Job {
    func doWork() {
        print("\(self.name!)님이 일을 합니다.")
    }
}

let man = Man(name : "개발자")
man.doWork()

// 결과: 개발자님이 일을 합니다
```

위 예제는 클래스 Man과 프로토콜 Job을 정의하고 있습니다.<br>
Man은 Job 프로토콜을 구현하지 않기 때문에 doWork() 메소드 역시 사용할 수 없습니다.<br>
하지만 익스텐션을 사용하면 기존 클래스를 수정하지 않고도 Job 프로토콜을 수현할 수 있습니다.

<br><br>


#### **주의할 점**
<br>

익스텐션에서 **저장 프로퍼티를 정의할 수 없습니다.** <br>
만약 프로토콜에 정의된 프로퍼티를 익스텐션에서 구현해야 한다면, 이때는 연산 프로퍼티로 구현해 주어야합니다.

---

### **(2). 프로토콜의 상속**


프로토콜은 클래스처럼 상속을 통해 정의된 프로퍼티나 메소드, 그리고 초기화 블록의 선언을 다른 프로토콜에 물려줄 수 있습니다. <br>
또한 **다중 상속이 가능**하여 여러 개의 프로토콜을 하나의 프로토콜에 한꺼번에 상속하여 각 프로토콜들의 명세를 하나의 프로토콜에 담을 수 있습니다.



예시코드를 보면서 이해해볼까요?
```
protocol A {
    func doA()
}

protocol B {
    func doB()
}


protocol C: A, B {
    func doC()
}

class ABC: C {
    func doA() {

    }

    func doB() {

    }

    func doC(){

    }
}

```
프로토콜 A와 B 그 A와 B 프로토콜을 상속 받는 C가 있습니다.<br>
그럼 프로토콜 C의 실질적인 명세는 어떻게 될까요???

```
protocol C: A, B {
    func doA()
    func doB()
    func doC()
}
```
위의 코드와 같이 프로토콜 A,B의 명세들이 모두 추가된 상태 입니다.<br>
프로토콜 C의 구현부인 클래스 ABC가 A, B, C를 모두 구현한 것을 볼 수 있죠?ㅎㅎ

<br>

**어? 클래스처럼 상속받을 때 override 키워드가 붙어야 하는거 아닌가요?**

: 프로토콜은 상속할 때 프로토콜에서의 선언과 자식 프로토콜에서의 선언이 겹치더라도 override 키워드를 붙여야 하는 제약이 없습니다.

<br>


정의된 클래스 ABC는

* 타입의 **변수/상수**에 할당 될 수 있습니다.
* **함수나 메소드**의 인자 값으로 할당될 수 있습니다.


아래 예시를 참고해 주세요!
```
let abc: C = ABC()
// abc.doA(), abc.doB(), abc.doC()

let a: A = ABC()
// a.doA()

let ab: A & B = ABC()
// ab.doA() , ab.doB()

let abc2: A & B & C = ABC()
// abc2.doA(), abc2.doB(), abc2.doC()

func foo(abc: C) { }
foo(abc: ABC())

func boo(abc: A & B) { }
boo(abc: ABC())
```

상속 관계가 성립한 프로토콜은 **타입연산자**를 사용할 수 있어요!

타입 연산자가 무엇인지 모르시는 분들은 타입 캐스팅을 보고 오세요ㅎㅎ



#### - **is 연산자**

주어진 객체를 비교 대상 타입과 비교하여 그 결과를 반환합니다.<br>
이때, 선언된 변수나 상수의 타입이 아니라 할당된 실제 객체의 인스턴스를 기준으로 비교합니다.<br>
할당된 객체가 비교 대상 타입과 같거나 비교 대상 타입을 상속받았을 경우 모두 true를 반환하고, 이외에는 false를 반환합니다.

<br>

예시를 함께 볼까요?
```
abc is C //true
abc is A & B //true
abc is A // true
abc is B //true
a is C //true
a is B //true
ab is C //true
abc2 is A & B & C //true
```
<br>
위의 코드는 모두 true가 나옵니다. 비교 대상 조건을 모두 만족하기 때문입니다.

<br><br>

#### - **as 연산자**

as 연산자는 제한된 범위 내에서 타입을 캐스팅할 수 있도록해줍니다.<br>
제한된 범위란 아래와 같습니다,


1. 실제로 할당된 인스턴스 타입
2. 인스턴스가 구현한 프로토콜 타입
3. 클래스가 상속을 받을 경우 모든 상위 클래스
4. 프로토콜 타입이 상속을 받았을 경우 모든 상위 프로토콜


전에 타입 캐스팅 포스팅에서도 이야기 했던것과 동일하게 선언된 타입보다 하위 타입으로 캐스팅할 때는 주의해야합니다.<br>
할당된 인스턴스 객체에 따라서 캐스팅이 성공할 수도, 실패할 수도 있기 때문입니다! (nil이 반환될 수도 있음)



이해를 돕기 위해 예시를 볼까요?
```
protocol Machine {
    func join()
}

protocol Wheel: Machine {
    func lotate()

    init(name: String, currentSpeed: Double)
}

class Vehicle {
    var currentSpeed = 0.0
    var name = ""

    init(name: String, currentSpeed: Double) {
        self.name = name
        self.currentSpeed = currentSpeed
    }
}

class Car: Vehicle, Wheel {
    required override init(name: String, currentSpeed: Double = 0.0) {
        super.init(name: name, currentSpeed: currentSpeed)
    }

    func join() {

    }

    func lotate() {
        print("\(self.name)의 바퀴가 회전합니다.")
    }
}

class Carpet: Vehicle, Machine {
    func join() {

    }
}

var translist = [Vehicle]()
translist.append(Car(name: "자동차", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄자", currentSpeed: 15.0))

for trans in translist {
    if let obj = trans as? Wheel {
        obj.lotate()
    } else {
        print("\(trans.name)의 하위 타입 변환이 실패했습니다." )
    }
}
```

프로토콜 Machine과 Machine 프로토콜을 상속받는 Wheel, 탈 것에 대한 프로퍼티를 정의한 클래스 Vehicle이 선언되어있습니다.<br>
이 프로토콜들과 클래스를 상속받은 클래스 Car, Vehicle 과 Machine만 상속 받은 Carpet클래스가 있습니다.



그럼 이제 as 키워드를 이용한 타입 캐스팅을 해볼까요?<br>
먼저 translist 변수에 Vehicle 배열 인스터스를 생성한 후, as?를 이용해 하위 캐스팅을 해보겠습니다.<br>
배열을 for~in 구문에 넣고 순회하면서 각각의 아이템은 Wheel 프로토콜로 옵셔널 캐스팅합니다.



결과는 어떻게 될까요?
```
자동차의 바퀴가 회전합니다.

양탄자의 하위 타입 변환이 실패했습니다.
```
Car클래스는 타입캐스팅에 성공하였지만, Carpet은 실패하였습니다.

Carpet이 타입 캐스팅을 실패한 이유가 무엇일까요? Wheel 프로토콜을 구현하지 않았기 때문이겠죠!ㅎㅎ



위와 같이 프로토콜에서의 타입 캐스팅은 **공통 타입으로 선언된 객체의 인스턴스를 필요한 타입으로 적절히 변환하여 본래 인스턴스가 가지고 있던 고유한 기능들을 사용할 수 있도록** 해주는 것을 알 수 있습니다.


---

**(3). 클래스 전용 프로토콜**


```
protocol SomeClassOnlyProtocol: class {
	// 클래스에서 구현할 내용
}

```


만약 다른 프로토콜을 상속 받는다면 아래와 같이 class 선언 뒤에 나열하면 됩니다.
```
protocol SomeClassOnlyProtocol: class, Wheel, Machine {
	//클래스에서 구현할 내용 작성
}

```

### **(4). optional**
구현하는 객체에 따라 특별히 필요하지 않은 프로퍼티나 메소드, 초기화 구문이 있을 수 있습니다.

그때 사용하는것이 선택적 요청 문법입니다.



**선택적 요청(Optional Requirement) 문법이란?**

: 프로토콜에서 선언된 프로퍼티나 메소드, 초기화 구문 등 프로토콜을 구현할 때 작성해야 하는 요소들을 optional 키워드를 사용하여 필수 사항에서 선택 사항으로 바꾸어줍니다.



**optional 키워드를 사용할 때 제약 사항**

: 프로토콜 앞에 @objc을 표시해야 하며, 클래스에서만 사용 가능합니다. (optional 키워드는 클래스 전용 프로토콜임)



**@objc가 뭐에요?**

: 파운데이션 프레임워크에 정의된 어노테이션 일종으로서 이 어노테이션이 붙은 코드나 객체를 오브젝티브-C 코드에서도 참조할 수 있도록 노출됨을 의미합니다. (실제로 정의한 프로토콜이 오브젝티브 - C코드와 상호 동작하는 일이 없더라도 노출됨)




```
import Foundation

@objc
protocol MsDelegate {
    @objc optional func onReceive(new:Int)
}


class MsgCenter {
    var delegate: MsDelegate?
    var newMsg: Int = 0

    func msgCheck() {
        if newMsg > 0 {
            self.delegate?.onReceive?(new: self.newMsg)
            self.newMsg = 0
        }
    }
}

class Watch: MsDelegate {
    var msgCenter: MsgCenter?

    init(msgCenter: MsgCenter) {
        self.msgCenter = msgCenter
    }

    func onReceive(new: Int) {
        print("\(new) 건의 메시지가 도착했습니다.")
    }
}
```

---


아래는 야곰 강의에서 사용했던 예제 코드 들입니다.

함께보면 이해가 될 것 같아 추가하였습니다.


```
/* 프로토콜 */

import Swift

// MARK: - 정의 문법

protocol Talkable {

    // 프로퍼티 요구
    // 프로퍼티 요구는 항상 var 키워드를 사용합니다
    // get은 읽기만 가능해도 상관 없다는 뜻이며 get과 set을 모두 명시하면 읽기 쓰기 모두 가능한 프로퍼티여야 합니다.
    var topic: String { get set } //읽기쓰기
    var language: String { get } //읽기

    // 메서드 요구
    func talk()

    // 이니셜라이저 요구
    init(topic: String, language: String)
}

//MARK: - 프로토콜 채택 및 준수

//Person 구조체는 Talkable 프로토콜을 채택했습니다.

struct Person: Talkable {
    var topic: String //var은 읽기 쓰기
    let language: String //let 읽기

    // 읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능합니다.
    // var language: String { return "한국어" }

    // 물론 읽기, 쓰기 프로퍼티도 연상 프로퍼티로 대체할 수 있습니다.
    // var subject: String = ""
    // var topic: String {
    //      set {
    //          self.subject = newValue
    //      get {
    //          return self.subject
    //       }
    //}

    func talk() {
        print(" \(topic)에 대해 \(language)로 말합니다.")
    }

    init(topic: String, language: String ){
        self.topic = topic
        self.language = language
    }
}

//MARK: - 프로토콜 상속

// 프로토콜은 클래스와 다르게 다중상속이 가능합니다.

//protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
//    /*정의부*/
//}

protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func read() {
        print("Read")
    }

    func write() {
        print("Write")
    }

    func speak() {
        print("Speak")
    }
}

//MARK: 클래스 상속과 프로토콜

// 클래스에서 상속과 프로토콜 채택을 동시에 하려면
//상속받으려는 클래스를 먼저 명시하고 그 뒤에 채택할 프로토콜 목록을 작성합니다.

class SuperClass: Readable {
    func read() {
        print("read")
    }
}

class SubClass: SuperClass, Writeable, ReadWriteSpeakable {
    func write() {
        print("write")
    }

    func speak() {
        print("speak")
    }
}

//MARK: - 프로토콜 준수 확인
// 인스턴스가 특정 프로토콜을 준수하는지 확인할 수 있습니다.
// is, as 연산자 사용

let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable // true
someAny is ReadSpeakable //false

someAny = sub
someAny is Readable //true
someAny is ReadSpeakable //true

someAny = sup

if let someReadable: Readable = someAny as? ReadSpeakable {
    someReadable.read()
} //read

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()
} //동작하지 않음

someAny = sub

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
} //read
```
