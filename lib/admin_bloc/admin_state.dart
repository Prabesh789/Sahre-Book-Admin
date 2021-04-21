part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {}

class AdminInitial extends AdminState {
  @override
  List<Object> get props => [];
}

class AdminLoadingState extends AdminState {
  @override
  List<Object> get props => [];
}

class AdminAuthenticatedState extends AdminState {
  final Status status;

  AdminAuthenticatedState({this.status});
  @override
  List<Object> get props => [status];
}

class AdminUnAuthenticatedState extends AdminState {
  @override
  List<Object> get props => [];
}

class AdminErrorState extends AdminState {
  final String errorMessage;

  AdminErrorState({this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
