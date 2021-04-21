import 'dart:async';

import 'package:admin_sharebook/model/admin_model.dart';
import 'package:admin_sharebook/repositories/repositories.dart';
import 'package:admin_sharebook/status/status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRespository _adminRespository;
  AdminBloc({@required AdminRespository adminRespository})
      : assert(adminRespository != null),
        _adminRespository = adminRespository,
        super(AdminInitial());

  @override
  Stream<AdminState> mapEventToState(
    AdminEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield AdminLoadingState();
      final response =
          await _adminRespository.loginUSer(adminModel: event.adminModel);
      if (response.isSuccess) {
        yield AdminAuthenticatedState(status: response);
      } else {
        yield AdminErrorState();
      }
    }
  }
}
