import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/extentionhelper.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:drive_app/views/taskdetails/taskdetails_scereen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:drive_app/models/trips.dart';

class TaskPickedItemWidget extends StatelessWidget {
  const TaskPickedItemWidget({
    super.key,
    required this.tripmodel,
    required this.mylist,
  });
  final Trip tripmodel;
  final List mylist;

  @override
  Widget build(BuildContext context) {
    print('iiiiiiiiiiiiiiiiiii${tripmodel.id}');
    return GestureDetector(
      onTap: () {
        context.push(TaskDetailsScreen(
          tripipid: tripmodel.id ?? 0,
          currentstatus: tripmodel.currentTransactionStatus ?? 0,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    left: 10,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          tripmodel.note ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      const Spacer(),
                      CustomText(
                        text: tripmodel.arrivalDateTime!,
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Row(
                              children: [
                                const Icon(Icons.remove_red_eye,
                                    color: AppColor.mainColor),
                                const SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                  text: tripmodel.locationFrom!.name ?? '',
                                  fontSize: 13,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  const Icon(IconlyLight.location,
                                      color: AppColor.mainColor),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    text: tripmodel.locationTo!.name ?? '',
                                    fontSize: 13,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
