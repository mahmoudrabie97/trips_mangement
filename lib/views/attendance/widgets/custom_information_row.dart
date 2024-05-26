import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/constants.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomInformationRow extends StatefulWidget {
  const CustomInformationRow({super.key});

  @override
  State<CustomInformationRow> createState() => _CustomInformationRowState();
}

class _CustomInformationRowState extends State<CustomInformationRow> {
  @override
  void initState() {
    HomeCubit.get(context).getDriverInfo(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            CircleAvatar(
              radius: 25,
            ),
            SizedBox(
              width: 8,
            ),
            CustomText(
              text: AppConstant.drivername,
              fontWeight: FontWeight.w900,
              fontSize: 17,
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  HomeCubit.get(context)
                      .getPickedUpTransactionsByDriverId(context: context);
                },
                icon: Icon(Icons.notifications))
          ],
        );
      },
    );
  }
}
