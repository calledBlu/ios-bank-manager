# ios-bank-manager


[1. Team Introduce](#-team-blust3r-)

[2. Ground Rules](#-ground-rules)

[3. 순서도](#순서도)

[4. 객체의 역할](#-객체의-역할과-책임)

[5. 학습키워드 및 학습내용](#-학습-키워드-및-학습-내용)

[6. STEP별 구현내용](#-step별-구현-내용)

[7. 트러블 슈팅](#-트러블-슈팅)

[8. 질문과 답변](#-질문과-답변)

</br>

## 💫 Team BLUST3R 💫
🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `23.02.20` ~ `23.03.10`

|<img src="https://avatars.githubusercontent.com/u/71758542?v=4" width=200>|<img src="https://avatars.githubusercontent.com/u/45708630?v=4" width=200>|
|:---:|:---:|
|[Blu](https://github.com/bomyuniverse)|[Lust3r](https://github.com/llimental)|

<br>

## ⛳ Ground Rules

- 커밋 규칙
    - ✨ **Git Commit Convention**
        - Prefix 전체 소문자, **`[prefix]`**
        - `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
        - `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
        - `docs` = 문서에 변경 사항이 있는 경우
        - `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
        - `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - `chore` = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - +) `design` = UI 디자인을 변경했을 때
- 매 정각 15분 휴식
- STEP 진행도보다 프로젝트 이해, 학습을 위주로
- class, struct, enum 에서는 첫 줄 공백, func는 공백 없이 바로 코드 작성
- 코드가 없는 줄은 여백 없이
- 객체지향 체조 원칙에서 꼭 지킬 항목
    - 3) 모든 원시 값과 문자열을 포장합니다
    - 7) 3개 이상의 스위프트 기본 데이터 타입(Int, String, Double 등) 프로퍼티를 가진 타입을 구현하지 않습니다.
    - `?` 9) getter/setter를 구현하지 않습니다

<br>

## 순서도

<img src="https://user-images.githubusercontent.com/71758542/224683202-a1281cf4-4098-4351-8d13-87d60e7c7de2.png" height="800">

<br>

## 🔍 객체의 역할과 책임

| 객체 | 타입 | 역할과 책임 |
| --- | --- | --- |
|BankManager|`class`|시스템 메뉴를 보여주고, 입력값에 따른 메뉴 분기를 하는 기능을 가짐|
|Node|`class`|각 Customer의 정보와 다음 Customer의 정보를 가짐|
|LinkedList|`class`|Customer Node를 가지고 만든 LinkedList|
|LinkedQueue|`class`|대기열로 기능할 수 있도록 LinkedList를 채택 후 기능 구현|
|Customer|`struct`|은행에 방문한 고객 객체. 대기번호와 WorkType을 가짐|
|Banker|`struct`|Customer의 대기번호를 받고, 업무를 처리하는 객체|
|Bank|`struct`|비동기 프로그래밍을 통해 멀티 스레드로 Banker를 이용, Customer의 업무를 처리하는 객체 |
|BankerProtocol|`protocol`|Banker 객체가 채택하는 프로토콜로, work시 출력할 메세지를 반환하는 기능을 가짐|
|UserInputReceivable|`protocol`|콘솔 기준으로 이용자의 메뉴 입력을 받기 위한 기능을 가짐|
|CustomerManageable|`protocol`|임의의 고객의 수와 임의의 WorkType을 메서드를 통해 얻어 customerQueue를 만드는 기능을 가짐|
|SystemMenu|`enum`|은행 개점과 종료의 메뉴를 보여주는 기능을 가짐|
|WorkList|`enum`|Customer의 WorkType을 가지는 enum 객체|

<br>

## 📚 학습 키워드 및 학습 내용
### 1. Linked-list
- 노드가 데이터와 포인터를 가지고 한 줄로 연결되어있는 방식으로 데이터를 저장하는 자료구조
- 포인터가 다음이나 이전 노드와의 연결을 담당
- 종류: 단일 연결리스트, 이중 연결리스트, 원형 연결리스트
- 장점: 자료의 추가와 삭제가 $O(1)$의 시간복잡도를 가짐
- 단점: 배열, 트리구조와 달리 특정 위치의 데이터를 검색하는 데에는 $O(n)$의 시간이 걸림

### 2. Queue
- 먼저 집어넣은 데이터가 먼저 나오는 FIFO구조
- 종류: 선형 큐, 환형 큐, 링크드 큐
- 프로젝트상 요구기능 분석
- Enqueue: queue에 값을 추가
- Dequeue: head를 queue에서 제거하고 값을 반환
- Clear: queue에 있는 모든 값을 제거
- Peek: dequeue와 다르게 queue에서 제거하지 않고 head의 값만 반환
- isEmpty: queue가 비어있는지 확인

### 3. Generics
- 타입에 의존하지 않는 범용 코드를 작성할 때 사용
- 서로 다른 Type을 Parameter로 받아 진행할 때, 코드의 재사용성을 높임
- 제네릭 함수
    - 함수 이름 뒤에 `<제네릭타입이름>`을 선언해 주면 해당 이름을 타입처럼 사용할 수 있음
    - `<T>`의 경우 T를 Type Parameter라고 부르는데, 이는 새로운 형식이 생성되는 것이 아니라 실제 함수가 호출될 때 해당 매개변수의 타입으로 대체되는 Placeholder 역할
    - 타입 파라미터의 경우 가독성을 위해 T나 V같은 단일문자, 혹은 Upper Camel Case를 사용

### 4. Unit Test
- 테스트 코드를 작성하는 이유
    - 코드의 안정성을 높일 수 있음
    - 유지보수에 유리함
    - 스펙을 문서화할 수도 있음
    - 깔끔한 코드를 작성할 수 있음

### 5. 재귀함수, 꼬리재귀함수
- 재귀함수
    - 함수 내에서 해당 함수를 호출하는 것
    - 스택에 함수 호출을 하나씩 쌓고 거꾸로 반환 값을 넘기며 계산을 수행
    - 필수 요소: 함수 탈줄 초건, 함수 호출, 리턴 값
    - 대표적인 예: 팩토리얼
    - 단점: 값이 커서 함수 호출을 아주 많이 해야 할 경우 stack overflow 발생
- 꼬리재귀함수
    - 함수를 호출하면서 스택을 재사용하는 것
    - 스택을 재사용하기 때문에 메모리를 아낄 수 있음
    - 컴파일 시점보다 런타임 시점에 이득을 얻음
    - 일반적인 재귀함수의 단점인 stack overflow를 방지할 수 있는 함수
    - return에 함수 호출 이외에 다른 연산자가 붙지 않는 경우에 적용
- 재귀 함수와 반복문의 장단점 비교
    ||재귀 함수|반복문|
    |:---:|:---:|:---:|
    |👍 **장점**|상대적으로 코드가 간결|상대적으로 속도가 빠름|
    |👎 **단점**|메모리를 많이 사용, 상대적으로 속도가 느림|상대적으로 복잡한 코드|

### 6. 값 타입, 참조 타입
- `Struct`
    - 값 타입: 데이터를 전달할 때 값을 복사하여 전달
    - 상속 불가
    - Swift 대부분의 큰 뼈대는 모두 구조체로 구성
- `Class`
    - 참조 타입: 데이터를 전달할 때 값의 메모리 위치를 전달
    - 단일 상속
    - Apple 프레임워크 대부분의 큰 뼈대는 모두 클래스로 구성
- **구조체와 클래스 중 어떤 것을 사용해야 할까?** (출처: [Apple 공식문서](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes))
    - 프로젝트의 성격과 데이터의 활용도에 따라 선택해서 사용함
    - 기본적으로 구조체를 사용
    - Objective-C와 상호 운용성이 필요한 경우 클래스 사용
    - 모델링 중인 데이터의 ID를 제어해야 하는 경우 클래스 사용
    - 프로토콜과 함께 구현체를 공유하여 행동을 채택하는 경우 구조체를 사용
    - 다음 조건 중 하나 이상에 해당한다면 구조체를 사용할 것을 권장
        - 연관된 값의 집합을 캡슐화하는 것만이 목적일 때
        - 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
        - 구조체에 저장된 프로퍼티가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
        - 다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때


### 7. DispatchQueue: Sync/Async

>[출처: Apple 공식문서 - DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue)

- **Sync, 동기**
    - 앞선 작업이 종료될 때까지 대기 후 다음 작업 처리
- **Async, 비동기**
    - 앞선 작업이 종료되기를 기다리지 않고 다른 스레드에서 처리
- **Sync, Async의 차이**
    - 실행 종료 시점을 알 수 있는가에 대한 차이
    - 비동기의 경우 언제 작업이 종료되는지 알 수 있음
- **DispatchQueue**
    - 동기 프로그래밍을 하면 이전 코드가 완료될 때 까지 기다려야 해서 프로그램의 지연을 발생시킨다는 단점이 있음
이 때문에 비동기 프로그래밍을 하면 오래 걸리는 코드를 별도로 처리하면서도 다른 작업을 하는 효율을 꾀할 수 있는 장점이 있음
    - `main().async`
        - main스레드에서 비동기 작업
        - 다른 스레드를 만들지 않고 main 스레드에서만 일을 처리
        - 작업이 끝나기를 기다리지는 않고 있지만 main 스레드라는 단일 스레드에서만 작업이 이루어지고 있기 떄문에 동시에 작업이 처리되지는 못함
        - 쌓인 순서대로 작업 처리
    - `global().async`
        - main 스레드가 아닌 다른 스레드를 만들어 비동기적으로 작업 처리
        - async의 특성상 어떤 코드가 먼저 실행될 지는 예측할 수 없음
        - 각 스레드마다 작업이 처리되는 속도가 다를 수 있고, 이를 직접 통제할 수 없음
        - 동시에 처리되는 작업에 대해서는 논리적으로 정확한 순서를 기대하기는 어려움
    - `global().sync`
        - main 스레드가 아닌 다른 스레드를 생성하고 그 위에서 동기적으로 작업을 처리해주느 메서드
        - 스레드는 각각 다르지만 동기적으로 일을 처리하기 때문에 각각의 작업이 끝나기를 기다림
    - `main().sync`
        - main 스레드에서 직접 호출하면 안되는 코드
        - 작업이 끝나기를 기다리는 sync의 특성 떄문에 직접적으로 호출하는 경우 교착상태(deadlock)에 빠지게 됨
        - Serial 큐를 커스텀하여 sync를 실행하면 에러는 발생하지 않음
        - global 스레드에서 호출하는 것은 괜찮다!
- **DispatchGroup**
    - 작업 그룹을 만들어 그 그룹을 하나의 단위로 모니터링할 때 사용
    - group.wait() 메서드를 DispatchGroup의 수행이 끝나기를 기다릴 수 있음


### 8. Escaping closure
> A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns.
[출처: swift 공식문서 - Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/#Escaping-Closures)
- closure는 해당 코드 구문에서 진행되어야 하지만 Escaping closure는 그 코드 구문, 함수가 반환된 이후에 진행되는 차이점이 있음.
- 또한 closure는 정의된 주변 컨텍스트에서 값을 캡처하는데 상수와 변수에 대한 참조를 캡처하고 저장할 수 있어 원래 범위가 더 이상 존재하지 않아도 본문 내에서 해당 상수와 변수의 값을 참조하고 수정할 수 있음.
- 하지만 escaping closure는 캡쳐한 값이 복사된 것이기에 그 안에서 수정하게 되더라도 원본에 영향을 줄 수 없어 mutable한 struct를 사용할 수 없고 class를 써야 함.
공식문서에서도 struct와 enum은 shared mutability를 허용하지 않기에 mutable한 참조는 캡처할 수 없다고 함.
자세한 내용은 문서에 나와있지 않아 설명을 바탕으로 추측해보면, closure는 해당 구문 내에서 실행되고, mutating을 통해 원본 값에 반영을 할 수 있지만 escaping closure는 해당 구문을 벗어나기 때문에 값을 캡처해서 복사하기 때문이라고 생각함.
이 캡처도 reference type, value type을 구분하기 때문에 value type이라면 'Structures and Enumerations Are Value Types'에서 말하듯 값이 변경된 순간 다른 복사본 메모리로 만들어지기 때문에 원본에 영향이 없지만, reference type이라면 복사된 값이 변경되더라도 원본에 영향을 줄 수 있기 때문에 차이가 있다고 생각함.


### 9. Semaphore
> An object that controls access to a resource across multiple execution contexts through use of a traditional counting semaphore.
[출처: apple 공식문서 - Dispatch Semaphore](https://developer.apple.com/documentation/dispatch/dispatch_semaphore/)
- 공유자원에 접근할 수 있는 스레드의 수를 제어해 줌으로써 Race Condition을 방지해주는 역할도 함
- 허용된 스레드 수만큼 접근된 상태라면 다른 스레드는 접근하지 못하고 줄을 서서 기다리게 됨

</br>

## 🔨 STEP별 구현 내용

### STEP 1
- **큐 타입 구현**
    - 은행에 도착한 고객이 임시로 대기할 대기열(Queue) 타입 직접 구현
    - Queue 타입 구현을 위한 Linked-list 타입 직접 구현
    - Queue 타입이 다양한 타입의 데이터를 처리할 수 있도록 Generics 기능 활용
    - Unit Test를 통한 Queue 타입의 기능 검증
    - 필수 구현 기능
        - `Enqueue`, `Dequeue`, `Clear`, `Peek`, `isEmpty`
- 🗝️ keyword: `Linked-list`, `Queue`, `Generics`, `Unit Test`
- [STEP 1 PR 🔗](https://github.com/tasty-code/ios-bank-manager/pull/13)

### STEP 2
- **타입 구현 및 콘솔앱 구현**
    - 은행/고객 타입 구현
        - n명의 은행원이 근무
        - n명의 고객이 업무 처리를 위해 대기
        - 모든 고객의 업무가 끝나면 은행 업무를 마감, 마감 시 처리한 고객 수, 총 업무시간 출력
        - 은행원은 한 번에 한 고객의 업무를 처리
        - 각 고객의 업무 처리 시간: 0.7초
        - 고객의 업무 처리 시작 시 고객 번호와 함께 안내 메세지 출력
        - 고객의 업무 처리 완료 시 고객 번호와 함께 안내 메세지 출력
        - 해당 타입 외 자유롭게 구현 가능
    - 콘솔앱 구현
        - Step2에서는 한 명의 은행원이 근무
        - 앱 실행 시 메뉴 출력
        - 개점 메뉴 선택 시 10~30 범위 내의 고객 대기열 생성
        - 고객의 업무를 모두 처리하면 마감 메세지 출력 후 다시 메뉴 출력
        - 종료 메뉴를 선택하면 프로그램 종료
- 🗝️ keyword: `재귀함수`, `꼬리재귀함수`, `값 타입`, `참조 타입`
- [STEP 2 PR 🔗](https://github.com/tasty-code/ios-bank-manager/pull/20)

### STEP 3
- **다중처리**
    - Step 3의 은행에는 3명의 은행원이 근무
        - 2명은 예금업무, 1명은 대출업무 처리
    - 고객의 업무 종류는 고객 생성 시 임의로 지정
    - 업무에 따른 소요시간
        - 대출: 1.1초
        - 예금: 0.7초
    - 고객 업무 시작/완료 시 안내 메세지에 고객 대기번호와 함께 업무도 함께 출력
- 🗝️ keyword: `Concurrency`, `Thread`, `Sync/Async`, `추상화`, `일반화`
- [STEP 3 PR 🔗](https://github.com/tasty-code/ios-bank-manager/pull/26)
<!--
### STEP 4
- **UI 구현**
    - 코드만 사용하여 구현
    - 고객 정보를 표현할 커스텀 뷰 구현
        - 고객 정보: 고객 번호, 업무 종류
    - 대기열은 StackView 활용
        - 화면 전체를 여러개의 스택뷰로 구성
    - 화면 구성
        - 업무중인 고객 리스트, 대기중인 고객 리스트, 업무시간 타이머, 고객 10명 추가 버튼, 초기화 버튼
    - 고객 10명 추가 버튼을 누르면 임의의 고객 10명 추가
    - 초기화 버튼을 누르면 대기중인 고객과 타이머 모두 초기화
    - 대기중인 고객이 없으면 타이머가 멈춤
    - 고객이 추가되어 다시 업무를 실행하면 타이머가 동작
        - 초기화 전까지 업무시간은 초기화되지 않고 누적
- 🗝️ keyword: `Code-base`, `StackView`
- [STEP 4 PR 🔗]()
-->
</br>

## 🚀 트러블 슈팅

### 1. Console App의 Unit Test Target 추가
- Unit Test를 위해 프로젝트에서 New Unit Test Target으로 Test Unit을 추가하고 코드를 작성했습니다. 그런데 `@testable import BankManagerConsoleApp` 을 했음에도 `undefined symbol` 오류가 발생하였습니다.
이유를 찾아본 결과 Application(iOS) 프로젝트의 경우에는 target으로 프로젝트를 선택하여 진행할 수 있지만, command line 프로젝트는 선택할 수 없어 테스트하고자 하는 파일에서 Test Unit에 `target membership`을 설정해 주어야 했습니다.
테스트를 진행하고자 하는 코드가 있는 LinkedList.swift, LinkedQueue.swift 파일에서 Test Unit을 `target membership`에서 설정해준 후 문제를 해결할 수 있었습니다.
  

### 2. Queue를 Linked-list로 구현 시의 시간복잡도

- STEP 1이 공개된 후 학습해야 할 키워드를 추출하고, 개인적으로 학습하는 것을 우선으로 진행하였습니다. 그리고 코드 이해도를 위하여 각자 `LinkedQueue`(Linked-list로 구현된 Queue)를 구현해본 후 서로의 코드에 대해 질문하고 논의해 보았습니다.    
논의한 내용을 바탕으로 추가로 이해가 필요한 부분에 대해 함께 학습하고, 기존에 작성한 코드를 전부 삭제한 후 짝 프로그래밍으로 코드를 작성하였습니다.
    - 👨🏻‍💻 **Lust3r's Code (단방향 Linked-list)**
        ```swift
        func enqueue(data: T) {
            var head: Node<T>?
            var node = head

            if head == nil {
                head = Node(data: data)

                return
            }

            while node.next != nil {
                node = node.next
            }
            node.next = Node(data: data)
        }
        ```
    - 💙 **Blue's Code (단방향 Linked-list + rear 프로퍼티)**
        ```swift
        // LinkedQueue의 enqueue
        mutating func enqueue(data: T) {
            nodes.append(data)
        }

        // LinkedList의 append 기능
        mutating func append(_ data: T) {
            let newNode = Node(data: data)

            count += 1

            if head == nil {
                head = newNode
                tail = head

                return
            }

            tail?.next = newNode
            tail = newNode
        }
        ```
- 단방향 Linked-list만 사용한 첫 번째 코드는 `rear`(제일 나중에 추가된 노드를 확인하는)프로퍼티가 없어서 `while` 반복문을 사용하여 노드의 `next`가 `nil`이 될 때까지 탐색하는 코드라서 시간복잡도가 $O(n)$이 될 것이라 판단하였습니다.
시간복잡도가 $O(n)$이 된다면, 자료의 추가와 삭제가 $O(1)$의 시간복잡도를 가진다는 Linked-list의 장점이 사라진다고 생각하여 논의 후 새로운 코드를 작성 시 시간복잡도가 $O(1)$이 될 수 있도록 작성해 보았습니다.

### 3. Queue 연결 타입 문제 해결
- 처음 customerQueue에 customer의 수(random)만큼 `enqueue`를 해줄 때, `Node<Customer>`를 넣어줬기 때문에 디버깅 과정에서 head와 node가 각각 data와 next를 갖고 있는 문제가 있었습니다.
넣어줘야 하는 데이터 타입에 대해 다시 고민했고, enqueue 자체가 Node를 Queue에 넣어주는 것이기 때문에 value에 데이터 타입인 Customer를 넣어주면 된다는 결론을 낼 수 있었습니다.
그렇게 해서 다음과 같은 코드를 구현하여 enqueue 작업을 정상적으로 할 수 있었습니다.
    ```swift
    for waitingNumber in 1...maxCount {
        customerQueue.enqueue(value: Customer(waitingOrder: waitingNumber))
    }
    ```

### 4. 메뉴 반복 문제 해결
- 메인 메뉴를 어떻게 반복을 할까 고민을 하다 while 반복문으로 감싸는 것 대신 재귀함수를 사용하여 메뉴를 출력하고 수행하는 메서드를 불러오면 되겠다는 생각을 했습니다.
결과값에 함수 출력만 있는 꼬리재귀로 코드의 간결화는 물론 재귀함수에 비해 안정성을 높일 수 있었습니다.
    ```swift
    switch SystemMenu(rawValue: userInput) {
        case .open:
            bank.open()
            return execute()
        case .close:
            break
        case .none:
            break
    }
    ```

### 5. Bankmanager 역할 분리
- 기존에는 main에서 BankManager의 `startBusiness()` 메서드만 호출하고, BankManager가 모든 일을 처리했습니다.
그러나 기술명세상에서는 은행원이 고객의 일을 처리해야 하고, 은행 타입 구현이 명시되어 있어 분리를 하게 되었습니다.
최종적으로 Bank 타입을 구현하면서 BankManager는 전체적인 반복되는 업무 틀만 관리하는 역할을 하고, Bank는 CustomerQueue를 생성하여 큐 내부에 존재하는 고객의 대기번호를 은행원에게 전달하여 일을 처리할 수 있는 역할을 합니다.

### 6. 3명의 은행원 비동기 처리
- Step 3을 처음 설계 시 은행원이 3명이라는 구현 요구사항을 보고 은행원 객체를 3개 생성하여야 할까? 라는 고민을 하였습니다. 하지만 저번 step에서 콘이 조언해주신 것처럼 `프로그램의 서비스 시나리오와 프로그램의 시나리오가 동일시 되는 것 같다`라는 생각에 러스터와 함께 고민해 보았습니다.
- 학습 키워드 중 `동시성 프로그래밍 개념의 이해`, `thread의 개념에 대한 이해`가 있어 설계 전 해당 부분을 충분히 학습하기로 결정하고 학습 결과, 은행원을 인원수에 맞춰 객체로 생성하는 것보다 업무를 구분하고, 해당 업무에 접근할 수 있는 thread의 수로 은행원의 수를 결정하는 것이 좋겠다 생각하였고, 이를 구현하기 위해 업무별로 semaphore를 선언하여 접근할 수 있는 스레드 수를 제어해 주었습니다.

    ```swift
    // Bank.swift 의 open() 메서드 내부
        // ...
        let loanSemaphore = DispatchSemaphore(value: 1)
        let accountSemaphore = DispatchSemaphore(value: 2)

        while !customerQueue.isEmpty() {
            // ...
            switch currentCustomerWorkType {
            case WorkList.account.rawValue :
                DispatchQueue.global().async(group: group) {
                    accountSemaphore.wait()
                    accountBanker.work(of: currentCustomer.waitingOrder, for: currentCustomerWorkType)
                    todayCounter.addAccountCustomer()
                    accountSemaphore.signal()
            }
            default:
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    accountBanker.work(of: currentCustomer.waitingOrder, for: currentCustomerWorkType)
                    todayCounter.addLoanCustomer()
                    loanSemaphore.signal()
            }
        }
    }
    ```

### 7. 메서드 역할 분리(Counter)
- 리팩토링 전 작성했던 Bank의 `open()`메서드 내부에 프로퍼티가 많이 포함되어 있고, 한 객체에 너무 많은 역할이 주어지는 것 같아서 역할 분리를 진행해 보고자 하였습니다.
    ```swift
    // refactoring 이전

    let numberOfTodayCustomers = makeAcceptableNumber()
    let customerQueue = makeCustomerQueue(maxCount: numberOfTodayCustomers)
    let loanSemaphore = DispatchSemaphore(value: 1)
    let accountSemaphore = DispatchSemaphore(value: 2)
    let group = DispatchGroup()
    var numberOfAccountCustomers = 0
    var numberOfLoanCustomers = 0
    ```
- 위의 프로퍼티를 보고 분리할 수 있는 역할에 대해 고민해보다가 고객의 수를 집계하는 역할을 분리해보고자 Counter 클래스를 구현하였습니다.
- Counter 클래스는 예금 고객의 수 / 대출 고객의 수를 프로퍼티로 가지고 각 고객을 1씩 증가시키는 add, 각 고객의 수를 가져오는 get, 모든 고객의 수를 초기화 시키는 reset 메서드를 가지고 있습니다.
- 역할 분리로 인해 Bank 객체가 한 가지 역할을 덜 수행할 수 있게 되었고, `open()` 메서드 내부에서 처리해야 하는 일도 다른 객체에 위임할 수 있게 되었습니다!


</br>

## 🙋🏻 질문과 답변
### 1. 전반적인 네이밍
- 최대한 실제 상황에 맞게, API 가이드라인에 맞춰 네이밍을 수정하였습니다.
혹시 네이밍만 보고 역할을 파악하기 어려운 것이 있다면 코멘트 부탁드립니다!
코멘트 주신 부분에 대해서 더 고민해보고 수정하도록 하겠습니다.

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > 음~ 저는 뭐 이런 네이밍도 크게 나쁘다고 생각이 들진 않아요. 물론 어느정도 역할을 유추할 수 있는 네이밍이 들어가면 좋죠! 이런 경우에는 Value 와 같은 네이밍을 사용할 것 같아요. 변수도 data보단 value가 더 어울리는 것 같구요.


### 2. `usleep()` vs `Thread.sleep()`
- 처음에는 `usleep()`에 시간을 주어 0.7초를 지연시켰습니다. 하지만 `rawValue` 그대로 입력하여 메세지 출력간 delay를 주는 것보다 현재 Step에서는 main 스레드에서만 작업이 진행되고 있기 때문에(한 명의 은행원이 customer queue를 담당) customer 한 명이 은행원과 업무를 보는 동안에는 다른 customer는 대기를 해야하는 상황이 main 스레드의 동기적 처리와 비슷하다고 판단하였습니다.
그래서 `Thread`의 `sleep` 기능을 활용하여 은행원이 갖고 있는 `processingTime`을 파라미터로 메세지 출력간 delay를 주는 방식을 사용하게 되었습니다.

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > LinkedList와 LinkedQueue는 사실 엄연히 다른 객체라고 봐요. LinkedQueue가 LinkedList를 활용할 뿐이죠. LinkedQueue가 내부적으로 다른 형태의 LinkedList를 사용할 수도 있어요.

### 3. Generic Type 사용 시 Type Parameter 네이밍 질문
- Generic 타입 사용 시 Type Parameter의 경우 가독성을 위해 T나 V같은 단일문자, 혹은 Upper Camel Case를 사용하는 것으로 학습하였고, 저희는 T를 사용하였습니다.    
하지만 위와 같은 네이밍을 피하고 명확히 작성해야 한다는 의견도 있어 Type Parameter를 사용할 때 네이밍을 어떻게 하면 좋을지 궁금합니다!

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > 네이밍이 너무 모호해요. 추상화를 학습하고 연습하시다보니 이렇게 너무 많은것을 축약해버린 것 같기도 해요. 그리고 추상화를 진행하는 이유에 대해서도 고민해볼 필요가 있어요.

### 4. Unit Test 진행 시 중복되는 기능에 대한 질문
- 현재 저희가 작성한 코드에서는 `LinkedQueue`의 메서드들이 `LinkedList`의 메서드와 프로퍼티로 구성되어 있습니다. 더 포괄적인 객체인 `LinkedQueue`를 테스트하면 `LinkedList` 또한 테스트가 진행된다고 생각하였습니다.    
혹시 저희 코드처럼 한 객체가 다른 객체의 기능을 활용하는 경우 테스트 케이스가 중복될 위험이 있더라도 각각 Unit Test를 진행해 주는 것이 좋을까요?
(**LinkedList**: `append()`, `removeFirst()`)
(**LinkedQueue**: `enqueue(data:)`, `dequeue()`)

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > 이 두 선택지에서 현재 프로그램에서 무엇을 사용하는지는 딱히 크게 중요한 것 같지는 않아요. 두 분이 말씀해주신 의도대로 Thread.sleep이 좀 더 편리해보이긴 해요!

### 5. Escaping Closure의 Capture 원리
- Customer의 수를 세기 위해 Counter를 class 타입으로 만들었습니다. 그런데 struct와 class 중에 선택할 때 class를 선택해야 하는 이유가 없다면 대부분의 경우에는 struct를 권장한다는 문서의 말에 따라 struct로 한 번 변경해보니 escaping closure에서 mutable한 값을 캡처할 수 없다는 오류를 보게 되었습니다.
- Closure 공식문서를 통해 escaping closure는 mutable한 struct, enum은 capture할 수 없다는 설명은 보았지만, 그 이유에 대해서는 찾을 수 없었습니다.
- 다방면으로 찾아보고 주변에 물어본 결과, 값을 복사해서 사용하기 때문에 escaping closure가 끝나면 원본에 반영되지 않고 사라지기에 그렇다-라는 결론이 나왔습니다. 그렇다면 값타입과 참조타입의 차이가 반영이 되었다는 것인데, 클로저 공통 설명에서는 값을 '참조'한다고 되어 있어 값타입이든 참조타입이든 변경이 가능한 것이 아닐까 하는 생각도 들었습니다.
- 위의 결론과 생각을 다 만족시키려면 closure와 escaping closure의 캡처 방식이 다르거나 문서에서의 reference가 type을 뜻하는 것이 아니라 그냥 값 / 주소를 참고 한다의 '참조'이거나 둘 중 하나일 것이라 생각했습니다.
- escaping closure에서 mutable한 값은 캡처할 수 없다는 문구와, 값을 캡처(복사)하여 사용해서 그렇다는 설명을 보고 납득은 했지만 이러한 이해가 맞는 것인지 여쭤보고 싶습니다!

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > closure와 escaping closure의 차이는 실행시점입니다. 일반적인 closure는 메서드 안에서 바로 실행됩니다. 하지만 메서드 안에서 바로 실행되지 않고, 변수에 저장되거나, 언제 실행될지 모르는 closure라면 현재 문맥을 벗어나서 실행된다는 의미에서 escaping closure라 불립니다.
struct, enum과 같은 값타입의 인스턴스는 설계자체가 immutable 합니다. 애초에 기대하는 바가 복사이지 변경이 아니기 때문이죠. 복사는 말그대로 복사이기 때문에 이전 값의 영향을 주지 않아요. 이게 우리가 값타입에 기대하는바에요. 이를 통해 프로그램 흐름에 있어 예상치 못한 값의 변경을 방지하는데 사용할 수 있죠.
escaping closure에서 값을 캡처한다는 것은 언젠가 이 closure가 실행될 때 캡처한 값을 읽거나 쓴다는 것을 의미하죠. 역시 쓴다는 의미가 내포되어 있기 때문에 값타입을 캡처한다는 것은 앞뒤 논리가 성립이 되지 않는것이죠.

### 6. `if` vs `guard`
- `Bank.swift`의 `open()` 메서드 내부에서 고객을 dequeue한 후 고객의 업무에 따라 분기처리를 할 수 있게끔 구현하려고 하는 부분에서 원래 `if-else`를 사용하였습니다.

    ```swift
    if currentCustomerWorkType == WorkList.account.rawValue {
        DispatchQueue.global().async(group: group) {
            accountSemaphore.wait()
            accountBanker.work(for: currentCustomer.waitingOrder, what: currentCustomerWorkType)
            todayCounter.addAccountCustomer(with: 1)
            accountSemaphore.signal()
        }
    } else {
        DispatchQueue.global().async(group: group) {
            loanSemaphore.wait()
            loanBanker.work(for: currentCustomer.waitingOrder, what: currentCustomerWorkType)
            todayCounter.addLoanCustomer(with: 1)
            loanSemaphore.signal()
        }
    }
    ```
- 클린코드 스터디를 진행한 버드에게서 `if-else` 구문을 사용하게 되면 `guard` 구문을 사용했을 때보다 가독성이 떨어진다는 이야기를 듣게 된 후 `guard-else`로 변경해 보았으나 guard는 조건에 일치하지 않는 경우 특정 실행 구문을 빠르게 종료하는 Early-exit의 특성이 강하다고 생각되었습니다.

- 추가적으로 학습해본 결과 if문에서 else 사용을 지양하자! 라고 주장하는 이유는 아래의 두 가지로 추정되었습니다
    - style(가독성) 관련
    - 반전된 로직을 작성하게 되는 논리적 위험 발생 가능성
- 저희의 프로젝트, Step 3에서는 업무가 예금 / 대출의 두 가지 중 하나이기 때문에 논리적 위험 발생 가능성은 없지만, else로 인해 해당 부분을 들여쓰게 되어 가독성 관련하여서는 지양해야 하는 케이스가 될 것 같습니다.
- 저희의 경우 if-else를 사용해도 무방해 보이지만, guard-else{continue}를 써도 괜찮을 거 같아요. 현업에서 가독성 때문에 if문 사용 시 else 사용을 지양하는 편인지, 콘은 어떻게 사용하는 게 더 좋을 것 같은지가 궁금합니다!

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > 저는 이거 혹은 저거를 수행한다는 의미에서 if-else를 사용해요. "이럴 경우만" 수행해! 라면 guard를 사용하죠. 늬앙스가 조금 다른 것을 느낄 수 있을거에요.
early exit은 if문으로도 충분히 가능하죠. 참 이게 어떤게 정답이다라곤 할 수 없는 것 같아요. 동료들끼리 어떤 합의가 되어있으며 어떤 방식으로 코드를 작성하는지, 어떤 방식을 사용해야 동료들이 내 코드를 읽을 때 좀 더 직관적일 수 있을까에 대해서 고민해보면 좋을거에요.

### 7. DispatchQueue 관련 질문
- semaphore를 account와 loan으로 두 개 사용하고, group까지 설정하니 선언한 프로퍼티가 벌써 3개가 넘어가 기본 타입 3개 이하로 유지해야 하는 원칙을 위배하게 되었습니다.
- 비동기 프로그래밍을 하게 된다면 이처럼 설정해줘야 하는 것이 많은데 semaphore나 이런 프로퍼티도 따로 빼내서 사용할 수 있는지 여부와 저희 은행원 쓰레드의 async 코드도 사용하는 semaphore만 빼면 비슷한 구성인데 하나로 묶어서 사용할 수 있는 방법이 있을지 궁금합니다!
    ```Swift
    let loanSemaphore = DispatchSemaphore(value: 1)
    let accountSemaphore = DispatchSemaphore(value: 2)
    let group = DispatchGroup()

    while !customerQueue.isEmpty() {
        guard let currentCustomer = customerQueue.dequeue() else { return }

        let currentCustomerWorkType = currentCustomer.workType

        switch currentCustomerWorkType {
        case WorkList.account.rawValue :
            DispatchQueue.global().async(group: group) {
                accountSemaphore.wait()
                accountBanker.work(of: currentCustomer.waitingOrder, for: currentCustomerWorkType)
                todayCounter.addAccountCustomer()
                accountSemaphore.signal()
            }
        default:
            DispatchQueue.global().async(group: group) {
                loanSemaphore.wait()
                accountBanker.work(of: currentCustomer.waitingOrder, for: currentCustomerWorkType)
                todayCounter.addLoanCustomer()
                loanSemaphore.signal()
            }
        }
    }
    ```
    
    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > 전 개인적으론 BankerProtocol이 존재해서 아래와 같은 그림을 상상했어요.
    ```swift
    final class LoanBanker: BankerProtocol { 
    }

    final class AccountBanker: BankerProtocol { 
      private let semaphore: DispatchSemaphore 
      ... 

      init(numberOfBankers: Int, ... ) { 
        self.semaphore = DispatchSemaphore(value: numberOfBankers)
        ...
      }

      func work(customer: Customer) { 
        guard customer.workType == .account else { return } 
        ... 
      } 
    }

    let bankers: [BankerProtocol]

    init(bankers: [BankerProtocol]) {
      self.bankers = bankers
    }

    customers.forEach { customer in 
      bankers.forEach { $0.work(customer) }
    }
    ```
    > 대충 적은 코드이지만 대략 저런 모습을 상상했어요. Bank에서 DispatchGroup을 각각 주입해주고 모든 일이 끝나면 notify 해주고 이때 Timer가 경과한 시간을 측정하는 그런 모습을 상상했습니다.
