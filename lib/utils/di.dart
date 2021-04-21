import 'package:admin_sharebook/admin_bloc/admin_bloc.dart';
import 'package:admin_sharebook/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.instance;

Future<void> initDependencyInjection() async {
  WidgetsFlutterBinding.ensureInitialized();
  _loginUser();
  _repository();
}

void _loginUser() {
  inject.registerLazySingleton(() => AdminBloc(adminRespository: inject()));
}

void _repository() {
  inject.registerLazySingleton(() => AdminRespository());
}
