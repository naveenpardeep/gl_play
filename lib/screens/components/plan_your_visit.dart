import 'package:flutter/material.dart';
import '../../styles/text_style.dart';

class PlanYourVisit extends StatelessWidget {
  const PlanYourVisit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "PLAN YOUR VISIT",
                style: AppTextStyle.title(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _circleIcon(Icons.location_on, screenWidth, "Park Map"),
                  _circleIcon(Icons.percent, screenWidth, "Promotions"),
                  _circleIcon(Icons.local_activity, screenWidth, "Buy Tickets"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData iconData, double width, String bottomLabel){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Icon(
          iconData,
          size: width/5,
          color: Colors.red,
        ),
        const SizedBox(height: 10,),
        Text(bottomLabel, style: AppTextStyle.header4().copyWith(color: Colors.red),)
      ],
    );
  }
}
