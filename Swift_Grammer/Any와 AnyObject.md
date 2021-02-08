# **1. Any**

---

<br>

- Swift의 **모든 타입**을 지칭하는 키워드

- 함수 타입을 포함하여 **모든 타입의 인스턴스**를 나타낼 수 있습니다.


즉 Any로 선언 되었다면 **종류에 상관없이 모든 타입의 객체를 저장, 입력, 반환** 할 수 있습니다.
(원시 자료형, 구조체, 열거형, 심지어는 함수까지 허용)


## **Any 타입의 단점**

<br>

* Any 타입은 **매우 극단적으로 추상화된 타입**
* Any 타입에 할당된 객체가 사용할 수 있는 **프로퍼티나 메소드가 아예 제공되지 않음**
* 정의 하면 모든 값을 제한 없이 할당 받을 수 있지만, **그 값을 이용하여서 할 수 있는 것은 거의 없음**

<br>

여기에 더하여 Any타입의 남용은 스위프트에서 사용되는 정적인 타입들을 모두 동적인 타입으로 바꾸어 버리는 결과를 가져옵니다.

Any타입은 실제로 값이 할당되는 시점에 타입이 정해지는데, 동적인 타입으로 바뀌어 버리면 코드를 작성하기에 편리하지만,실행해보기 전에는 값의 타입을 알기 어려우므로 컴파일러가 오류를 잡아내지 못합니다. <br>
--> 모든 오류가 런타입 오류로 발생 (전체적인 앱 개발의 생산성을 저하하는 결과를 낳게 되므로 사용에 주의)


```
// 변수에는 종류에 상관없이 모든 타입의 객체를 저장

var anyArr1 : [Any] = [1,2,"3","4"]
var anyArr2 : Array<Any> = [1,2,"3","4"]
var anyArr : [Any] = [1,"hi",true,1.0]


var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다."
someAny = 123.12


var vlaue: Any = "Sample String"
vlaue = 3
vlaue = false
vlaue = [1,3,4,7,9]
vlaue = {
    print("함수가 실행됩니다.")
}


func name(_ param: Any) {
    print("\(param)")
}

name(3) //Int
name(false) //Bool
name([1,3,4,7,9]) //Array
name {
    print(">>>>")
} // Function



var rows = [Any]()

rows.append(3)
rows.append(false)
rows.append([1,3,4,7,9])
rows.append {
    print(">>>>")
}
```

# **2. AnyObject**

---

- 클래스의 일종으로, 모든 종류의 클래스 타입을 저장할 수 있는 **범용 타입의 클래스 **

- 클래스 중에서 가장 추상화된 클래스이며, 상속 관계가 직접 성립하는 것은 아니지만 **가장 상위 클래스**

  (스위프트에서 사용되는 모든 클래스의 **아버지**라고 불릴 만한 클래스)

- 모든 클래스가 암시적으로 준수하는 **프로토콜**


```
// 선언된 변수나 상수에 할당 가능
var allCar: AnyObject = Car()
allCar = SUV()

// 모든 종류의 클래스 반환 가능
func move(_ param: AnyObject) -> AnyObject {
    return param
}

move(Car())
move(Vehicle())


// 모든 클래스 저장 가능
var list1 = [AnyObject]()
list1.append(Vehicle())
list1.append(Car())
list1.append(SUV())
```

따라서, AnyObject는 "어쨌거나 클래스이기만 하면 된다" 라는 의미로 해석될 수 있습니다.



### **주의할 점**
클래스일 때만 AnyObject 타입으로 정의 가능하므로 **구조체이거나 열거형은 허용하지 않습니다.**
