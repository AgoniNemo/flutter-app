class User {
  late String name;
  late int age;

  bool isEmpty() {
    return this.name.isEmpty && this.age.isNaN;
  }
}