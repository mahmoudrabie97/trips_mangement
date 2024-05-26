import 'package:drive_app/models/trips.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/extentionhelper.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:drive_app/views/taskdetails/taskdetails_scereen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    Key? key,
    required this.tripmodel,
    required this.mylist,
  }) : super(key: key);

  final Trip tripmodel;
  final List mylist;

  @override
  Widget build(BuildContext context) {
    print('listttttttt$mylist');

    return GestureDetector(
      onTap: () {
        // context.push(TaskDetailsScreen(
        //   tripipid: tripmodel.id ?? 0,
        //   currentstatus: tripmodel.id ?? 0,
        //   drivername: tripmodel.driverName ?? '',
        //   tripmodel: tripmodel,
        // ));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 170,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        tripmodel.carName ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  const Icon(Icons.person,
                                      color: AppColor.mainColor),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    text: tripmodel.driverName ?? '',
                                    fontSize: 13,
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.car_repair,
                                      color: Colors.amber),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(tripmodel.coordinatorName.toString()),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  const Icon(Icons.description_outlined,
                                      color: AppColor.mainColor),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      tripmodel.description ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.car_repair,
                                      color: Colors.amber),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(tripmodel.plateNumber.toString()),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Spacer(),
                                  tripmodel.tripStatus == 2
                                      ? Container(
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 2, right: 2),
                                            child: Text(
                                              'Picked up',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 2, right: 2),
                                            child: Text(
                                              'completed',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
