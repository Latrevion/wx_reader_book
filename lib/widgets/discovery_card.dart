import 'package:flutter/material.dart';

class DiscoveryCard extends StatelessWidget{
  final Widget child;
  const DiscoveryCard({super.key,required this.child });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 318,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 13.0,
        margin: const EdgeInsets.only(left: 13,right: 13,top: 6,bottom: 7),
        child: child,
      )
    );


  }
}