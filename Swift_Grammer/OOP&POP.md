# **객체 지향 프로그래밍 (OOP - Object Oriented Programming)**

* 객체의 관점에서 프로그래밍 하는 것
* 객체들이 서로 유기적으로 동작하는 프로그래밍 이론
* 코드의 재사용성과 중복제거가 가장 큰 목적


즉, 어플리케이션을 구성하는 요소들을 객체로 바라보고, 객체들을 유기적으로 연결하여 프로그래밍 하는 것을 말합니다.



## **OOP 특징**

### **1. 추상화(Abstraction)**

: 추상화란 객체의 데이터 형을 정의(강제)하는 것을 말합니다. 다른 언어들은 추상 클래스가 존재하지만 스위프트는 없습니다.

그럼 스위프트는 무엇으로 추상화를 할까요?

바로 protocol 입니다. 전에 Protocol에서 protocol에서는 정의한 후, 채택한 곳에서 구현한다고 공부했었죠?



이해가 어렵다면, 아래 예시를 함께 볼까요?

```
protocol Human {
    var name: String {get set}
    var age: Int {get set}
    var gender: String {get set}
}

protocol Physical {
    var height: Double {get set}
    var weight: Double {get set}
}

class Student: Human {
    var name: String = ""

    var age: Int = 0

    var gender: String = ""


}

extension Student: Physical {
    var height: Double {
        get {
            // code
        }
        set {
            // code
        }
    }

    var weight: Double {
        get {
            // code
        }
        set {
            // code
        }
    }

}
```
Human과 Physical 에서 데이터 형을 지정해주고 Student 클래스에서 상속 및 확장을 하며 구현하고 있습니다.

간단하게 설명하기 위해 안에 코드는 넣지 않았습니다. 여기서 추상화는 Human Physical 프로토콜이겠죠?





### **2. 캡슐화(Encapsulation)**
: 객체 상태를 나타내는 속성 정보를 private하게 관리 하는 것을 말 합니다.



private 하게..? 말 그대로 비밀스럽게 속성정보를 관리하는 것 같죠?

원활한 이해를 위해 아래 예시와 함께 살펴보겠습니다!

```
class Human {
  private var location = "수원"

  private func action1() {
    print("공항 가기")
  }
  private func action2() {
    print("조금 자기")
  }

  func currentLocation() {
    print("-------------------------------")
    print("현재 위치 :", location)
    print("-------------------------------")
  }

  func goToJeju() {
    print("수원을 출발합니다.")
    action1()
    action2()
    print("제주도에 도착했습니다.")
    location = "제주도"
  }
}

let A = Human()
A.currentLocation()
A.goToJeju()
A.currentLocation()



출력 결과

-------------------------------
현재 위치 : 수원
-------------------------------
수원을 출발합니다.
공항 가기
조금 자기
제주도에 도착했습니다.
-------------------------------
현재 위치 : 제주도
-------------------------------

```
위 코드를 보면 currentLocation과 goToJeju 함수 빼고는 외부로 노출되면 안되는 함수인 것 같죠?

요청자는 action이 무슨 일을 하는지 모르게 private하게 관리하는겁니다.

### **3. 상속성 (EInheritance)**
: 하나의 클래스의 특징(부모 클래스)을 다른 클래스가 물려받아 그 속성과 기능을 동일하게 사용하는 것을 말합니다.
재사용과 확장에 의미가 있습니다. (상속은 수직확장, Extension은 수평 확장)



예시를 함께 살펴볼까요?
```
class Greeting {
    var name:String = "Sojin";

    func say(){
        print("Hello, " + name + "!");
    }
}

class Hello:Greeting {
    var name2:String = "Minsu";

    func say2(){
        print("반가워 " + name + "," + name2 + " ^-^");
    }
}

var obj:Hello = Hello();
obj.say();
obj.say2();

obj.name = " Suyeon";
obj.name2 = "yejin";
obj.say2();


결과 화면

Hello, Sojin!
반가워 Sojin,Minsu ^-^

Hello,  Suyeon!
반가워  Suyeon,yejin ^-^

```
Hello 클래스는 Greeting 클래스를 상속하고 있습니다.

