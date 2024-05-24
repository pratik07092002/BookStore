part of 'signup_bloc.dart';

class SignupState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SignupLoadingState extends SignupState{}
 class SignupValidationstate extends SignupState {}
class SignupSuccessstate extends SignupState{
 final UserCredential usercred;
 final UserModel usermod;

  SignupSuccessstate({required this.usercred, required this.usermod});

   @override
  List<Object> get props => [usercred, usermod];
}
class Signupfailstate extends SignupState{
  final String Error;

  Signupfailstate({required this.Error});
   @override
  List<Object> get props => [Error];
}
