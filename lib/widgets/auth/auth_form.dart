import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _isLogin = true;

  void _trySubmit() {
    final isValide = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValide) {
      _formKey.currentState.save();
      print(_userEmail);
      print(_userName);
      print(_userPassword);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  key: ValueKey("email"),
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid mail address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                  onSaved: (value) {
                    _userEmail = value;
                  },
                ),
                if(!_isLogin)
                TextFormField(
                  key: ValueKey("username"),
                  validator: (value) {
                    if (value.isEmpty || value.length < 3) {
                      return 'Please enter at least 3 characters ';
                    }
                    return null;
                  },
                  decoration: (InputDecoration(labelText: 'Username')),
                  onSaved: (value) {
                    _userName = value;
                  },
                ),
                TextFormField(
                  key: ValueKey("password"),
                  validator: (value) {
                    if (value.isEmpty || value.length < 3) {
                      return 'Password must be at least 3 characters long ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) {
                    _userPassword = value;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                RaisedButton(child: Text(_isLogin ? "Login" : "Signup"), onPressed: _trySubmit),
                FlatButton(
                    onPressed: (){
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: Text(_isLogin? "Create new compte" : "I already have an account")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}