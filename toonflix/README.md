# toonflix

Normad Coders

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


```text
Theme만드는 방법 -- *
[제작]
MaterialApp(
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: const Color(0xFFE7626C),
        ),
        
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: Color(0xFF232B55),
            ),
        ),
        
        cardColor: const Color(0xFFF4EDDB);
    ),
);

[적용] Theme.of(context).
Text('something',
    style: TextStyle(
        color: Theme.of(context).cardColor,
    ),
),

Text('Pomodors',
    style: TextStyle(
        color: Theme.of(context).textTheme.displayLarge!.color,
    ),
),
```

```text
모든 것은 위젯으로 이루어져 있다 -- *
- StatelessWidget : 단순, build메서드만을 사용해서 UI만 그려주는 위젯
- SfatefulWidget : 데이터와 UI를 최신화, 상태를 가지고 있는 위젯
    State에게 데이터가 변경되었다고 말해주어야 한다. <state>를 사용할 경우
    setState : build메서드를 다시 실행시켜준다. 꼭 setState안에서 실행할 필요없다.
        setState(() {}) 호출 자체가 build를 다시 하기 때문에 위젯 UI가 다시 그려지기 때문이다.
    (Widget Lifecycle)!
    initState : 부모 요소에 의존하는 데이터를 초기화하는 경우 사용함
        한 번만 호출되며, build보다 먼저 호출되어야 함
    dispose : 위젯이 화면에 나타나지 않으면 호출되는 오버라이드 함수이다.
    
- Scaffold : 구조를 잡아주는 위젯, screen을 위한 기본적인 레이아웃과 설정을 제공함
    backgroundColor
        Colors  // 시스템 색상
        Color(0xFF181818)     // 커스텀 새상 
        Color.fromARGB(255, 18, 18, 18)
        Color.fromRGBO(18,18, 18, 1)    // 투명도를 함께
- AppBar : 상단의 앱바
    elevation : 음영 효과
    centerTitle : 글자 정렬

- Column, Row : 수직, 수평 방향의 위젯
    mainAxisAlignment : 수평인 경우 좌우 정렬(방향 기준)
    crossAxisAlignment : 수직인 경우 좌우 정렬(방향 기준)
- Padding : 내부 여백을 주는 위젯
    EdgeInsets  : 여백 크기 지정
        .all : 전체
        .only : 한 가지 방향
        .symmetric : 수직(vertical:20), 수평(horizontal:30)
- SizedBox : 크기를 갖고 있는 박스 위젯
- Text : 글을 넣을 수 있는 위젯
    style : 
        TextStyle
            color : 글자 색상
                .withOpacity : 불투명 주기 (default:1)
            fontSize : 글자 크기
            fontWeight : 글자 굵기
                FontWeight.w600
- Container : div같은 child를 가지고 있는 단순 box 위젯
    decoration: 꾸며주기
        BoxDecoration : 박스로 꾸밈
            color : 박스 색상
            borderRadius : 박스 주위 라운딩
                BorderRadius.circular~
    clipBehavior : Container외의 영역을 없앨 수 있음
        Clip.hardEdge : 외부 영역을 잘라냄
- Center
- Transform : 위젯의 크기를 설정해주는...?, 부모 위젯에 영향을 주지 않음 ***
    .scale : 크기 
        child : 위젯 넣기 - 근데 위젯만 넣으면 에러발생, scale을 꼭 넣어주어야 함
        scale : 배수, 5를 넣으면 5배수
        
    .translate : 위젯을 움직임, 위젯으로 덥고 싶거나 움직이고 싶은 경우 움직인다.
        offset : 위젯을 x, y축 방향으로 움직이게 함
            Offset()  
- SingleChildScrollView : 스크롤할 수 있게 해주는 위젯
- IconButton : 아이콘을 클릭할 수 있는 위젯
    Icon(Icons.something)
    onPressed
- ElevatedButton : 
- Flexible : 픽셀을 딱 지정해주는 것이 아니라, UI를 비율에 기반해서 더 유연하게 만들 수 있게 해준다.
    flex : 1, 2, .. 비율을 지정해줌 (default:1)
    
- Expanded : 꽉 채워주는 위젯 
```

```text
const는 compile하기 이전에 알고 있는 데이터이다.

이전에 알고 있는 데이터이기 때문에 커스터 마이징한 Widget같은 경우에는
내부에 const를 사용해서 UI를 정의할 수 없다.
const를 사용하게 되면 에러가 발생한다.

다시, const는 이미 정해진 값들인 경우에 사용하는 것
const는 opacity값을 알기 힘듦 그래서 opacity를 사용하게 되는
UI에서는 const를 사용하면 에러가 발생하게 됨
border Radius도 마찬가지.. 뭔가 일정 값을 매겨주는 곳에 사용하면 안될 것 같다.

위젯 내부에서 함수에 ()괄호를 붙이지 않는 것은
()괄호는 지금 실행을 의미하기 때문이다.
```

```text
Row
    수평 -> Main
    수직 -> Cross
    
Column
    수평 -> Cross
    수직 -> Main

```

```text
Timer   + import 'dart:async';
    Timer.periodic(Duration(seconds:1), (timer) {})
```

```text
supser.key라는 것은 부모 뷰에게 해당 위젯의 key를 보내는 것?이다 
위젯은 ID식별자 역할을 하기 때문에 key를 가지고 있다.  
위젯은 본인을 식별할 key를 가지고 있고, ID처럼 쓰인다는 것 --> Flutter는 위젯을 식별하기 위해 ID를 사용함
```

```text
[외부 라이브러리]
pub.dev -> Dart,Flutter

[라이브러리 추가 방법]
pubspec.yaml
```