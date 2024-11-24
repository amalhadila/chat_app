import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_chat/features/auth/presentation/manager/cubit/login_cubit.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const SafeArea(
        child: Scaffold(
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
