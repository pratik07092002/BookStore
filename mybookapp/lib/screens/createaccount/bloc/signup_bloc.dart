import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mybookapp/screens/createaccount/usermodel/usermod.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<SignupButtonClickEvent>(_createacc);
  }
Future<void> _createacc(SignupButtonClickEvent event, Emitter<SignupState> emit) async {
  emit(SignupLoadingState());

  if (event.Lname.isEmpty && event.fname.isEmpty) {
    emit(Signupfailstate(Error: "Please Enter User name"));
  } else if (event.CPassword != event.password) { // Corrected logic
    emit(Signupfailstate(Error: "Passwords did not match"));
  } else {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      String uname = "${event.fname} ${event.Lname}";
      String userId = userCredential.user!.uid;

      UserModel userModel = UserModel(
        UserId: userId,
        ProfilePicture: "",
        name: uname,
        email: event.email,
        phonenumber: event.Phonenum,
      );
      await FirebaseFirestore.instance.collection("Users").doc(userId).set(userModel.toMap());

      emit(SignupSuccessstate(usercred: userCredential, usermod: userModel));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.code.toString());
      emit(Signupfailstate(Error: e.code));
    }
  }
}

  }
