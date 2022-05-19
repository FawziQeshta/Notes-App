class UserNote {
  String uid = '';
  String name = '';
  String email = '';
  String phone = '';
  String password = '';

  UserNote(this.uid, this.name, this.email, this.phone, this.password);
  UserNote.empty();

  UserNote fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['first_name'] + " " + map['last_name'];
    email = map['email'];
    phone = map['phone'];
    password = map['password'];

    return UserNote(uid, name, email, phone, password);
  }
}
