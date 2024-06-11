import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilites/custommethods.dart';
import '../../utilites/widgets/customtextformfield.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailspageappbar(
        context,
        Text(
          'Information App',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
        ),
        false,
      ),
      body: Column(
        children: [


          Container(
            width: double.infinity,
            height: 80,
            child: Center(child: Text('App Name : Trip Management',style: TextStyle(fontSize: 15),),),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15),
              border: Border.all(width: 1),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 80,
            child: Center(child: Text('Apk Version : 3',style: TextStyle(fontSize: 15),),),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15),
              border: Border.all(width: 1),
            ),
          ),

        ],
      ),
    );
  }
}
