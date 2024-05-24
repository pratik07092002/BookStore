import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookapp/contents/Texts/ChildText.dart';
import 'package:mybookapp/contents/images/imagetheme.dart';
import 'package:mybookapp/screens/createaccount/createacc.dart';
import 'package:mybookapp/screens/homepage/navbar/botomnav.dart';
import 'package:mybookapp/screens/loginscreen/bloc/loginscreen_bloc.dart';

import 'package:mybookapp/utils/mediaqueries.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}
LoginscreenBloc loginblc = LoginscreenBloc();
class _LoginPageScreenState extends State<LoginPageScreen> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginblc,
      child: Scaffold(
        body: BlocListener<LoginscreenBloc, LoginscreenState>(
          listener: (context, state) {
            if(state is LogingSuccessstate){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BotoomNav(userCredential: state.usercred , userMod: state.userMod,),));
            }else if(state is CreateAccountState){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
            }
          },
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenQuery.screenHeight(context) * 0.15,
                ),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green,
                              spreadRadius: 8,
                              blurRadius: 7)
                        ]),
                    child: CircleAvatar(
                      radius: ScreenQuery.screenHeight(context) * 0.08,
                      backgroundImage: const AssetImage(ImageTheme.appLogo),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenQuery.screenHeight(context) * .1,
                ),
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    prefixIconColor: Colors.green,
                    labelText: Introdata.EmailAdressInput,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                  ),
                ),
                SizedBox(
                  height: ScreenQuery.screenHeight(context) * 0.01,
                ),
                TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.green,
                    labelText: Introdata.PasswordInput,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(Introdata.ForgetPasswordText)),
                SizedBox(
                  height: ScreenQuery.screenHeight(context) * 0.02,
                ),
                Container(
                  width: ScreenQuery.screenWidth(context) * 0.4,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {
loginblc.add(LoginClickEvent(email: emailcontroller.text.trim() , password: passwordcontroller.text.trim()));

                      }, child: Text(Introdata.LoginText)),
                ),
                SizedBox(
                  height: ScreenQuery.screenHeight(context) * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {
                        loginblc.add(CreateAccountClickEvent());
                      }, child: Text(Introdata.CreateAccount)),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
