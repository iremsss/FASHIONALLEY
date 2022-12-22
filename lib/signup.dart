import 'package:fashion_alley/main.dart';
import 'package:fashion_alley/products/header.dart';
import 'package:fashion_alley/signup_auth.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: header('KAYIT OL', context),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: size.height * .7,
              width: size.width * .85,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black, blurRadius: 10, spreadRadius: 2)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                          controller: _nameController,
                          style: TextStyle(
                            color: kTextColor,
                          ),
                          cursorColor: kTextColor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: kTextColor,
                            ),
                            hintText: 'Kullanıcı Adı',
                            prefixText: ' ',
                            hintStyle: TextStyle(color: kTextColor),
                            focusColor: kTextColor,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: kTextColor,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: kTextColor,
                            )),
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                          controller: _emailController,
                          style: TextStyle(
                            color: kTextColor,
                          ),
                          cursorColor: kTextColor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail,
                              color: kTextColor,
                            ),
                            hintText: 'E-Mail',
                            prefixText: ' ',
                            hintStyle: TextStyle(color: kTextColor),
                            focusColor: kTextColor,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: kTextColor,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: kTextColor,
                            )),
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                          style: TextStyle(
                            color: kTextColor,
                          ),
                          cursorColor: kTextColor,
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: kTextColor,
                            ),
                            hintText: 'Parola',
                            prefixText: ' ',
                            hintStyle: TextStyle(color: kTextColor),
                            focusColor: kTextColor,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: kTextColor,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: kTextColor,
                            )),
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                          style: TextStyle(
                            color: kTextColor,
                          ),
                          cursorColor: kTextColor,
                          controller: _passwordAgainController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: kTextColor,
                            ),
                            hintText: 'Parola Tekrar',
                            prefixText: ' ',
                            hintStyle: TextStyle(color: kTextColor),
                            focusColor: kTextColor,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: kTextColor,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: kTextColor,
                            )),
                          )),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      InkWell(
                        onTap: () {
                          _authService
                              .createPerson(
                                  _nameController.text,
                                  _emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: kTextColor, width: 2),
                              //color: colorPrimaryShade,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                                child: Text(
                              "Kaydet",
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 20,
                              ),
                            )),
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
      ],
    ));
  }
}
