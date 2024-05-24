import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookapp/contents/Texts/ChildText.dart';
import 'package:mybookapp/contents/images/imagetheme.dart';
import 'package:mybookapp/main.dart';
import 'package:mybookapp/screens/loginscreen/loginscreen.dart';

import 'package:mybookapp/screens/onboarding/bloc/boarding_bloc.dart';
 // Import your LoginScreen

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => boardingBloc,
      child: Scaffold(
        body: BlocListener< BoardingBloc , BoardingState>(
          listener: (context, state) {
            if (state is LoginState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPageScreen()),
              );
            }
          },
          child: Stack(
            children: [
              PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 2) {
                    return ScreenBoardings(
                      desc: Introdata.ThirdPageDescText,
                      image: ImageTheme.third_auth,
                      title: Introdata.ThirdPageTitleText,
                      showButton: true,
                    );
                  } else {
                    return ScreenBoardings(
                      image: index == 0
                          ? ImageTheme.Intro_auth
                          : ImageTheme.second_auth,
                      title: index == 0
                          ? Introdata.firstPageTitleText
                          : Introdata.SecondPageTitleText,
                      desc: index == 0
                          ? Introdata.firstPageDescText
                          : Introdata.SecondPageDescText,
                      showButton: false,
                    );
                  }
                },
              ),
              Positioned(
                top: kToolbarHeight,
                right: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: TextButton(
                    onPressed: () {
                     boardingBloc.add(SkipButtonClickEvent());
                    },
                    child: Text("Skip"),
                  ),
                ),
              ),
              Positioned(
                bottom: kBottomNavigationBarHeight,
                right: 2,
                child: IconButton(
                  onPressed: () {
                    
                  },
                  icon: Icon(Icons.arrow_right_sharp, size: 30, color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenBoardings extends StatelessWidget {
  final String image, title, desc;
  final bool showButton;
  const ScreenBoardings({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.showButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          image: AssetImage(image),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(style: BorderStyle.solid, color: Colors.green, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(desc, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
