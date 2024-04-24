import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/core/di/di_setup.dart';
import 'package:tele_flicks/src/common/local/generated/l10n.dart';
import 'package:tele_flicks/src/common/res/app_assets.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';
import 'package:tele_flicks/src/common/widgets/buttons/mc_button.dart';
import 'package:tele_flicks/src/common/widgets/text_fields/mc_text_field.dart';
import 'package:tele_flicks/src/features/login/bloc/login_bloc.dart';
import 'package:tele_flicks/src/features/login/data/login_repository.dart';
import 'package:tele_flicks/src/features/user_state/bloc/user_state_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final LoginBloc _bloc;
  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    _bloc = LoginBloc(
      userStateBloc: context.read<UserStateBloc>(),
      repository: getIt<LoginRepository>(),
      progressBloc: context.read(),
    )..add(LoginCheckLocalDataEvent());
    passwordController.addListener(() { 

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _bloc,
          builder: (context, state) {
            userNameController.text = state.userName;
            passwordController.text = state.password;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          Image.asset(
                            AppAssets.teleFlicksLogo,
                            width: 300,
                            height: 300,
                          ),
                          MCTextField(
                            controller: userNameController,
                            labelText: S.of(context).username,
                            onChanged: (value) => _bloc.add(LoginUserNameFiledChanged(value)),
                          ),
                          SizedBox(height: 20),
                          MCTextField(
                            controller: passwordController,
                            labelText: S.of(context).password,
                            onChanged: (value) => _bloc.add(LoginPasswordFiledChanged(value)),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: state.passwordObscureText,
                            suffixIcon: IconButton(
                              icon: Icon(
                                state.passwordObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () => _bloc
                                  .add(LoginChangePasswordObscureTextEvent()),
                            ),
                          ),
                          if (state.error) ...[
                          SizedBox(height: 10),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                S.of(context).incorrectLogin,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primaryRed,
                                ),
                              ),
                            ),
                          SizedBox(height: 20),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
                MCButton(
                  text: S.of(context).login,
                  onPressed: () => _bloc.add(LoginAuthenticationEvent(
                    userName: userNameController.text,
                    password: passwordController.text,
                  )),
                ),
                SizedBox(height: 60),
              ],
            );
          },
        ),
      ),
    );
  }
}


