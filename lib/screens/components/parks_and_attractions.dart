import 'package:flutter/material.dart';

class ParksAndAttraction extends StatelessWidget {
  const ParksAndAttraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "OUR PARKS & ATTRACTIONS",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _circleLogo(Colors.green, screenWidth/3.75),
                const SizedBox(width: 10.0,),
                _circleLogo(Colors.yellow,screenWidth/3.75),
                const SizedBox(width: 10.0,),
                _circleLogo(Colors.purple,screenWidth/3.75),
              ],
            ),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _circleLogo(Colors.red,screenWidth/3.75),
                const SizedBox(width: 10.0,),
                _circleLogo(Colors.blue,screenWidth/3.75),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleLogo(Color color,double width){
    return ClipOval(
      child: Image.asset(
        'assets/images/confused_cat.jpeg',
        fit: BoxFit.contain,
        color: color.withOpacity(0.7),
        colorBlendMode: BlendMode.color,
        width: width,
      ),
    );
  }

}
