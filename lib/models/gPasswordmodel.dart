import 'package:intl/intl.dart';

class GPassword {
  late int id;
  late String password;
  String time;
  GPassword({this.id = 0, required this.password, required this.time});
  Map<String, Object?> toMap(int id) {
    return {'id': id, 'password': this.password, 'time': this.time};
  }

  get dateFormatter =>
      DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.parse(time));

  @override
  String toString() {
    return '$id $password $dateFormatter';
  }
}
