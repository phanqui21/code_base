import 'package:bloc/bloc.dart';
import 'package:code_base/pages/login_page/bloc/login_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../repositories/authentication_repository.dart';

class LoginBloc extends Cubit<LoginState> {
  final IAuthenticationRepository _repository;

  LoginBloc(this._repository) : super(LoginInitialState());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final request = await _repository.login(
      username: usernameController.text,
      password: passwordController.text,
      expiresInMins: 30,
    );
    final data = request;
    if (data == null) {
      emit(LoginFailedState());
    } else {
      emit(LoginSuccessState());
    }
  }
}