그래서 Hello 인스턴스를 생성한 후, Greeting에 있는 함수 say를 불러오는 것을 볼 수 있죠?

### **4. 다형성(Polymorphism)**
: 동일한 요청에 대해 각각 다른 방식으로 응답할 수 있도록 만드는 것을 말 합니다.
다형성의 방식으로 오버라이딩(Overriding), 오버로딩(Overloading)이 있습니다.



**(1). 오버라이딩(Overriding)**


자식 클래스에서 재정의 된 메소드나 프로퍼티는 부모 클래스로부터 물려받은 내용을 덮어쓰게되는 과정(재정의)
오버라이딩한 내용은 자기 자신 또는 자신을 서브클래싱한 하위 클래스에만 적용 (자식 클래스에서 프로퍼티나 메소드의 내용을 변경한다고 해서 변경된 내용이 부모 클래스에까지 적용되지 않음)


스위프트에서는 오버라이딩하려는 메소드나 프로퍼티의 선언 앞에 override 키워드를 붙여야 합니다.

(개발자가 기존에 존재하는 메소드나 프로퍼티를 의도치 않게 덮어쓰는 실수를 방지하기 위한 수단)



* **(1.1) override 키워드가 붙으면**

1. 컴파일러는 이 프로퍼티 또는 메소드가 상위 클래스에서 정의된 것인지를 검사(맨 위 클래스 까지 계층을 따라 계속해서 탐색함)
2. 탐색을 거듭하는 도중에 상위 클래스에서 정의된 내역이 확인되면 정상적으로 오버라이딩 절차를 진행
3. 프로퍼티와 메소드 전체를 상속한 후 오버라이딩된 메소드나 프로퍼티를 덮어씀


override 키워드는 부모 클래스나 그 이상의 상위 클래스에서 반드시 선언되어 있고, 이를 재정의할 때만 붙일 수 있는 키워드


* **(1.2) 프로퍼티 오버라이딩 시 허용되는 것**

  * 저장 프로퍼티를 get,set 모두 있는 연산 프로퍼티로 오버라이딩하는 것
  * get,set 구문이 모두 제공되는 연산 프로퍼티를 get, set 구문이 모두 제공되는 연산 프로퍼티로 오버라이딩하는 것
  * get 구문만 제공되는 연산 프로퍼티를 get, set 구문이 모두 제공되는 연산 프로퍼티로 오버라이딩하는 것
  * get 구문만 제공되는 연산 프로퍼티를 get 구문만 제공되는 연산 프로퍼티로 오버라이딩하는 것


* **(1.3) 프로퍼티 오버라이딩 시 허용되지 않는 것**

  * 저장 프로퍼티를 저장 프로퍼티로 오버라이딩하는 것
  * get, set 구문과 관계없이 연산 프로퍼티를 저장 프로퍼티로 오버라이딩하는 것
  * 저장 프로퍼티를 get 구문만 제공되는 연산 프로퍼티(=읽기 전용)로 오버라이딩하는 것
  * get, set 구문을 모두 제공하는 연산 프로퍼티를 get 구문만 제공되는 연상 프로퍼티로 오버라이딩하는것



쉽게 말해, 프로퍼티 오버라이딩은 상위 클래스의 기능을 하위 클래스가 확장 또는 변경하는 방식으로 진행되어야지, 제한하는 방식으로 진행되어서는 안된다는 것입니다.


