import 'dart:convert';

import 'package:drive_app/cubit/logincubit/loginstates.dart';
import 'package:drive_app/models/user_model.dart';
import 'package:drive_app/network/api.dart';
import 'package:drive_app/network/endpoints.dart';
import 'package:drive_app/network/local_network.dart';
import 'package:drive_app/utilites/constants.dart';
import 'package:drive_app/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  IconData sufficxicp = Icons.visibility_off;
  IconData sufficxicpc = Icons.visibility_off;
  bool isSecurep = true;
  bool isSecurepc = true;
  bool isChecked = false;

  void checkBox(bool? val) {
    isChecked = val!;
    emit(CheckBoxSuccessState());
  }

  void changeSecurePassword() {
    if (isSecurep) {
      sufficxicp = Icons.visibility_off;
      isSecurep = false;
    } else {
      sufficxicp = Icons.remove_red_eye_outlined;
      isSecurep = true;
    }
    emit(ChangesecurepasswordState());
  }

  void loginUser({
    required Map userdata,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    CallApi.postData(
        data: userdata,
        baseUrl: baseurl,
        apiUrl: loginurl,
        context: context,
        st: true,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }).then((value) {
      if (value!.statusCode == 200) {
        debugPrint(value.body);
        final responseBody = json.decode(value.body);
        print(responseBody);
        userModel = UserModel.fromJson(responseBody);

        AppConstant.token = userModel!.accessToken;
        if (isChecked) {
          CashDate.setDate(key: 'token', value: userModel?.accessToken);
        }

        print('tokkkkkkkkkkkkkkkkk${AppConstant.token}');

        // AppConstant.token = userModel!.accessToken;
        // debugPrint('token=${AppConstant.token}');
        // debugPrint('usrId= ${userModel!.userId}');

        emit(LoginSucsessState());
      } else if (value.statusCode == 400) {
        final responseBody = json.decode(value.body);
        debugPrint(responseBody['error_description']);
        ShowMyDialog.showMsg(
            context, responseBody['error_description'], ' error');

        emit(LoginErrorEmailorpasswordState());
      } else if (value.statusCode == 500) {
        ShowMyDialog.showMsg(context, 'internal server error', 'error');
        emit(LoginErrorState());
      } else {
        ShowMyDialog.showMsg(
            context, 'unkown error, please try later', 'error');
        emit(LoginErrorState());
      }
    }).catchError((error) {
      debugPrint('An error occurred: $error');
      // ShowMyDialog.showMsg(context, 'An error occurred: $error');
      emit(LoginErrorState());
    });
  }
}
