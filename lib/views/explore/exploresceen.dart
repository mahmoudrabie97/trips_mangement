import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/custommethods.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:drive_app/utilites/widgets/customtextformfield.dart';
import 'package:drive_app/views/explore/widgets/taskcomleteitem.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class ExplporeScreen extends StatelessWidget {
  const ExplporeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context).getcompletedTransactions(context: context);

    print('selecttttttttttttttttyy${HomeCubit.get(context).selecteddate}');

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: detailspageappbar(
              context,
              Text('Completed Transactions',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18)),
              false),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                DatePicker(
                  onDateChange: (d) {
                    HomeCubit.get(context).changedatePicker(d);
                    HomeCubit.get(context).filterCompletedTripsByDate(context);
                    debugPrint(
                        "Selected date: ${HomeCubit.get(context).selecteddate}");
                  },
                  DateTime.now(),
                  height: 100,
                  width: 80,
                  initialSelectedDate: HomeCubit.get(context).selecteddate,
                  selectionColor: Colors.amber,
                  selectedTextColor: Colors.white,
                  dateTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                if (HomeCubit.get(context).selecteddate != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'clear',
                              style: TextStyle(color: Colors.orange),
                            ),
                            CircleAvatar(
                              child: IconButton(
                                  onPressed: () {
                                    HomeCubit.get(context).clearFilter();
                                    debugPrint(
                                        "Selected date: ${HomeCubit.get(context).selecteddate}");
                                  },
                                  icon: Icon(Icons.close)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          DateFormat.yMMMMd('en_US').format(
                              HomeCubit.get(context).selecteddate ??
                                  DateTime.now()),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: CustomTextFormField(
                    suffixicon: IconlyLight.search,
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
                    text: 'Completed Trips',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                state is GetCompletedTransactionsrLoadingState ||
                        state is FilterCompletedTripsByDateLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: AppColor.mainColor),
                      )
                    : SizedBox(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: HomeCubit.get(context).selecteddate == null
                              ? HomeCubit.get(context)
                                  .getcomplertedTransactionslist
                                  .length
                              : HomeCubit.get(context)
                                  .getfiltercomplertedTransactionslist
                                  .length,
                          itemBuilder: (BuildContext context, int index) {
                            return HomeCubit.get(context).selecteddate == null
                                ? TaskCompletedItemWidget(
                                    tripmodel: HomeCubit.get(context)
                                        .getcomplertedTransactionslist[index],
                                    mylist: HomeCubit.get(context)
                                        .getcomplertedTransactionslist,
                                  )
                                : TaskCompletedItemWidget(
                                    tripmodel: HomeCubit.get(context)
                                            .getfiltercomplertedTransactionslist[
                                        index],
                                    mylist: HomeCubit.get(context)
                                        .getfiltercomplertedTransactionslist,
                                  );
                          },
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