```
class Vehicle {
    var currentSpeed = 0.0

    var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다."
    }

    func makeNoise() {
        // 임의의 교통수단 자체는 경적을 울리는 기능이 필요 없습니디.
    }
}

class Car: Vehicle {
    var gear = 0
    var engineLevel = 0

    override var currentSpeed: Double { //저장->연산
        get {
            return Double(self.engineLevel * 50)
        }

        set {
            print("New Value is \(newValue)")
        }
    }

    override var description: String { //읽기,쓰기 연산 모두 가능

        get {
            return "Car: engineLevel=\(self.engineLevel), so currentSpeed=\(self.currentSpeed)"
        }
        set {
            print("New Value is \(newValue)")
        }
    }
}

let c = Car()
c.engineLevel = 5
c.currentSpeed //250
c.description = "New Class Car"

print(c.description)




출력 결과

New Value is New Class Car
Car: engineLevel=5, so currentSpeed=250.0

```
상속받은 프로퍼티를 오버라이딩하는 과정에서  프로퍼티 옵저버도 붙일 수 있습니다.

단, 아래와 같은 선언이 없다면 오버라이딩할 때 프로퍼티 옵저버 구문을 추가하면 됩니다.



부모 클래스에서 프로퍼티가 상수로 선언
읽기 전용 프로퍼티로 선언
 이때, 오버라이드되는 프로퍼티도 역시 읽기/쓰기용으로 선언되어야 합니다.

**메소드 오버라이딩**
* 오버라이딩 대상이 되는 메소드의 매개변수 개수나 타입, 그리고 반환 타입은 변경할 수 없습니다.
* 상위 클래스에서 정의된 메소드의 반환 타입과 오버라이딩된 메소드 반환 타입이 같아야 합니다.

```
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

class Bike: Vehicle {
    override func makeNoise() {
        print("빵빵")
    }
}

let bk = Bike()
bk.makeNoise()


출력 결과

빵빵
```

**(2). 오버로딩(Overloading)**


* 같은 메소드 이름이지만 매개 변수의 변화만으로 새로운 메소드를 만들어 적재할 수 있도록 지원하는 문법
오버라이딩된 메소드나 프로퍼티는 해당 클래스를 상속받는 모든 자식 클래스에 적용됩니다. (적용된 자식 클래스를 다시 서브클래싱했을 때도 마찬가지)
* 부모클래스는 오버라이딩 영향을 받지 않습니다.(부모 클래스를 상속받은 다른 형제뻘 클래스들에게도 역시 오버라이딩 된 메소드나 프로퍼티는 적용되지 않음)

```
class HybridCar: Car {

}

class KickBoard: Vehicle {
    // 아무것도 추가로 선언하지 않음
}

let h = HybridCar()
h.description //"Car: engineLevel=0, so currentSpeed=0.0"

let k = KickBoard()
k.description //"시간당 0.0의 속도로 이동하고 있습니다."
```

**오버라이딩을 막는 방법**



상위 클래스에서 정의한 메소드나 프로퍼티가 하위 클래스에서 오버라이딩되는 것을 차단할 수 있도록 final 키워드를 제공합니다.



**final 키워드 프로퍼티나 메소드, 클래스에 붙일 수 있습니다.**



* 프로퍼티나 메소드는 상수적인 성격이 되어 하위 클래스에서 오버라이드 할 수 없게되고,
* 클래스는 상속 자체가 차단되어 어떤 클래스도 이 클래스를 서브 클래싱할 수 없게 됩니다. (인스턴스로만 사용)


아래 예시를 봅시다!


```
class Vehicle {
    final var currentSpeed = 0.0

    final var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다."
    }

    final func makeNoise() {
        // 임의의 교통수단 자체는 경적을 울리는 기능이 필요 없습니디.
    }
}

```
위 코드 처럼 실행하게 되면 전에 실행했던 코드들이 오버라이딩이 불가능 하다고 오류가 발생합니다.

클래스도 동일 합니다.


---

## 장점
* 강한 응집력과 약한 커플링
* 프로그램을 유연하고 변경이 용이하게 만든다.
* 프로그램의 개발 보수를 간편하게 만든다.
* 직관적인 코드 분석을 가능하게 한다.


