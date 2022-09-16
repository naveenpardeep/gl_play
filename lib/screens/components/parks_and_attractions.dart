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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _circleLogo(Colors.red, screenWidth, screenHeight),
                _circleLogo(Colors.blue, screenWidth, screenHeight),
                _circleLogo(Colors.green, screenWidth, screenHeight),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _circleLogo(Colors.purple,screenWidth, screenHeight),
                _circleLogo(Colors.yellow,screenWidth, screenHeight),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleLogo(Color color, double width, double height){
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width:  width / 4,
      height: height / 8,
      child: const Center(child: Text("Insert logo here", textAlign: TextAlign.center,)),
    );
  }
}
