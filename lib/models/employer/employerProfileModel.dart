class EmployerProfileModel {
  Map<String, dynamic> company;
  int employerId;
  List<dynamic> jobDescriptions;
  Map<String, dynamic> personal;

  EmployerProfileModel({
    this.company,
    this.employerId,
    this.jobDescriptions,
    this.personal,
  });

  factory EmployerProfileModel.fromMap(Map<String, dynamic> profile) {
    return new EmployerProfileModel(
        company: profile["company"],
        employerId: profile["employerId"],
        jobDescriptions: profile["jobDescriptions"],
        personal: PersonalInfo.fromMap(profile["personal"]).toMap());
  }

  Map<String, dynamic> toMap() => {
        "employerId": this.employerId,
        "personal": this.personal,
        "company": this.company,
        "jobDescriptions": this.jobDescriptions
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
