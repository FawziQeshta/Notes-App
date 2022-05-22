class UserNote {
  String id = '';
  String uid = '';
  String fName = '';
  String lName = '';
  String fullName = '';
  String email = '';
  String phone = '';
  String password = '';

  UserNote(this.id, this.uid, this.fullName, this.fName, this.lName, this.email, this.phone, this.password);
  UserNote.empty();

  UserNote fromMap(id, Map<String, dynamic> map) {
    uid = map['uid'];
    fullName = map['first_name'] + " " + map['last_name'];
    fName = map['first_name'];
    lName = map['last_name'];
    email = map['email'];
    phone = map['phone'];
    password = map['password'];

    return UserNote(id, uid, fullName, fName, lName, email, phone, password);
  }
}
