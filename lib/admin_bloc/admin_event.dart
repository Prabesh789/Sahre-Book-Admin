part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AdminEvent {
  final AdminModel adminModel;

  LoginEvent({this.adminModel});
  @override
  List<Object> get props => [adminModel];
}
