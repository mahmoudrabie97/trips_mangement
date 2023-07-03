import 'dart:convert';

import 'package:drive_app/cubit/logincubit/loginstates.dart';
import 'package:drive_app/models/user_model.dart';
import 'package:drive_app/network/api.dart';
import 'package:drive_app/network/endpoints.dart';
import 'package:drive_app/utilites/constants.dart';
import 'package:drive_app/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
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
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }).then((value) {
      if (value!.statusCode == 200) {
        debugPrint(value.body);
        final responseBody = json.decode(value.body);
        print(responseBody);
        userModel = UserModel.fromJson(responseBody);

        AppConstant.token = userModel!.accessToken;
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
