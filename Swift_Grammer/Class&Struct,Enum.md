# Swift

* [class&struct/Enum]
   * [Class](#class)
   * [Struct](#struct)
   * [Enum](#enum)


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

