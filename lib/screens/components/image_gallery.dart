import 'package:flutter/material.dart';
import 'package:gl_play/styles/text_style.dart';

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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "SHARE YOUR MEMORIES USING #GAMUDAPLAY",
              style: AppTextStyle(context).title(),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20.0,),
          Column(
            children: [
              _hashtagImagesRow(),
              _hashtagImagesRow(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _hashtagImagesRow(){
    return Row(
      children: [
        Expanded(
            child: Image.asset(
              'assets/images/confused_cat.jpeg',
              fit: BoxFit.contain,
            )),
        Expanded(
            child: Image.asset(
              'assets/images/confused_cat.jpeg',
              fit: BoxFit.contain,
            )),
        Expanded(
            child: Image.asset(
              'assets/images/confused_cat.jpeg',
              fit: BoxFit.contain,
            )),
      ],
    );
  }
}
