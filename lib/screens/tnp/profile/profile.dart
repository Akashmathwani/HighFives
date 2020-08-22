import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/defaults.dart';
import 'package:highfives_ui/constants/const/sideMenuItems.dart';
import 'package:highfives_ui/models/tnp/tnpProfileModel.dart';
import 'package:highfives_ui/resources/profile/profile.dart';
import 'dart:convert';

//Its a Scrollable View with many sections like basic profile
// About College Description and location

class TnpProfile extends StatelessWidget {
  Profile _profile;

  get profile {
    if (this._profile == null) return new Profile();
    return _profile;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTnpProfile(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          print('PROFILEDATA ${snapshot.data}');

          return BuildTnpProfile(snapshot.data);
        } else if (snapshot.hasError) {
          return Container(
            width: 100,
            height: 100,
            color: Colors.red,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<dynamic> getTnpProfile() {
    return profile.getProfile('tnp');
  }
}

class BuildTnpProfile extends StatelessWidget {
  final _profileData;
  BuildTnpProfile(this._profileData);
  TnpProfileModel _tnpProfileModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _tnpProfileModel = TnpProfileModel.fromMap(this._profileData);
    var _profileMap = _tnpProfileModel.toMap();
    var personalInfo = _profileMap["personal"];
    print('#1 $personalInfo');
    return Container(
      width: size.width,
      height: size.height,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          _buildProfileTextAndIcon(context),
          _buildBasicProfileSection(context, personalInfo),
        ],
      ),
    );
  }
}

Widget _buildProfileTextAndIcon(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return Container(
    width: size.width,
    color: Theme.of(context).accentColor.withOpacity(0.05),
    padding: EdgeInsets.all(20),
    height: 100,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.verified_user,
          size: 30,
          color: Theme.of(context).dividerColor,
        ),
        SizedBox(
          width: 40,
        ),
        Text(
          PROFILE,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ),
  );
}

Widget _buildBasicProfileSection(BuildContext context, dynamic personalInfo) {
  // final personalInfo = PersonalInfo.fromMap(_profileData["personal"]);
  print('#2 ${personalInfo["profilePicture"]}');
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
    padding: EdgeInsets.all(50),
    height: 600,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            _displayProfilePicture(personalInfo["profilePicture"]),
            SizedBox(
              height: 10,
            ),
            _editProfilePicture(context),
          ],
        ),
        _displayProfileData(context, personalInfo),
      ],
    ),
  );
}

Widget _displayProfilePicture(String profileImage) {
  if (profileImage == null) profileImage = DEFAULT_TNP_PROFILE_IMAGE;
  return Center(
    child: Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Image.network(
        profileImage,
        scale: 0.9,
      ),
    ),
  );
}

Widget _editProfilePicture(BuildContext context) {
  return Container(
    width: 300,
    height: 50,
    decoration: BoxDecoration(
      color: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(8.3),
    ),
    child: InkWell(
      child: Center(
        child: Text(
          'EDIT PROFILE',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    ),
  );
}

Widget _displayProfileData(BuildContext context, dynamic personalInfo) {
  print('ui ${personalInfo["firstName"]}');
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 30,
      ),
      Container(
        padding: EdgeInsets.all(7),
        color: Theme.of(context).accentColor.withOpacity(0.2),
        child: Text(
          'Name :',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      Container(
        padding: EdgeInsets.all(3),
        child: Text(
          personalInfo["firstName"] + " " + personalInfo["lastName"],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.all(7),
        color: Theme.of(context).accentColor.withOpacity(0.2),
        child: Text(
          'Email :',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      Container(
        padding: EdgeInsets.all(3),
        child: Text(
          personalInfo["email"],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.all(7),
        color: Theme.of(context).accentColor.withOpacity(0.2),
        child: Text(
          'Contact Number :',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      Container(
        padding: EdgeInsets.all(3),
        child: Text(
          personalInfo["phone"],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // Text(''),
      // Text(personalInfo["phone"]),
    ],
  );
}
