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
모든 것은 위젯으로 이루어져 있다 -- *
- Scaffold : 구조를 잡아주는 위젯
    backgroundColor
        Colors  // 시스템 색상
        Color(0xFF181818)     // 커스텀 새상 
        Color.fromARGB(255, 18, 18, 18)
        Color.fromRGBO(18,18, 18, 1)    // 투명도를 함께
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
error size
화면이 넘쳐 흐르는 경우 스크롤을 할 수 있다.
스
```