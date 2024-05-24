import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mybookapp/screens/createaccount/usermodel/usermod.dart';

part 'loginscreen_event.dart';
part 'loginscreen_state.dart';

class LoginscreenBloc extends Bloc<LoginscreenEvent, LoginscreenState> {
  LoginscreenBloc() : super(LoginscreenState()) {
    on<LoginClickEvent>(_nextpage);
    on<CreateAccountClickEvent>(_createacc);
  }

  Future<void> _nextpage(LoginClickEvent event, Emitter<LoginscreenState> emit) async {
    emit(Logingloadingstate());

    if (event.email.isEmpty || event.password.isEmpty) {
      emit(LoginErrorState(error: "Please Give Valid Credentials"));
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        String userId = userCredential.user!.uid;
        DocumentSnapshot userData = await FirebaseFirestore.instance.collection("Users").doc(userId).get();
        UserModel fetchModel = UserModel.fromMap(userData.data() as Map<String, dynamic>);
        
        emit(LogingSuccessstate(usercred: userCredential, userMod: fetchModel));
      } on FirebaseAuthException catch (e) {
        emit(LoginErrorState(error: e.code.toString()));
      }
    }
  }

  void _createacc(CreateAccountClickEvent event, Emitter<LoginscreenState> emit) {
    emit(CreateAccountState());
  }
}
