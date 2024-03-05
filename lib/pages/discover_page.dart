import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';

class DiscoverPage extends StatelessWidget{
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar()
      ],
    );
  }

}