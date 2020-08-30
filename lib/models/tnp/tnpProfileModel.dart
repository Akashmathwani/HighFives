class TnpProfileModel {
  int tnpId;
  bool isAdmin;
  Map<String, dynamic> personal;
  List<dynamic> tnp;

  TnpProfileModel({
    this.tnpId,
    this.isAdmin,
    this.personal,
    this.tnp,
  });

  factory TnpProfileModel.fromMap(Map<String, dynamic> profile) {
    print('PROFILE');
    return new TnpProfileModel(
        tnpId: profile["tnpId"],
        isAdmin: profile["isAdmin"],
        personal: PersonalInfo.fromMap(profile["personal"]).toMap(),
        tnp: profile["tnp"]);
  }

  Map<String, dynamic> toMap() => {
        "tnpId": this.tnpId,
        "isAdmin": this.isAdmin,
        "personal": this.personal,
        "tnp": this.tnp
      };
}

class PersonalInfo {
  String firstName;
  String lastName;
  String email;
  String phone;
  String profilePicture;
  String position;

  PersonalInfo(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.profilePicture,
      this.position});
  factory PersonalInfo.fromMap(Map<String, dynamic> info) {
    if (info == null) return new PersonalInfo();
    return new PersonalInfo(
      firstName: info["firstname"],
      lastName: info["lastname"],
      email: info["email"],
      phone: info["phone"],
      profilePicture: info["profilePicture"],
      position: info["position"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "firstName": this.firstName,
      "lastName": this.lastName,
      "email": this.email,
      "phone": this.phone,
      "profilePicture": this.profilePicture,
      "position": this.position
    };
  }
}
