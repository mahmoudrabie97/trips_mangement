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
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
                children: [
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
                children: [
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
        const Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.person, color: Colors.amber),
              Text('Customers names'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: 120,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount:
                    HomeCubit.get(context).ride!.transactionDetails!.length,
                itemBuilder: (context, index) {
                  return customersname(context, index);
                }),
          ),
          // child: Row(
          //   children: [
          //     customersname(context),
          //     customersname(context),
          //     customersname(context),
          //   ],
          // ),
        ),
      ],
    );
  }

  Column customersname(BuildContext context, int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: State is GetTripsdetailsLoadingState
              ? '........'
              : ' ${HomeCubit.get(context).ride!.transactionDetails![i].guest!.name}',
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
        CustomText(
          text: State is GetTripsdetailsLoadingState
              ? '........'
              : ' ${HomeCubit.get(context).ride!.transactionDetails![i].arrivalDateTime}',
          fontSize: 8,
        ),
      ],
    );
  }
}
