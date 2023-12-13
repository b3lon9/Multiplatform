void main() {
  addNumbers(10, 20);


}

// 세 개의 숫자(x, y, z)를 더하고 짝수인지 홀수인지 알려주는 함수
// parameter / argument
// positional parameter 순서가 중요한 파라메터
addNumbers(int x, [int y = 0, int z = 10]) {
  print('addNumbers 실행');

  // int x = 10;
  // int y = 20;
  // int z = 30;

  int sum = x + y + z;
  print('sum : $sum');
  if (sum % 2 == 0) {
    print('짝수');
  } else {
    print('홀수');
  }
}

addNumber({
  required int x,
  required int y,
  required int z
}) {

}

// optional + required
addNumberr({
  required int x,
  required int y,
  int z = 10
}) {

}

// option


/*
변수를 선언하는 것
세미콜론을 마지막에 꼭 붙여준다.
  [변수]
    var, int(정수), double(실수:소수점), bool, String, dynamic
    : var을 사용해도 되지만, 명시해주는 것이 구분하기 좋음
    : dynamic은 어떤 타입이든 다 넣을 수 있다. var과의 차이점은 계속해서 다른 타입을 대입 할 수 있다는 것
    
    Map<String, String> = {};
    List<String> = [];

  [null]
  nullable : null이 될 수 있음
  non-nullable : null이 될 수 없다
  null : 아무런 값이 없다
    String name = "";   // non-nullable
    String? name = "";    // nullable

    print(name!);   // non-nullable null이 아님을 확신을 줌

  [final-const]
  final은 맨 앞에 작성, final을 넣게 되면 다른 값을 넣을 수 없다, 변경 불가
    final String name = "cave";

  const: const도 final과 마찬가지로 값을 변경할 수 없다
    final과 const는 데이터 타입을 생략할 수 있다.
    const는 build하는 동안에 값을 알고 있어야 한다. build가 되기도 전에 값을 인지해야함
    final은 compile하는 순간에 알아야 하는 값이다.

  [operator]
  +, -, *, /, %(나머지)
  ++, --
  A += 1, B -= 5
    null>
      double? number = 4.0;
      number = 2.0;
      number = null;

      number ??= 3.0;   // number가 null이면 우측 값을 대입하라
    비교>
      int number1 = 1, int number2 = 2
      print(number >numger2)

  타입 확인(is)
  nubmer1 is int

  논리
    and : &&
    or : ||

  리스트(List) : 여러개의 값을 저장하는 것
  <> : Generic
    길이(.length)
    추가(.add)
    제거(.remove)
    인덱스(.indexOf(값))

      index를 알고 싶은 경우 list[0];  // 첫 번째 리스트의 값
        .indexOf(값;
        List<String> list = [];
          list.add('jenny');
            list
              ..add('jisu')
              ..add('rose');

    값이 있으면 정상적으로 인덱스 값을 가져오지만, 없으면 '-1'을 반환한다.

  맵(Map) : key, value
    Map<String, String> dictionary = {'test1':'value1', 'test2':'value2'};

    추가(.addAll)
      dictionary.addAll({'test3':'value3', 'test4':'value4'});
      dictionary['test5'] = 'value5';

    삭제(.remove)
      dictionary.remove(키 값);
    키 값 부르기(.keys)
    값만 부르기(.values)

  Set : List처럼 하나의 값만 저장(중복되지 않음)
    final Set<String> names = {'test1', 'test2', 'test3', 'test2'}  // test2는 하나만 출력됨

    존재여부 확인(.contains(값))

*/

/*
문법정리
  if문
    if하고 괄호를 쳐주어야 함 : if (조건) { } else { }
    여러 조건일 경우 : if (조건) { } else if (조건) { } else { }

  switch문
    switch(조건) {
      case 0:  실행문1  break;
      case 1: 실행문2 break;
      default: 실행문3 break;
    }

  [loop]
    for문
      for (int i = 0; i < 10; i++) {
        // 초기 i 0값 부터 10까지 1씩 증가
      }

        int total = 0;

        List<int> numbers = [1, 2, 3, 4, 5];
        for (int i in numbers) {
          total += i;
        }

        for (int i = numbers.first; i <= numbers.last; i++) {
          total += i;
        }

        // index형식
        for (int i=0; i < numbers.length; i++ ) {
          total += numbers[i];
        }
          -> 실행문에서 'break'를 사용하여 멈출 수 있다


    while문
      while(조건문) { }    // 무한 궤도에 빠지지 않도록 설정해주는 것이 중요하다
      do { } while(조건문) // do 바로 뒤에 한 번은 꼭 실행해주고 while조건문을 확인하는 것
        -> 실행문에서 'break'를 사용하여 멈출 수 있다.

    break : 종료시킴
    continue : loop로 돌아감


  enum : 그 자체의 타입이 만들어지는 것, 오타를 방지시킬 수 있음
*/

/*
함수
  positional parameter : 순서가 중요한
  optional parameter  : 있어도되고 없어도 되는 선택적 파라메터
    꼭 있어야하는 파라메터 없는 파라메터
    [] : 대괄호 안에 있는 것은 있어도 되고, 없어도 되는 파라메터
    convert(int x, [int y, int z]) {

    }

    위의 함수는 문제가 생기니까
    convert(int x, [int? y, int? z]) {}
      하지만 null인 경우 값을 더할 수 없으니 기본 값을 넣어주는 것이 좋다.

    convert(int x, [int y = 10, int z = 5]) { }

  named parameter : 이름이 있는 파라메터
    convert({}) ()괄호 안에 {}중괄호를 넣어 준다
     그리고 필수인 것은 required를 넣는다
     convert({
      required int x,
      required int y
     })

     사용시 convert(x: 10, y:22); 이런식으로 x, y파라메터 이름을 넣어서 사용할 수 있음

   named + optional parameter
    convert({
      required int x,
      required int y,
      int z     // z 에는 required를 하지 않고 사용한다
    })

    positional + named
      : {} named파라메터를 positional parameter뒤에 선언해주면 된다.
      convert(int x, {required int y, int z})

 void: 공허..
  void를 붙이고 말고 차이가 무엇이 있는 것인가..
  dart라고 뭔가 다른 것이 아니구나.. 있거나 말거나 상관 없다. 그냥 생략한 것 뿐이다.

  arrow : => 화살표를 사용해서 반환하는 것

  typedef : deligate같은 개념
    typedef Operation = double Function();
    signature라고 부른다
       typedef Operation = int Function(int x, int y, int z);
      // 더하기
      int add(int x, int y, int z) => x + y + z;

      // 빼기
      int subtract(int x, int y, int z) => x - y - z;

    Operation operation = add;    // 다른 함수를 끼웠다 뺏다 장착 시켜주는 느낌
    int result = operation(10, 20, 30);
    operation = subtract;

    int result1 = operation(10, 20, 30);

      // 요것이 완전한 시그니처
      int calculate(int x, int y, int z, Operation operation) {
        return operation(x, y, z);
      }

    int result3 = calculate(30, 40, 50, add);
*/

typedef Operation = int Function(int x, int y, int z);
// 더하기
int add(int x, int y, int z) => x + y + z;

// 빼기
int subtract(int x, int y, int z) => x - y - z;

int calculate(int x, int y, int z, Operation operation) {
  return operation(x, y, z);
}
