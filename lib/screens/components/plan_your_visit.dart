import 'package:flutter/material.dart';
import '../../styles/text_style.dart';

class PlanYourVisit extends StatefulWidget {
  const PlanYourVisit({Key? key}) : super(key: key);

  @override
  State<PlanYourVisit> createState() => _PlanYourVisitState();
}

class _PlanYourVisitState extends State<PlanYourVisit> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PLAN YOUR VISIT",
                    style: AppTextStyle(context).title(),
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

          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              _rowsOfImages(),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("FIND YOUR MEMORIES",style:AppTextStyle(context).title().copyWith(color: Colors.white),),
                    const SizedBox(height: 20,),
                    _buttonWithBorderRadius("SEARCH PHOTO", Colors.white, Colors.red),
                  ],
                )
              ),
            ],

          )

        ],
      ),
    );
  }
  
  Widget _rowsOfImages(){
    return Column(
      children: [
        _hashtagImagesRow(),
        _hashtagImagesRow(),
      ],
    );
  }

  Widget _hashtagImagesRow(){
    return Row(
      children: [
        Expanded(
            child: Image.asset(
              'assets/images/confused_cat.jpeg',
              fit: BoxFit.contain,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            )),
        Expanded(
            child: Image.asset(
              'assets/images/confused_cat.jpeg',
              fit: BoxFit.contain,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            )),
        Expanded(
            child: Image.asset(
              'assets/images/confused_cat.jpeg',
              fit: BoxFit.contain,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            )),
      ],
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
        Text(bottomLabel, style: AppTextStyle(context).header4().copyWith(color: Colors.red),)
      ],
    );
  }

  Widget _buttonWithBorderRadius(String label, Color labelColor, Color buttonColor) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.07,
        right: MediaQuery.of(context).size.width * 0.07,
        top: MediaQuery.of(context).size.height * 0.015,
        bottom: MediaQuery.of(context).size.height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0),
        color: buttonColor,
      ),
      child:  Text(
        label,
        style: TextStyle(
            fontSize: 18, color: labelColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
