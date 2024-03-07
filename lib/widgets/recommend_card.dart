import 'package:flutter/material.dart';
import 'discovery_card.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DiscoveryCard(
        child: Column(
      children: [
        const SizedBox(height: 13),
        const Text(
          '为您推荐',
          style: TextStyle(
              fontSize: 14,
              color: Color(0xff212832),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        const Text(
          '基于您的阅读历史计算 每日更新',
          style: TextStyle(fontSize: 9, color: Color(0xff99a0aa)),
        ),
        const SizedBox(height: 13),
        SizedBox(
          width: 208,
          height: 187,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  childAspectRatio: (60 / 87)),
              padding: EdgeInsets.zero,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset('assets/images/book_cover${index + 1}.jpg');
              }),
        ),
        const SizedBox(height: 13),
        Container(
          margin: const EdgeInsets.only(left: 13, right: 20),
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9), color: Colors.grey[100]),
          child: const Center(
            child: Text(
              '换一批',
              style: TextStyle(color: Colors.blue, fontSize: 10),
            ),
          ),
        )
      ],
    ));
  }
}
