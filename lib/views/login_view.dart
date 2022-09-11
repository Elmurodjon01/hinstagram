import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}
String? _email;
String? _password;
final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
class _LoginViewState extends State<LoginView> {
  double? _deviceHeight, _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                titleText(),
                _loginForm(),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _loginForm (){
    return Container(
      height: _deviceHeight! * 0.20,
      child: Form(
        key: _loginKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            emailTextField(),
            passwordTextField(),
          ],
        ),
      ),
    );
  }


  Widget titleText(){
    return const Text('Hinstagram', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),);
  }

  Widget emailTextField(){
    return TextFormField(
      decoration:const InputDecoration(
        hintText: 'Email',
      ),
      onSaved: (_value){
        setState(() {
          _email = _value;
        });
      },
      validator: (_value) {
        bool _result = _value!.contains(
          RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
        );
        return _result ? null : "Please enter a valid email";
      },
    );
  }
  Widget passwordTextField(){
    return TextFormField(
      obscureText: true,
      decoration:const InputDecoration(
        hintText: 'Password',
      ),
      onSaved: (_value){
        setState(() {
          _password = _value;
        });
      },
      validator: (_value) =>
         _value!.length > 6 ? null : "Please enter a password greater than 6 characters.",

    );
  }



  Widget _loginButton(){
    return MaterialButton(
      onPressed: (){},
      minWidth: _deviceWidth! * 0.70,
      height: _deviceHeight! * 0.06,
      color: Colors.red,
      child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25,),),
    );
  }
}
