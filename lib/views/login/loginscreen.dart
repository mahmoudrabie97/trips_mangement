import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/logincubit/logincubit.dart';
import 'package:drive_app/cubit/logincubit/loginstates.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/custommethods.dart';
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
  final FocusNode field1 = FocusNode();
  final FocusNode field2 = FocusNode();

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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            } else if (!isEmailValid(value)) {
                              return 'Invalid email format';
                            }
                            return null;
                          },
                          hintText: ' Email Adress',
                          hinnntcolr: Colors.grey,
                          focusnode: field1,
                          onsubmitted: (value) {
                            FocusScope.of(context).requestFocus(field2);
                          },
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
                          obscureText: LoginCubit.get(context).isSecurep,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'please enter the password';
                            }
                          },
                          focusnode: field2,
                          suffixicon: LoginCubit.get(context).sufficxicp,
                          suffixpressed: () {
                            LoginCubit.get(context).changeSecurePassword();
                          },
                          hintText: ' Password',
                          hinnntcolr: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.amber,
                            value: LoginCubit.get(context).isChecked,
                            onChanged: (value) {
                              LoginCubit.get(context).checkBox(value);
                              print(LoginCubit.get(context).isChecked);

                              print(value);
                            },
                          ),
                          const Text(
                            'Remember me ',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          )
                        ],
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
                      const SizedBox(
                        height: 20,
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
