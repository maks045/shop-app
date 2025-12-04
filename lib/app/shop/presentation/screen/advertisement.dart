import 'package:flutter/material.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({super.key});
final List<String> addImage = const[
  'asset/img/Card.png',
  'asset/img/Card.png',
  'asset/img/Card.png',
  'asset/img/Card.png'
];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: addImage.length,
        itemBuilder: (context, index)=>Padding(
      padding: const EdgeInsets.all(8.0),
      child: _AddCard(imagePath: addImage[index],)));
  }
}

class _AddCard extends StatelessWidget {
  const _AddCard({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 149,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

      ),
      child: ClipRect(
        child: Image.asset( imagePath,fit: BoxFit.cover,),
      ),
    );
  }
}
