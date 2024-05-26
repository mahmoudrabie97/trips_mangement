import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/extentionhelper.dart';
import 'package:drive_app/utilites/widgets/custom_alert_dialog.dart';
import 'package:drive_app/utilites/widgets/custombutton.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:drive_app/utilites/widgets/customtextfield.dart';
import 'package:drive_app/utilites/widgets/showdialog.dart';
import 'package:drive_app/views/hometasks/bottomnavbar.dart';
import 'package:drive_app/views/trips/tripsscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTripPage extends StatefulWidget {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  @override
  void initState() {
    HomeCubit.get(context).getcurrentLocation();
    super.initState();
  }

  final TextEditingController descriptonconroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const CustomText(
              text: " Trip details",
              fontSize: 20,
            ),
          ),
          body: HomeCubit.get(context).state is CreateTripLoadingState
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomTextField(
                        hintText: "Trip description",
                        controller: descriptonconroller,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomButton(
                        buttonText: 'Done',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return MyDialog(
                                  onPressedyes: () {
                                    if (HomeCubit.get(context)
                                        .getPickedUpTransactionslist
                                        .isNotEmpty) {
                                      ShowMyDialog.showMsgfuture(
                                              context,
                                              'you should  finish picked up trips before new creationg',
                                              ' error ')
                                          .then((value) {
                                        Navigator.of(context).pop();
                                        context.push(const TripsScreen());

                                        return;
                                      });
                                    } else if ((HomeCubit.get(context)
                                        .getPickedUpTransactionslist
                                        .isEmpty)) {
                                      HomeCubit.get(context).createTrip(
                                          context: context,
                                          description: descriptonconroller.text,
                                          longtiude: HomeCubit.get(context)
                                              .newLatlng
                                              .latitude
                                              .toString(),
                                          latiude: HomeCubit.get(context)
                                              .newLatlng
                                              .latitude
                                              .toString());
                                      HomeCubit.get(context);
                                    }
                                  },
                                  onPressedNo: (() {
                                    Navigator.pop(context);
                                  }),
                                );
                              });
                        },
                        buttonColor: Colors.amber,
                        borderRadius: 0,
                      ),
                    )
                  ],
                )),
        );
      },
    );
  }
}
