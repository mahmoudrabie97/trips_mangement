import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            minRadius: 40,
            maxRadius: 40,
            backgroundColor: Colors.cyan[100],
            child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863'),
                      fit: BoxFit.cover),
                ))),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            State is GetTripsdetailsLoadingState
                ? Text('........')
                : CustomText(
                    text: '',
                  ), //' HomeCubit.get(context).ride!.driver!.name ?? ' ''),
            CustomText(
              text: State is GetTripsdetailsLoadingState
                  ? '........'
                  : HomeCubit.get(context).ride!.driver!.name ?? '',
              fontSize: 12,
            ),
            CustomText(
              text: State is GetTripsdetailsLoadingState
                  ? '........'
                  : '', //HomeCubit.get(context).ride!.car.id.toString(),
              fontSize: 12,
            ),
          ],
        )
      ],
    );
  }
}
