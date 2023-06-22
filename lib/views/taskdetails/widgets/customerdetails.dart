import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.amber),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: '5.5 Km',
                    fontSize: 12,
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.watch_later_outlined, color: Colors.amber),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: '15 mins',
                    fontSize: 12,
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.monetization_on_rounded,
                    color: AppColor.mainColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: '7.00\$',
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Icon(IconlyLight.profile, color: Colors.amber),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: State is GetTripsdetailsLoadingState
                    ? '........'
                    : 'Custome Name : ${HomeCubit.get(context).ride!.locationTo.name}',
                fontSize: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
