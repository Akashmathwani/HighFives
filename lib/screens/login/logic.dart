import 'package:flutter/material.dart';
import 'package:highfives_ui/resources/Identity/main.dart';
import 'package:highfives_ui/screens/home_page/main.dart';
import 'package:highfives_ui/utils/platform.dart';

class LoginLogic extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  //TODO CORRECT ?
  final _identityResource = IdentityResource(findPlatform());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Email', style: Theme.of(context).textTheme.headline4),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FractionallySizedBox(
              widthFactor: 0.67,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.3),
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 0.83),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value.isEmpty) return 'Please Enter Email !';
                        return null;
                      },
                      onSaved: (value) {
                        _email = value;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Text('Password', style: Theme.of(context).textTheme.headline4),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FractionallySizedBox(
              widthFactor: 0.67,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.3),
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 0.83),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value.isEmpty || value.length <= 6)
                          return 'Password too short!';
                        return null;
                      },
                      onSaved: (value) {
                        _password = value;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 130,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FlatButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(_email + 'email');
                    print(_password + 'pwd');
                    var res = await this._attemptLogin(_email, _password);
                    print(res);
                    if (res != null && res) {
                      _formKey.currentState.reset();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainHome()));
                    }
                  }
                },
                child:
                    Text('Login', style: Theme.of(context).textTheme.headline5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _attemptSignUp(String email, String password) async {
    return await _identityResource.signUp(email, password, 'tnp');
  }

  Future<dynamic> _attemptLogin(String email, String password) async {
    return await _identityResource.login(email, password, 'tnp');
  }
}
