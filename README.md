## 🔢 iOS Calculator App

#### 🗓️ 프로젝트 기간: 2021.11.08 - 2021.11.19


#### Reviewer
🍏 [GREEN](https://github.com/GREENOVER)

##  목차
 * [학습 키워드](#학습-키워드)
 * [Step 1](#Step-1.-Queue-타입-구현)
    * [구현 내용](#1-1.-구현-내용)
    * [고민했던 점](#1-2.-고민했던-점)
    * [Trouble Shooting](#1-3.-Trouble-Shooting)
    * [UML class diagram](#1-4.-UML-class-diagram)
 * [Step 2](#Step-2.-계산-타입-및-주변-타입-구현)
    * [구현 내용](#2-1.-구현-내용)
    * [고민했던 점](#2-2.-고민했던-점)
    * [Trouble Shooting](#2-3.-Trouble-Shooting)
    * [UML class diagram](#2-4.-UML-class-diagram)


## ✏️ 학습-키워드
- Queue
- DoubleStack
- map, compactMap


<br>

## Step 1. Queue 타입 구현

### 1-1. 구현 내용
- 사칙연산 계산을 위한 Queue 타입`CalculatorItemQueue`
- `CalculatorItemQueue`의 메서드를 테스트 하기위한 **Unit Test Target** 추가

### 1-2. 고민했던 점
- `CalculatorItemQueue`를 구조체로 만들어준 이유!
    :  참조 타입인 class로 만들어준다면 여러 인스턴스가 있을 때, 원본의 값이 변경될 수 있기 때문에 값 타입인 구조체로 만들어줘야한다고 생각했습니다. 구조체로 만들어주면 각 인스턴스는 복사본을 갖고있게되어 원본에 영향을 주지 않기 때문입니다.
- ✔️ `CalculatorItemQueue`의 메서드에 대한 test case를 작성하면서, 접근제어를 설정해주어야하는지에 대해 고민이 되었습니다. 
    아래와 같이, 접근제어를 해주면 테스트를 진행할 때, `enQueueArray`에 접근할 수 없어서 count 메서드를 만들어서 이용하는 방법으로 고민을 해보았습니다. 
    그런데 제가 테스트해보고 싶은 건 array의 요소들이 잘 들어가 있는지였는데, count는 array의 요소의 개수만 알려주기때문에 제가 의도한 건 아니라고 생각했습니다. :cry: 
    테스트를 위한 메서드를 만들어주는 방법도 있을 것 같습니다.
    ```swift
    private var enQueueArray: [T] = []
    private var deQueueArray: [T] = []

    var count: Int {
        return enQueueArray.count
    }
    var deQueueCount: Int {
        return deQueueArray.count
    }
    ```

    -> `private(set)`으로 접근제어를 붙여주었습니다.
    
- **Unit test**를 처음으로 작성해보았어요!
    `enQueue()` 메서드는 append를 하는 기능만 가지고 있는데, 이 메서드에 대해서 테스트를 할 필요가 있을지에 대한 고민을 했습니다. 
    append는 swift 기본 라이브러리에 구현되어있는 함수인데 그 기능에 대해서 테스트를 해야하나,,라는 고민이 있었지만 일단은 진행해보았습니다! 
    단위테스트를 처음 해보니까, test case 자체를 만드는데도 어려움이 있었고, 어떤 것을 더 검증해야하는지에 대해 생각하게 되었습니다.
    > **from Reviewer** 현재 앨리도 많은 테스트 코드를 정의해주셨지만 Int, Double, Char등 타입에 따라서 모든 경우에 대해 더 추가할 수도 있다고 보입니다. 정말 생각하면 무궁무진한것이 테스트 코드라 어느정도로 짜야할지에 대해서는 정답은 없습니다. 다만 앨리가 **앞으로 스텝을 진행하면서 문제가 될것 같거나 예측되는 모든 값들에 대해서는 테스트 코드를 추가하는게 맞다고 생각합니다!** 
    > append는 말씀하신대로 기본 스위프트에서 지원하는 라이브러리지만 사실 그걸 받아서 구현하는 enQueue나 deQueue 같은 경우는 표면상 append만 해주기에 문제가 없을것이다 생각하지만 **결국 프로그래머가 짠 로직이자 코드이기에 문제가 없을거라고 단정짓는건 위험합니다**😅

- Queue 타입을 구현할때, 처음에 아래와 같이 작성을 했었습니다.
    ```Swift
    struct CalculatorItemQueue<T>: CalculateItem {
        var queue: [T] = []

        mutating func enQueue(_ element: T) {
            queue.append(element)
        }

        mutating func deQueue() -> T? {
            if queue.isEmpty {
                return nil
            }
            return queue.removeFirst()
        }
    }

    ```
    기존 방식은 시간복잡도가 O(n)이라 `Double Stack`을 이용해서 현재 방식으로 바꿔주었습니다. `reversed()`와 `removeLast()` 메서드를 사용하여 시간복잡도를 O(1)로 개선해보았습니다.

### 1-3. Trouble Shooting
- 프로퍼티와 메서드의 네이밍 관련
    > **from Reviewer** Array라는 네이밍보다 items이나 elements와 같이 요소를 담고 있는걸 표현해줘서 좀 더 명확히 표현하는것이 어떨까 의견을 드려봅니다. 많은 라이브러리들을 보면서 주로 어떤 네이밍을 대중적으로 사용하는지 보면 많은 도움이 될거에요!

- `deQueueFirstElement()`메서드의 if문 내부에서 nil을 반환하는 것을 추후 스텝을 감안해서 간단한 오류처리를 하도록 수정해주었습니다. 
    ```swift
    mutating func deQueueFirstElement() throws -> Element {
            if enQueueElements.isEmpty && deQueueElements.isEmpty {
                throw CalculatorError.emptyQueue
            }
    ```


### 1-4. UML class diagram
![](https://i.imgur.com/FMIrUpQ.png)

<br>

## Step 2. 계산 타입 및 주변 타입 구현

### 2-1. 구현 내용
- ExpressionParser
    - `parse()` 문자열을 연산자와 피연산자로 분리하여 Formula를 반환하는 메서드
    - `componentsByOperators()` 문자열을 연산자를 기준으로 분리하여 피연산자 배열로 반환하는 메서드
- String Extension
    - `slpit()` 문자열을 연산자를 기준으로 나누고 각 문자를 String타입으로 형변환하여 [String]으로 반환하는 메서드
- Operator
    - 연산자를 정의한 열거형
    - `calculate()` 연산을 실행하는 메서드
- Formula
    - 연산자는 `CalculatorItemQueue<Operator>`의 `enQueueElements`에, 피연산자는 `CalculatorItemQueue<Double>`의 `enQueueElements`에 저장
    - `result()` 사칙연산 결과를 반환하는 메서드


### 2-2. 고민했던 점
- `Operator` 열거형 내에서 마이너스 연산자를 `-`로 지정해주었는데요, 다른 캠퍼들과 이야기를 나누는 중에 음수가 들어왔을때와 구분을 지어주는게 좋을 것 같다는 의견이 있었습니다. 음수가 들어오는 경우는 생각을 못했었는데, 해당 의견 반영하여 마이너스 연산자를 `_`로 변경해주었습니다!

- `Operator` 열거형의 `divide()` 메서드에서 0으로 나누려고 할 때 오류를 던지고 `calculate()` 메서드에서 아래와같이 오류를 잡도록 해주었습니다. 그런데 switch-case문이 보기에 깔끔하지 않다고 느껴졌고, test case를 작성할 때도 번거롭다는 단점이 있었습니다.
    ```Swift
    case .divide:
            var result: Double = 0
            do {
                result = try divide(lhs: lhs, rhs: rhs)
            } catch CalculatorError.divideByZero {
                print(CalculatorError.divideByZero.description)
            } catch {
                print(error)
            }
            return result
    ```
    그래서, `divide()` 메서드가 아닌 `calculate()`에서 오류를 던지고, 사용처에서 try 할 수 있게 바꿔주었습니다!
    ```Swift
    case .divide:
            if rhs == 0 {
                throw CalculatorError.divideByZero
            }
    ```

- componentsByOperators() 메서드를 구현하는 과정에서 정말 많은 시행착오가 있었습니다.. 😂 일단은 input을 바로 [input]으로 넣어줄 수 있는지 몰라서 append 메서드를 사용해보기도 하고, for문에서 input을 split하고 그 결과를 result에 넣어주고, 다시 돌고~ 이렇게 했어야 했는데 그냥 split하고 넣기만하면서 왜안되지? 생각만 하루정도 한 것 같습니다. 여러시도 끝에 아래와같이 작성해주었습니다.
    ```Swift
    func componentsByOperators(from input: String) -> [String] {
    
    // 수정 전
        var result: [String] = []
        result.append(input)
        var someArray: [String] = []
        Operator.allCases.forEach { `operator` in
            for input in result {
                someArray += input.split(with: `operator`.rawValue)
            }
        }
        return someArray
    
    
    // 수정 후
        var result: [String] = [input]
        Operator.allCases.forEach { `operator` in
            var splitedString: [String] = []
            for input in result {
                splitedString += input.split(with: `operator`.rawValue)
                result = splitedString
            }
        }
        return result
    }
    ```

- 지난 스텝에서 test case를 영어로 작성해보는 것도 좋을 것 같다고 하셔서 이번 스텝에서 적용해보았습니다! 영어로도 한글으로도 작성해보았어요!

### 2-3. Trouble Shooting
- 폴더 분리
    UML에 제시되어있는 각 타입별로 파일을 생성해 폴더를 나눠보았습니다! 하지만 어떻게 정리해야할지 잘 모르겠어요.. 예를들면, `String Extension`같은 경우에는 해당 메서드가 `ExpressionParser` 내부에서 사용되기 때문에 같은 파일에 작성할지 고민이 되었습니다. 
    그리고 `extension` 파일명을 `StringExtension`으로 해주었는데, 다른 캠퍼분들은 `String+extension`과 같은 식으로 하셨더라구요~ 개인의 취향차이라고 느꼈는데, 지금처럼 해주어도 되는지와 파일을 어떤 기준으로 분리해주는게 좋을지 그린의 의견이 궁금합니다 :smiley: 

    > **from Reviewer** 폴더 분리에 대해서 지금 정말 잘해주셨다고 봅니다.
    우선 알고계신것처럼 스타일이고 어느 조직이냐에 따라 차이가 나지만 통상적인건 존재합니다.
    저는 그 통상적으로를 따르려고 합니다. 그리고 커스텀한 타입이나 VC , 모델등에 extension하는것들은 해당 파일안에서 코드를 분리해주는 방향으로 사용합니다.
    코드가 많아져서 파일로 구분해야될때는 extension을 받는 주체를 담은 폴더에 같이 넣어주고 있습니다..! 저는 이게 통상적으로 사용한다고 알고 있고 그렇게 사용하고 있습니다.
    제가 잘못 알고 있는거일수도 충분히 있기에 한번 라이브러리들 (애플이면 더 좋구요..!)을 파해치면서 어떤 네이밍과 그룹화를 해보는지 파악해보시면 도움이 더 될것 같습니다🙌
    
### 2-4. UML class diagram
![](https://i.imgur.com/0w21O4r.png)

