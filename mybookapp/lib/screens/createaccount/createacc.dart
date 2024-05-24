import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookapp/contents/Texts/ChildText.dart';
import 'package:mybookapp/contents/images/imagetheme.dart';
import 'package:mybookapp/screens/createaccount/bloc/signup_bloc.dart';
import 'package:mybookapp/screens/homepage/navbar/botomnav.dart';
import 'package:mybookapp/utils/mediaqueries.dart';
import 'package:mybookapp/widgets/TextFormField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

SignupBloc signupblc = SignupBloc();

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController phcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signupblc,
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if(state is SignupSuccessstate){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BotoomNav( userCredential:  state.usercred , userMod:  state.usermod),) );
          }else if(state is SignupLoadingState){
             Center(child: CircularProgressIndicator(),);
          }
        },
        child: Scaffold(
          body: Form(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: ScreenQuery.screenHeight(context) * 0.15),
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              spreadRadius: 8,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: ScreenQuery.screenHeight(context) * 0.08,
                          backgroundImage: AssetImage(ImageTheme.appLogo),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenQuery.screenHeight(context) * 0.1),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextForm(
                            hinttext: "First name",
                            prefixicon: Icon(Icons.people),
                            obscure: false,
                            controller: fnamecontroller,
                          ),
                        ),
                        SizedBox(
                            width: ScreenQuery.screenWidth(context) * 0.01),
                        Expanded(
                          child: CustomTextForm(
                            hinttext: "Last name",
                            prefixicon: Icon(Icons.people),
                            obscure: false,
                            controller: lnamecontroller,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenQuery.screenHeight(context) * 0.01),
                    CustomTextForm(
                      hinttext: Introdata.Phonenumber,
                      prefixicon: Icon(Icons.phone),
                      obscure: false,
                      controller: phcontroller,
                    ),
                    SizedBox(height: ScreenQuery.screenHeight(context) * 0.01),
                    CustomTextForm(
                      hinttext: Introdata.EmailAdressInput,
                      prefixicon: Icon(Icons.email),
                      obscure: false,
                      controller: emailcontroller,
                    ),
                    SizedBox(height: ScreenQuery.screenHeight(context) * 0.01),
                    CustomTextForm(
                      hinttext: Introdata.PasswordInput,
                      prefixicon: Icon(Icons.password),
                      obscure: true,
                      controller: password,
                    ),
                    SizedBox(height: ScreenQuery.screenHeight(context) * 0.01),
                    CustomTextForm(
                      hinttext: Introdata.ConfirmPassword,
                      prefixicon: Icon(Icons.password),
                      obscure: true,
                      controller: cpassword,
                    ),
                    SizedBox(height: ScreenQuery.screenHeight(context) * 0.02),
                    Container(
                      width: ScreenQuery.screenWidth(context) * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1),
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          signupblc.add(SignupButtonClickEvent(fname: fnamecontroller.text.trim(),
                           Lname: lnamecontroller.text.trim() , 
                            Phonenum: phcontroller.text.trim(),
                             password: password.text.trim(), 
                             email: emailcontroller.text.trim() , 
                             CPassword : cpassword.text.trim() ));
                        },
                        child: Text(Introdata.SignupPageCreateAccount),
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
