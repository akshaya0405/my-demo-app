import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/login/login_bloc.dart';
import '../blocs/login/login_event.dart';
import '../blocs/login/login_state.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const LoginPage({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state.isSubmitted &&
                        state.isValid &&
                        state.errorMessage == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            title: 'Login Successful',
                            contentText:
                                'Username: ${state.username}\nPassword: ••••••••',
                            contentWidget: Container(),
                            buttonText: 'Go to Home Screen',
                            onButtonPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.home);
                            },
                          );
                        },
                      );
                    } else if (state.errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final bloc = BlocProvider.of<LoginBloc>(context);

                    return Card(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/login.png',
                                height: 200,
                                width: 200,
                                fit: BoxFit.contain,
                              ),
                              Text('Login',
                                  style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.purple,
                                    fontFamily: 'Poppins',
                                  )),
                              const SizedBox(height: 32),
                              CustomTextField(
                                controller: bloc.usernameController,
                                labelText: 'Username',
                                prefixIcon: Icons.person,
                                onChanged: (value) =>
                                    bloc.add(UsernameChanged(value)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  } else if (value.length < 4) {
                                    return 'Username must be at least 4 characters';
                                  } else if (value.length > 20) {
                                    return 'Username must be less than 20 characters';
                                  } else if (!RegExp(r'^[a-zA-Z0-9]+$')
                                      .hasMatch(value)) {
                                    return 'Username can only contain letters and numbers';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: bloc.passwordController,
                                labelText: 'Password',
                                prefixIcon: Icons.lock,
                                isPassword: true,
                                obscureText: state.isPasswordObscured,
                                togglePasswordVisibility: () =>
                                    bloc.add(TogglePasswordVisibility()),
                                onChanged: (value) =>
                                    bloc.add(PasswordChanged(value)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  } else if (!RegExp(
                                          r'[A-Za-z\d!@#^&*(),.?":{}|<>]{8,}')
                                      .hasMatch(value)) {
                                    return 'Password must include letters, numbers, and a special character';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 32),
                              CustomButton(
                                buttonText: 'Login',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    bloc.add(SubmitLogin());
                                  }
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomButton(
                                onPressed: widget.onToggleTheme,
                                buttonText: 'Toggle Theme',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
