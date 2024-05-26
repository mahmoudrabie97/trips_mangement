import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocationsInfo extends StatelessWidget {
  const LocationsInfo({
    Key? key,
    required this.drivername,
    required this.description,
  }) : super(key: key);

  final String drivername;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(Icons.my_location_sharp, color: Colors.black),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'description :'),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(Icons.location_on_outlined, color: Colors.black),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'driver name   :     '),
                  CustomText(
                    text: drivername,
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
