import 'package:flutter/material.dart';
import 'discovery_card.dart';

class OneBookCard extends StatelessWidget {
  const OneBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DiscoveryCard(
        child: Column(
      children: [
        const SizedBox(height: 44),
        SizedBox(
          width: 90,
          height: 130,
          child: Image.asset('assets/images/book_cover1.jpg'),
        ),
        const SizedBox(height: 11),
        const Text(
          '三体全集',
          style: TextStyle(
              color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        const Text(
          '刘慈欣',
          style: TextStyle(
              color: Color(0xff878398),
              fontSize: 8,
              fontWeight: FontWeight.bold),
        ),
        const Expanded(
            child: SizedBox(
          width: 1,
        )),
        Container(
          width: double.infinity,
          height: 39,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color(0xfff6f6f6),
          ),
          child: const Center(
            child: Text(
              '1位朋友在读',
              style: TextStyle(fontSize: 9, color: Color(0xff878e98)),
            ),
          ),
        )
      ],
    ));
  }
}
