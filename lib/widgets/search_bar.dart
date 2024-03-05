import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget{
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
     width: double.infinity,
     height: 92,
     color: Colors.blue,
     padding: const EdgeInsets.only(left: 20,right: 20,top: 35,bottom: 16),
     child: Container(
       height: 39,
       color: const Color(0xfff0f1f4),
     ),
   );
  }


}