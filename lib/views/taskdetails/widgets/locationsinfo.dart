import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class LocationsInfo extends StatelessWidget {
  const LocationsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(Icons.my_location_sharp, color: Colors.black),
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'From :'),
                  CustomText(
                      text:
                          HomeCubit.get(context).ride!.locationFrom!.name ?? '',
                      color: Colors.grey,
                      fontSize: 13),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(Icons.location_on_outlined, color: Colors.black),
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'To :'),
                  CustomText(
                      text: HomeCubit.get(context).ride!.locationTo!.name ?? '',
                      color: Colors.grey,
                      fontSize: 13),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
