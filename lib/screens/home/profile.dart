import 'package:flutter/material.dart';
 class profile extends StatefulWidget {
   @override
   _profileState createState() => _profileState();
 }

 class _profileState extends State<profile> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.amber,
       body: Center(
         child: Text('Profile'),
       ),
     );
   }
 }
