import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gl_play/styles/border_radius_button.dart';
import 'package:gl_play/styles/text_style.dart';

class ActivitiesCarousel extends StatefulWidget {
  const ActivitiesCarousel({Key? key}) : super(key: key);

  @override
  State<ActivitiesCarousel> createState() => _ActivitiesCarouselState();
}

class _ActivitiesCarouselState extends State<ActivitiesCarousel> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
        child: Builder(
          builder: (context){
            return CarouselSlider(
                items: [
                  _activitiesSlide1(screenWidth, screenHeight),
                  _activitiesSlide2(screenWidth, screenHeight),
                ],
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height*1.2,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false, enableInfiniteScroll: false
                  // autoPlay: false,
                )
            );
          },
        )
    );
  }

  Widget _activitiesSlide1(double width,double height){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue,
      ),
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "WATER",
              style: AppTextStyle(context).title().copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                _activityImageAndLabel("Splashmania",width,height),
                _activityImageAndLabel("Big Bucket Splash",width,height),
                _activityImageAndLabel("Water Playscape",width,height),
                _activityImageAndLabel("Beach Pool Club",width,height),
                _activityImageAndLabel("D'Swim Academy",width,height),
                const Expanded(child: SizedBox()),
              ],
            ),
            const Expanded(child: SizedBox(height: double.infinity,)),
            _buttonWithBorderRadius('MORE WATER',Colors.blue,Colors.white),
            const SizedBox(
              height: 20,
            ),
          ]),
    );
  }

  Widget _activitiesSlide2(double width,double height){
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.green,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "WATER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                _activityImageAndLabel("Water Playscape",width,height),
                _activityImageAndLabel("Beach Pool Club",width,height),
                _activityImageAndLabel("D'Swim Academy",width,height),
                const Expanded(child: SizedBox()),
              ],
            ),
            const Expanded(child: SizedBox(height: double.infinity,)),
            const BorderRadiusButton(label: 'MORE WATER', labelColor: Colors.lightGreen, buttonColor: Colors.white),
            //_buttonWithBorderRadius('MORE WATER',Colors.lightGreen,Colors.white),
            const SizedBox(
              height: 20,
            ),
          ]),
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
        style: AppTextStyle(context).biggerText().copyWith(color: labelColor,fontWeight: FontWeight.bold),
      ),
    );
  }
  
  Widget _activityImageAndLabel(String label,double width, double height){
    return SizedBox(
      width: width * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/confused_cat.jpeg',
                fit: BoxFit.contain,
                //width: width,
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              label.toUpperCase(),
              style: AppTextStyle(context).normalText().copyWith(color: Colors.white,fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
