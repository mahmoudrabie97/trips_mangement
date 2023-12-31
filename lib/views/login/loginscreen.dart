import 'package:drive_app/cubit/logincubit/logincubit.dart';
import 'package:drive_app/cubit/logincubit/loginstates.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/extentionhelper.dart';
import 'package:drive_app/utilites/widgets/custombutton.dart';
import 'package:drive_app/utilites/widgets/customtextformfield.dart';
import 'package:drive_app/views/hometasks/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSucsessState) {
            context.push(const HomeBottomNav());
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            body: ListView(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          'assets/images/login.png',
                          width: 360,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Login to your account ',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                        ),
                        child: CustomTextFormField(
                          controller: _emailController,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'please enter the email';
                            }
                          },
                          hintText: ' Email Adress',
                          hinnntcolr: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                        ),
                        child: CustomTextFormField(
                          controller: _passwordController,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'please enter the password';
                            }
                          },
                          hintText: ' Password',
                          hinnntcolr: Colors.grey,
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: state is LoginLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: AppColor.mainColor),
                              )
                            : CustomButton(
                                buttonText: 'Login',
                                onPressed: () {
                                  Map userdata = {
                                    'userName': _emailController.text,
                                    'password': _passwordController.text,
                                    'grant_type': 'password'
                                  };
                                  if (_formkey.currentState!.validate()) {
                                    LoginCubit.get(context).loginUser(
                                        userdata: userdata, context: context);
                                    //context.push(const HomeBottomNav());
                                  }
                                },
                                buttonColor: AppColor.mainColor,
                                txtColor: Colors.black,
                                borderRadius: 18,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
