import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ActivitiesCarousel extends StatefulWidget {
  const ActivitiesCarousel({Key? key}) : super(key: key);

  @override
  State<ActivitiesCarousel> createState() => _ActivitiesCarouselState();
}

class _ActivitiesCarouselState extends State<ActivitiesCarousel> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Builder(
          builder: (context){
            return CarouselSlider(
                items: [
                  _activitiesSlide1(),
                  _activitiesSlide2(),
                ],
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false, enableInfiniteScroll: false
                  // autoPlay: false,
                )
            );
          },
        )
    );
  }

  Widget _activitiesSlide1(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue,
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
              height: 120,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                _rowCircleOfActivities(),
                _rowCircleOfActivities(),
                _rowCircleOfActivities(),
                const SizedBox(
                  height: 20,
                ),
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

  Widget _activitiesSlide2(){
    return Container(
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
              height: 120,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                _rowCircleOfActivities(),
                _rowCircleOfActivities(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: double.infinity,)),
            _buttonWithBorderRadius('MORE WATER',Colors.lightGreen,Colors.white),
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
        style: TextStyle(
            fontSize: 18, color: labelColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _rowCircleOfActivities() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
            ),
            const Text(
              "WATER",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
            ),
            const Text(
              "WATER",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
