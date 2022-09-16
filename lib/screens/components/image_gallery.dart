import 'package:flutter/material.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "SHARE YOUR MEMORIES USING #GAMUDAPLAY",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20.0,),
          Column(
            children: [
              _hashtagImagesRow(Colors.red,Colors.blue,Colors.green, screenWidth, screenHeight),
              _hashtagImagesRow(Colors.purple,Colors.yellow,Colors.orange, screenWidth, screenHeight),
            ],
          ),
        ],
      ),
    );
  }

  Widget _hashtagImagesRow(Color color1, Color color2, Color color3, double width, double height){
    return Row(
      children: [
        Container(
            color: color1,
            width: width / 3,
            height: height / 6,
            child: const Center(child: Text("Insert image here", textAlign: TextAlign.center,))
        ),
        Container(
            color: color2,
            width: width / 3,
            height: height / 6,
            child: const Center(child: Text("Insert image here", textAlign: TextAlign.center,))
        ),
        Container(
            color: color3,
            width: width / 3,
            height: height / 6,
            child: const Center(child: Text("Insert image here", textAlign: TextAlign.center,))
        )
      ],
    );
  }
}
