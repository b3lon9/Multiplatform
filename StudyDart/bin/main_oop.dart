main () {

}

/*
class로 만든 것이 instance
  constructor(생성자)로 파라메터를 받는 방법
    클래스 이름과 동일하게 하고 괄호 열고 닫고 하면 생성자

    class Idol {
      String name;
      List<String> members;

      // postional
      // this는 현재 클래스의 값을 가져오는 것
      Idol(String name, List<String> members):
            this.name = name,
            this.members = members;

      void sayHello() {
        print('hello~');
      }

      void introduce() {
        print('let me introduce my members~');
      }
    }

    생성자는 더욱 간결하게 생성할 수 있게 되었다.
    Idol(this.name, this.members);

    named constructor - named parameter와 비슷함
      기본 constructor > Idol(this.name, this.members);
      named Idol.fromList(List values):
        this.members = values[0],
        this.name = values[1];

    immutable 변경할 수 없도록 함
      처음 선언한 값이 바뀔 수 없도록 (private한?) final 키워드를 넣음

    생성자 constructor앞에 const를 붙여주게 되면
    한 번 선언시 바뀔 수 없고, build전 값을 알 수 있게 해줌  -> const값만 넣을 수 있음, 변동이 될 수 있는 건 넣을 수 없다. **
    const Idol();

      원래는 instance가 내용이 같아도 서로 같지 않은데
      const로 선언하면 같은 인스턴스가 된다.

        Idol blackPink = const Idol('blackpink', ['jisu', 'jenny', 'risa', 'rose']);
        Idol blackPink2 = const Idol('blackpink', ['jisu', 'jenny', 'risa', 'rose']);
        print(blackPink == blackPink2);   // true

        Idol blackPink = const Idol('blackpink', ['jisu', 'jenny', 'risa', 'rose']);
        Idol blackPink2 = const Idol('blackpink', ['jisuasdfasdf', 'jenny', 'risa', 'rose']);
        print(blackPink == blackPink2);   // false

      내부 내용이 같아야 동일한 인스턴스로 보는 것 같다...?


  [getter - setter]
    String get firstMember {  // 타입을 명시하지 않으면 dynamic타입으로 반환됨
      return this.members.first;
    }
      String getMember() {
        return this.members.first;
      }
      위와 동일한데 왜 'get'을 사용하느냐? 기능적인 차이는 없지만,
      뉘앙스의 차이가 있다.. 데이터를 가공하고 싶은 경우에 사용한다.
      위의 함수 형태는 로직이 들어가는 경우에 사용..

      // setter - 무조건 하나의 파라메터만 받을 수 있음
      // blackPink.firstMember = 'hohoh';
      set firstMember(String name) {
        this.members[0] = name;
      }

  *** private 변수
    class를 private하고 싶은 경우 '언더 스코어'를 붙인다
    class Idol -> (private) -> class _Idol
    무엇이든 앞에 '언더바'를 붙이면 private이 된다.


  inheritance 상속 : extends를 사용하여 상속을 받는다.
    상속을 하게되면 자식클래스는 부모클래스도 될 수 있다.
    하지만 부모는 자식이 될 수 없다.
    class Idol {
      // 이름
      String name;
      // 멤버 수
      int membersCount;

      Idol({
          required this.name,
          required this.membersCount
       });

        void sayName() {
          print("I'm ${this.name}");
        }

        void sayMembersCount() {
          print("My member count:${this.membersCount}");
        }
      }

      class BoyGroup extends Idol {
        // 부모클래스를 지칭하는 키워드를 알아야 함
        // 외부에서 받은 값을 전달해주는 것
        BoyGroup(String name, int membersCount): super(name: name, membersCount: membersCount);

        void sayMale() {
          print("I'm \"man");
        }
      }

      class GirlGroup extends Idol {
        GirlGroup(String name, int membersCount): super(membersCount: membersCount, name: name);

      }

  method overriding
    method란..?(function) : 클래스 내부에 있는 함수를 method라고 부른다
    override : 덮어쓰다.. 우선시하다..
      상속한 클래스의 메서드를 재정의 하는것

      @override
      class TimesTwo {
      final int number;

      TimesTwo(this.number);

      int calculate() {
        return this.number * 2;
      }
    }

    class TimesFour extends TimesTwo {
      TimesFour(int number): super(number);

      @override
      int calculate() {
        return super.number * 4;
      }
    }

      TimesTwo tt = TimesTwo(2);
      print(tt.calculate());

      TimesFour ff = TimesFour(2);
      print(ff.calculate());

      TimesTwo tf = TimesFour(2);
      print(tf.calculate());
      print(tf.runtimeType);  // TimesFour

  [static] : 인스턴스에 귀속하는 것이 아니라 클래스에 귀속된다.
    클래스에 바로 direct로 사용할 수 있음

    class Employee {
    // 알바생이 일하고 있는 건물
    static String? building;  // nullable,

    // 알바생의 이름
    final String name;

    Employee(this.name);

    void printNameAndBuild() {
      print("my name is $name, I work in ${building}'s Building");
    }

    static void printBuilding() {
      print("I work in ${building}'s Building");
    }
  }
main () {
  Employee seulgi = new Employee('seulgi');
  Employee chorong = new Employee('chorong');
  seulgi.printNameAndBuild();
  chorong.printNameAndBuild();

  // seulgi.name = 'code factory';
  Employee.building = 'o2 tower';
  seulgi.printNameAndBuild();
  chorong.printNameAndBuild();
}

my name is seulgi, I work in null's Building
my name is chorong, I work in null's Building
my name is seulgi, I work in o2 tower's Building
my name is chorong, I work in o2 tower's Building


  [interface] ... interface가 있어야지... 이것이 꽃이다..
    dart언어는 똑같이 class를 사용해서 선언한다
    interface라는 타입명을 붙이지 않고 class를 사용한다는 말

    사용하고 싶은 경우엔 'implements'를 사용해서 사용한다.

    그럼 인터페이스로 만든 클래스를 누군가 사용하지 못하도록 하려면 abstract를 붙여준다


  모든 클래스는 extends Object() 라고 되어 있다.
*/

class IdolInterface {
  String name;

  IdolInterface(this.name);
  void sayName() {}
}

class BoyGroup implements IdolInterface {
  String name;

  BoyGroup(this.name);

  @override
  void sayName() {

  }
}