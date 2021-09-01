import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:labadaph2_mobile/login/login_signup_page.dart';

class Register1Page extends StatefulWidget {
  static const String routeName = '/register1';

  @override
  State<StatefulWidget> createState() => new _Register1PageState();
}

class _Register1PageState extends State<Register1Page> {
  final _formKey = new GlobalKey<FormState>();

  User? _currentUser;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    User? value = FirebaseAuth.instance.currentUser;
    if (value == null) {
      Navigator.pushReplacementNamed(context, LoginSignupPage.routeName);
    } else {
      _currentUser = value;
    }
  }

  Widget _showForm() {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/registration-bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomLeft,
        ),
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            SizedBox(height: 60),
            Center(
              child: Text(
                "Your Personal Details",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              decoration: new InputDecoration(
                  labelText: 'First Name', icon: Icon(Icons.person)),
              validator: (value) {
                if (value?.isEmpty ?? true)
                  return "First Name can\'t be empty.";
                else
                  return null;
              },
              controller: _firstNameController,
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: new InputDecoration(
                  labelText: 'Last Name', icon: Icon(Icons.person)),
              validator: (value) {
                if (value?.isEmpty ?? true)
                  return "Last Name can\'t be empty.";
                else
                  return null;
              },
              controller: _lastNameController,
            ),
            TextFormField(
              maxLines: 1,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                  labelText: 'Email', icon: Icon(Icons.email)),
              validator: (value) {
                if (value?.isEmpty ?? true)
                  return "Email can\'t be empty.";
                else {
                  // additional validation checks...
                }
                return null;
              },
              controller: _emailController,
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              child: Text('Continue', style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 19, 12, 0),
            child: Text(
              'Step 1 of 2',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
      body: Stack(children: <Widget>[
        _showForm(),
      ]),
    );
  }
}