## 단점
* 암시적 공유 : 의도하지 않았는데, 상속했다는 이유로 모든 속성과 행위를 공유한다.
* 단일체 : 단 하나의 부모만 존재한다. 추가적인 기능 구현으로 클래스의 덩치가 무한대로 커질 수 있다.
* 클래스 타입 관계 문제 : 복잡한 상속 구조를 지닌 클래스 참조 또는 연산을 수행할 때 임의 클래스의 올바른 타입을 얻기 위해 down-cast 해야 한다.



# **프로토콜 지향 프로그래밍 (POP - Protovol Oriented Programming)**

객체지향 프로그래밍 패러다임의 언어들은 대부분 클래스를 상속을 사용해 타입에 공통된 기능을 구현합니다.

그런데 Swift는 class 뿐만 아니라 struct, enum과 같은 값타입도 class 만큼 자주 사용합니다(권장하고 있죠.) 이러한 값타입은 상속을 받을 수 없죠.

그렇기 때문에, struct, enum과 같은 값타입에 프로토콜을 사용하면 상속을 사용하는 것과 같은 효과를 누릴 수 있습니다.


## **프로토콜 초기 구현**


만약 특정 프로토콜을 정의하고 여러 타입에서 이 프로토콜을 준수하게 만들어 타입마다 똑같은 메서드, 똑같은 프로퍼티, 똑같은 서브스크립트 등을 구현해야 한다면,  많은 코드를 중복 사용해야 하며 또 유지보수는 얼마나 힘들어질지 생각만 해도 머리가 아플 겁니다.



이때 필요한 게 바로 익스텐션과 프로토콜의 결합입니다.
프로토콜을 채택한 타입의 정의부에 프로토콜의 요구사항을 구현하지 않더라도 프로토콜의 익스텐션에 미리 프로토콜의 요구사항을 구현해 둘 수 있습니다. 이를 프로토콜 초기구현이라고 합니다.

```
protocol Flyable { func fly() }

extension Flyable {
    func fly() {
        print("푸드득 푸드득")
    }
}

protocol Runable { func run() }

extension Runable {
    func run() {
        print("후다닥 후다닥")
    }
}

protocol Swimable { func swim() }
extension Swimable {
    func swim() {
        print("어푸 어푸")
    }
}

protocol Talkable { func talk() }
extension Talkable {
    func talk() {
        print("재잘재잘 쪼잘쪼잘")
    }
}

struct Bird: Flyable, Talkable { }

let bird = Bird()
bird.fly()
bird.talk()

struct Person: Runable, Swimable, Talkable { }

let person = Person()
person.run()
person.talk()
person.swim()

```

아래 코드처럼 프로토콜 초기 구현을 잘 해두면 이렇게 프로토콜 채택만으로도 그 기능을 사용할 수 있게 됩니다.
프로토콜 초기 구현이 프로토콜 지향 프로그래밍의 핵심이라고 볼 수 있습니다.

## **프로토콜 지향 프로그래밍을 사용하는 이유**


* 구조체, 클래스, 열거형 등 구조화된 타입 중에 상속은 클래스 타입에서만 가능합니다.
* 클래스는 참조 타입이므로 참조 추적에 비용이 많이 발생합니다.
* 비교적 비용이 적은 값 타입을 활용하고 싶어도, 상속을 할 수 없으므로 때마다 기능을 다시 구현해 주어야 했지만, 프로토콜 지향 프로그래밍은 그 한계를 없앴습니다.
* 기능의 모듈화가 더욱 명확해 집니다.
* 클래스가 상속을 할 수 있도록 설계되어 있다고 하더라도 다중상속을 지원하는 언어는 많지 않습니다. 다중상속을 지원하지 않는다는 뜻은 하나의 상속체계에서 다른 상속체계에 속해있는 기능을 끌어다 쓸 수 없다는 뜻입니다.
*  프로토콜 지향 프로그래밍은 기능을 프로토콜이라는 단위로 묶어 표현하고 초기 구현을 해 둘 수 있으니 상속이라는 한계점을 탈피할 수 있습니다.
