import 'package:auto_route/auto_route.dart';
import 'package:code_base/components/app_button.dart';
import 'package:code_base/config/app_router.dart';
import 'package:code_base/core/di/injection.dart';
import 'package:code_base/pages/login_page/bloc/login_state.dart';
import 'package:code_base/pages/login_page/view/component/password_text_field.dart';
import 'package:code_base/pages/login_page/view/component/username_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = getIt<LoginBloc>();
    final formKey = GlobalKey<FormState>();

    return BlocProvider.value(
      value: loginBloc,
      child: BlocListener(
        bloc: loginBloc,
        listener: (context, state) {
          if(state is LoginSuccessState){
            context.pushRoute(const HomeRoute());
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Login Page"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Expanded(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    UsernameTextField(
                      controller: loginBloc.usernameController,
                      hint: "Josh",
                      label: "Username",
                    ),
                    SizedBox(height: 20,),
                    PasswordTextField(
                      controller: loginBloc.passwordController,
                      hint: "********",
                      label: "Password",
                    ),
                    SizedBox(height: 50,),
                    AppButton(
                      title: "Login",
                      onPressed: () => loginBloc.login(formKey),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
