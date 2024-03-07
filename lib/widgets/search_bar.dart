import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget{
  final Widget rightButton;

  const CustomSearchBar({super.key,required this.rightButton});

  @override
  Widget build(BuildContext context) {
   return Container(
     width: double.infinity,
     height: 61,
     padding: const EdgeInsets.only(left: 13,right: 13,top: 24,bottom: 10),
     child: Container(
       height: 26,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: const Color(0xfff0f1f4),
       ),
       child: Row(
         children: [
           const SizedBox(width: 13,),
           const Icon(Icons.search,size: 13,color: Colors.black45,),
           const SizedBox(width: 5),
           const Text('undercurrent',style: TextStyle(fontSize: 11,color:Colors.black45,)),
           const Expanded(child: SizedBox(height: 1,)),
           Container(width: 0.5,height: 11,color: const Color(0xffb5b5b8),),
           const SizedBox(width: 11,),
           rightButton,
           const SizedBox(width: 13,)
         ],
       ),
     ),
   );
  }


}