void main() async {
  Student lan = Student(11, "Mai", "21/09/1999", 0334754125, 5, 9, 2);

  print(lan.getInfomationStudent());
  print(lan.mediumPoint());
  print(lan.Ratings());
  //B3
  List<dynamic> ageList = [1, 3, 5, 8, 4, 20, 25, 26, -30, 15.5, 40, 65];
  for (int i = 0; i < ageList.length; i++) {
    dynamic n = ageList[i];
    try {
      if (n.isNegative)
        throw Exception("Exception");
      else if (ageList[i] is double) throw Exception("Exception");
    } catch (e) {
      print("Exception ${ageList[i]}");
    }
  }

  Information data = await Information("Linh", 23, "HN");
  var name = await data.getName();
  print(name);

  var addres = await data.getAddress();
  print(addres);

  var age = await data.getAge();
  print(age);

  Stream<int> secondNumberStream = makeNumberStream(maxNumber: 100);
  getNumberFromStream(secondNumberStream);
}

//B4

class Information {
  String? name;
  int? age;
  String? address;

  Information(this.name, this.age, this.address);

  Future<String?> getName() async {
    await Future.delayed(const Duration(seconds: 3));
    return name;
  }

  Future<String?> getAddress() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    return address;
  }

  Future<int?> getAge() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    return age;
  }
}

//B2
class Student {
  int? code;
  String? name;
  String? _birthday;
  int? _phoneNumber;
  int? _mathScores;
  int? _writingPoint;
  int? _englishPoint;

  Student(this.code, this.name, this._birthday, this._phoneNumber,
      this._mathScores, this._writingPoint, this._englishPoint);

  String getInfomationStudent() {
    return ("$code - $name - $_birthday - $_phoneNumber - $_mathScores - $_writingPoint - $_englishPoint");
  }

  double mediumPoint() {
    return (this._mathScores! + this._writingPoint! + this._englishPoint!) / 3;
  }

  Ratings() {
    double mp = mediumPoint();
    if (mp >= 8.0)
      print("Xếp loại giỏi");
    else if (8.0 >= mp && 6.5 <= mp)
      print("Xếp loại Khá");
    else if (5.0 <= mp && mp <= 6.5)
      print("Xếp loại Trung bình");
    else
      print("Xếp loại kém");
  }
}

Stream<int> numberStream =
    Stream<int>.periodic(Duration(seconds: 3), makeNumberUp);
int makeNumberUp(int value) => value + 1;

Stream<int> makeNumberStream({required int maxNumber}) async* {
  for (int i = 1; i <= maxNumber; i++) {
    yield i;
  }
}

void getNumberFromStream(Stream<int> numberStream) async {
  await for (int number in numberStream) {
    if (number % 3 == 0) print("Cac so chia het cho 3 la: $number");
  }
}
