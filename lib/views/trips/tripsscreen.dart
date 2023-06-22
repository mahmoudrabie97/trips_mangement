import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/custommethods.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:drive_app/utilites/widgets/customtextformfield.dart';
import 'package:drive_app/views/hometasks/widgets/taskitemwidget.dart';
import 'package:drive_app/views/trips/widgets/tripspickeditrm.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context).getPickedUpTransactionsByDriverId(context: context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: detailspageappbar(
              context,
              Text('Picked Transactions',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18)),
              false),
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  DatePicker(
                    DateTime.now(),
                    height: 100,
                    width: 80,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.amber,
                    selectedTextColor: Colors.white,
                    dateTextStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: CustomTextFormField(
                      suffixIcon: IconlyLight.search,
                      hintText: 'Search',
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'please enter the search text';
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: CustomText(
                      text: 'Today Tasks',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  state is GetPickedUpTransactionsrLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: AppColor.mainColor),
                        )
                      : SizedBox(
                          height: 400,
                          child: ListView.builder(
                            itemCount: HomeCubit.get(context)
                                .getPickedUpTransactionslist
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return TaskPickedItemWidget(
                                  tripmodel: HomeCubit.get(context)
                                      .getPickedUpTransactionslist[index]);
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
