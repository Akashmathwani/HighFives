import 'package:flutter/material.dart';
import 'package:highfives_ui/screens/home_page/main.dart';

//TODO REMOVE THIS:: THIS IS ONLY FOR TESTING IDENTITY LOGIC
// WE SHOULD MAKE FUNCTIONS FRO DIFFERENT COMPONENTS> NOT MAKING IN THIS AS DEMO

class DemoLogin extends StatefulWidget {
  @override
  _DemoLoginState createState() => _DemoLoginState();
}

class _DemoLoginState extends State<DemoLogin> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white54,
        child: Center(
          child: Container(
            width: size.width * 0.42,
            height: size.height * 0.42,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return 'Please Enter Email';
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                        cursorColor: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Password',
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty || value.length < 6)
                            return 'Enter Password greater then 6 characters';
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                        cursorColor: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: 'LoginSucess',
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                              )
                            ],
                          ),
                          child: InkWell(
                            splashColor: Colors.black,
                            child: FlatButton(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                      fontSize: 20),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder:
                                          (BuildContext context, _, _p) {
                                    return MainHome();
                                  }));
                                }
                                _formKey.currentState.save();
                                print(_email + 'email');
                                print(_password + 'pwd');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
