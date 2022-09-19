import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hinstagram/views/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  double? _deviceHeight, _deviceWidth;
  String? _name, _password, _email;
  File? image;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05,),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                titleText(),
                _profileImagePic(),
                _registrationForm(),
                registerButton(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget titleText(){
    return const Text('Hinstagram', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),);
  }

  Widget registerButton(){
    return MaterialButton(
      onPressed:_registerUser,
      minWidth: _deviceWidth! * 0.50,
      height: _deviceHeight! * 0.05,
      color: Colors.red,
      child: const Text('Register',
      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400,
      ),),
    );
  }

  Widget _registrationForm (){
    return Container(
      height: _deviceHeight! * 0.30,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
            emailTextField(),
            passwordTextField(),
          ],
        ),
      ),
    );
  }
  Widget _nameTextField(){
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Name',
      ),
      validator: (_value) => _value!.isNotEmpty ? null : 'Please enter valid name!',
      onSaved: (_value){
        setState(() {
          _name = _value;
        });
      },
    );
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
  Widget _profileImagePic(){
    var imageProvider = image != null ? FileImage(image!) : const NetworkImage('https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png');
    return GestureDetector(
      onTap: (){
        FilePicker.platform.pickFiles(type: FileType.image).then((_result) {
          setState(() {
            image = File(_result!.files.first.path!);
          });
        }
      );
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider as ImageProvider,
          ),
        ),
      ),
    );
  }

  void _registerUser(){
    if(_registerFormKey.currentState!.validate() && image != null){
      _registerFormKey.currentState!.save();
      print('valid');
    }
  }
}
