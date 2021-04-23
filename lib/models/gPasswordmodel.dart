class GPassword {
  late int id;
  late String password;
  String? time;
  GPassword({this.id = 0, required this.password, this.time}) {
    time = DateTime.now().toString();
  }
  Map<String, Object?> toMap(int id) {
    return {'id': id, 'password': this.password, 'time': this.time};
  }

  @override
  String toString() {
    return '$id $password $time';
  }
}
