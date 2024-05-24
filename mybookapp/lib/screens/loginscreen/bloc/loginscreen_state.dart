part of 'loginscreen_bloc.dart';

class LoginscreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginAccountState extends LoginscreenState {}

class LogingSuccessstate extends LoginscreenState {
  final UserCredential usercred;
  final UserModel userMod;

  LogingSuccessstate({required this.usercred, required this.userMod});

  @override
  List<Object?> get props => [usercred, userMod];
}

class Logingloadingstate extends LoginscreenState {}

class CreateAccountState extends LoginscreenState {}

class LoginErrorState extends LoginscreenState {
  final String error;

  LoginErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
