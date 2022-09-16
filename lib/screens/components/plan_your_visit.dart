import 'package:flutter/material.dart';

class PlanYourVisit extends StatelessWidget {
  const PlanYourVisit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "PLAN YOUR VISIT",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _circleIcon(Colors.red, screenWidth, screenHeight),
                  _circleIcon(Colors.blue, screenWidth, screenHeight),
                  _circleIcon(Colors.green, screenWidth, screenHeight),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon(Color color, double width, double height){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          width: width / 4,
          height: height / 8,
          child: const Center(child: Text("Insert icon here", textAlign: TextAlign.center,)),
        ),
        const Text("something", style: TextStyle(color: Colors.red),)
      ],
    );
  }
}
