import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/models/trips.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({
    super.key,
    required this.tripmodel,
  });
  final Trip tripmodel;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.car_repair, color: Colors.amber),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: tripmodel.carName.toString(),
                    fontSize: 12,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.car_repair,
                    color: AppColor.mainColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: tripmodel.plateNumber.toString(),
                    fontSize: 12,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined, color: Colors.amber),
                  SizedBox(
                    width: 5,
                  ),
                  // CustomText(
                  //   text: tripmodel.scheduledShiftStart.toString(),
                  //   fontSize: 12,
                  // ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.person, color: Colors.amber),
              Text(tripmodel.coordinatorName.toString()),
            ],
          ),
        ),
      ],
    );
  }

  Column customersname(BuildContext context, int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomText(
          text: State is GetTripsdetailsLoadingState
              ? '........'
              : ' CoordinatorName',
          fontSize: 14,
        ),
        const SizedBox(
          height: 10,
        ),
        CircleAvatar(
            minRadius: 30,
            maxRadius: 30,
            backgroundColor: Colors.cyan[100],
            child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863'),
                      fit: BoxFit.cover),
                ))),
        const SizedBox(
          height: 10,
        ),
        const CustomText(
          text: State is GetTripsdetailsLoadingState
              ? '........'
              : ' arrival time',
          fontSize: 8,
        ),
      ],
    );
  }
}
