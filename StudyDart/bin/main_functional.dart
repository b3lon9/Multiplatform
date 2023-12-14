void main() {
  final List<Map<String, String>> people = [
    {'name':'지수', 'group':'블랙핑크'},
    {'name':'로제', 'group':'블랙핑크'},
    {'name':'로사', 'group':'블랙핑크'},
    {'name':'RM', 'group':'BTS'},
    {'name':'영웅재중', 'group':'동방신기'},
  ];

  // people class형태로 만들려면?
  final parsedPeople = people.map(
      (member) => Person(name: member['name']!, group: member['group']!) // !을 주어서 확신을 주어야 함
  ).toList();

  print(parsedPeople);

  final bts = parsedPeople.where((element) => element.group == 'BTS');
  print(bts);
}

class Person {
  final String name;
  final String group;

  Person({
   required this.name,
   required this.group
  });

  // print했을시 Instance of로 인스턴스 이름으로 표출될 경우
  @override
  String toString() {
    return 'Person(name:$name, group:$group)';
  }
}


/*
  List
    .asMap() -> Map
    .toSet() -> Set

    interable형태..괄호로 되어있음  >> .toList() -> List

    .map() : map은 내부 값을 전부 바꿔주는 것
      형태를 완전히 변경해주는 것

  List<String> blackPink = ['로제', '지수', '리사', '제니'];

  var result = blackPink.map((member) {
    return 'blackpink ' + member;
  });

  print(result);
  final result2 = blackPink.map((member) => '블랙핑크 $member');  // map을 사용하면 새로운 리스트를 반환해주는 것
    (blackpink 로제, blackpink 지수, blackpink 리사, blackpink 제니)

  // [1.jpg, 3.jpg, 5.jpg.. 이렇게 바꾸고 싶은 경우]
  String number = "13578";
  final parse = number.split('');
  print(parse); //[1, 3, 5, 7, 8]

  final parseJpg = parse.map((number) => number + '.jpg').toList();
  print(parseJpg);  // [1.jpg, 3.jpg, 5.jpg, 7.jpg, 8.jpg]


  MapEntry : Map to Map ~
  Map을 Mapping하려면 MapEntry() 함수를 사용한다
    Map<String, String> harryPorter = {
      'Harry Potter': '해리포터',
      'Ron Weasley' : '론 위즐리',
      'Herimione Granger' : '헤르미온느 그레인저'
    };

    print(harryPorter);
    // {Harry Potter: 해리포터, Ron Weasley: 론 위즐리, Herimione Granger: 헤르미온느 그레인저}

    // Map을 Mapping하는 경우
    // 다시 Map으로 변환하려면 MapEntry를 사용
    final result = harryPorter.map((key, value) => MapEntry('kkk $key', 'vvv $value'));
    print(result);
    // {kkk Harry Potter: vvv 해리포터, kkk Ron Weasley: vvv 론 위즐리, kkk Herimione Granger: vvv 헤르미온느 그레인저}


  Set에서 Mapping하는 경우
      Set blackPink = {
        '로제', '지수', '제니', '리사'
      };

      print(blackPink);

      final resultSet = blackPink.map((member) => '블랙핑크 $member').toSet();
      print(resultSet);
      print(resultSet.runtimeType);


  List에 where를 사용하면, 내부를 루핑해준다.
  list.where((element) => element['something'] == 'red').toList();
      List<Map<String, String>> people = [
        {
          'name':'로제', 'group':'블랙핑크'
        },
        {
          'name':'RM', 'group':'BTS'
        },
        {
          'name':'지수', 'group':'블랙핑크'
        },
        {
          'name':'다다호', 'group':'콜로로'
        },
      ];

      print(people);

      // group이 블랙핑크로 일치하는 값만 남음
      final result = people.where((element) => element['group'] == '블랙핑크').toList();
      print(result);


  [reduce]
    return해주는 것이 다음 prev값으로 반환 된다.
      List<int> numbers = [1,3,5,7,9];

      final result = numbers.reduce((prev, next) {
        print('----------------');
        print('prev:$prev');
        print('next:$next');

        return prev + next;
      });

      print(result);

----------------
prev:1
next:3
----------------
prev:4
next:5
----------------
prev:9
next:7
----------------
prev:16
next:9
25


    List<String> words = [
      'Hello',
      'World',
      'Im',
      'Neander'
    ];

    final resultWords = words.reduce((value, element) => value + element);
    print(resultWords);
    // HelloWorldImNeander

    반환되는 return값이 다음 값의 타입과 동일해야 한다.



  [fold] : reduce의 return타입이 동일해야 하는 문제를 해결함
    list.fold() : 두 가지 값을 받는다  (초기값:시작할 값, (prev, next) => prev + next);
    그리고 받아야할 타입을 명시해준다.
    final sum = numbers.fold<int>(0, (prev, next) => prev + next);

    reduce는 리스트의 시작 값으로 시작하지만, fold는 지정해준 초기값으로 시작한다.
      약간 do~while과 비슷한 느낌이 있네

  List<String> words = [
    'Hello',
    'World',
    'Im',
    'Neander'
  ];

  final resultWords = words.reduce((value, element) => value + element);
  print(resultWords);

  final resultFold = words.fold(0, (previousValue, element) {
    print('------------');
    print('previousValue:$previousValue');
    print('element:$element');
    return previousValue + element.length;
  });

  print(resultFold);

HelloWorldImNeander
------------
previousValue:0
element:Hello
------------
previousValue:5
element:World
------------
previousValue:10
element:Im
------------
previousValue:12
element:Neander
19

Process finished with exit code 0


  [cascade] : 여러개의 리스트를 하나로 합칠 때 사용하는 것
  '...' 점 3개를 넣으면 리스트가 풀어짐
  List<int> even = [2,4,6,8];
  List<int> odd = [1,3,5,7];

  // cascading operator
  print([even, odd]); // [[2, 4, 6, 8], [1, 3, 5, 7]]
  print([...even, ...odd]); // [2, 4, 6, 8, 1, 3, 5, 7]


  [Map을 class형태로 받기] 약간 Json포맷 같은 느낌이다.
  final List<Map<String, String>> people = [
    {'name':'지수', 'group':'블랙핑크'},
    {'name':'로제', 'group':'블랙핑크'},
    {'name':'로사', 'group':'블랙핑크'},
    {'name':'RM', 'group':'BTS'},
    {'name':'영웅재중', 'group':'동방신기'},
  ];

  // people class형태로 만들려면?
  final parsedPeople = people.map(
      (member) => Person(name: member['name']!, group: member['group']!) // !을 주어서 확신을 주어야 함
  ).toList();

  print(parsedPeople);    // [Instance of 'Person', Instance of 'Person', Instance of 'Person', Instance of 'Person', Instance of 'Person']

}

class Person {
  final String name;
  final String group;

  Person({
   required this.name,
   required this.group
  });


  print했을 때 Instnace of형태로 표출되지 않고, 원하는 값으로 표출되도록 하려면
  toString()함수를 재정의(override)해주어야 한다.

  // print했을시 Instance of로 인스턴스 이름으로 표출될 경우
  @override
  String toString() {
    return 'Person(name:$name, group:$group)';
  }
  [Person(name:지수, group:블랙핑크), Person(name:로제, group:블랙핑크), Person(name:로사, group:블랙핑크), Person(name:RM, group:BTS), Person(name:영웅재중, group:동방신기)]

*/