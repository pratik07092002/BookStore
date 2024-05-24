part of 'loginscreen_bloc.dart';


 class LoginscreenEvent  extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
 }

 class EmailTypeEvent extends LoginscreenEvent{}
 class PasswordTypeEvent extends LoginscreenEvent{}
 class LoginClickEvent extends LoginscreenEvent{
  final String email;
  final String password;

  LoginClickEvent({required this.email, required this.password});
  @override
  List<Object?> get props => [email,password];
 }
 class CreateAccountClickEvent extends LoginscreenEvent{}
 class LoginErrorEvent extends LoginscreenEvent{}


