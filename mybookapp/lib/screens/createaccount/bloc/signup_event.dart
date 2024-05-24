part of 'signup_bloc.dart';

class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupButtonClickEvent extends SignupEvent {
  final String fname;
  final String Lname;
  final String Phonenum;
  final String password;
  final String email;
  final String CPassword;

  SignupButtonClickEvent({
    required this.CPassword,
    required this.fname,
    required this.Lname,
    required this.Phonenum,
    required this.password,
    required this.email,
  });

  @override
  List<Object?> get props => [fname, Lname, Phonenum, password, email, CPassword];
}
