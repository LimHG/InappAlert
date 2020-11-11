# InappAlert

[![CI Status](https://img.shields.io/travis/LimHG/InappAlert.svg?style=flat)](https://travis-ci.org/LimHG/InappAlert)
[![Version](https://img.shields.io/cocoapods/v/InappAlert.svg?style=flat)](https://cocoapods.org/pods/InappAlert)
[![License](https://img.shields.io/cocoapods/l/InappAlert.svg?style=flat)](https://cocoapods.org/pods/InappAlert)
[![Platform](https://img.shields.io/cocoapods/p/InappAlert.svg?style=flat)](https://cocoapods.org/pods/InappAlert)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

InappAlert is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'InappAlert'
```

## How to Use

1. Processing Alert를 사용할 화면 시작 시 InappAlert 객체 생성 및 초기화
```ruby
// InappAlert Class import
import InappAlert

// InappAlert 변수 선언
var inappAlert : InappAlert? = nil

// viewDidLoad 에 InappCustom 변수 초기화
self.inappAlert = InappAlert(self)
```

2. Processing Alert을 보임과 동시에 출력할 문자 지정
```ruby
// 인앱결제 상태를 Processing Alert으로 보이고자 할 경우
// IAmessageChange 함수를 이용하여 문자를 넣어 준다. 
let Msg: String = "결제를 진행 중입니다."
if let IA = self.inappAlert {
    IA.IAmessageChange(startRestoreMsg)
}
```

3. 진행 중인 연산 및 처리 완료 시 Processing Alert을 종료하는 방법
```ruby
// 단순히 Processing Alert를 종료하려면 IAdismiss 함수를 호출한다. 
// - 해당 함수 호출 시 InappAlert 내부에서 사용하는 UIAlertController 객체는 자동으로 nil 처리 진행
if let IA = self.inappAlert {
    IA.IAdismiss()
}


// Processing Alert의 종료가 된 시점에서 다른 작업을 하고자 할 경우 IAdismiss의 completion을 이용한다.
// 이때 InappAlert 클래스 안 alertController에 대해서는 명시적으로 nil을 넣어준다.
if let IA = self.inappAlert {
    IA.IAdismiss {
        IA.alertController = nil
        
        // 종료 후 실행할 로직 입력
    }
}
```


## Author

LimHG, dla.hg210@gmail.com

## License

InappAlert is available under the MIT license. See the LICENSE file for more info.
