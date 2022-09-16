import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gl_play/screens/components/happenings_carousel.dart';
import 'package:gl_play/screens/components/parks_and_attractions.dart';
import 'package:gl_play/screens/components/plan_your_ideal_day.dart';
import 'package:gl_play/screens/components/plan_your_visit.dart';
import 'package:gl_play/screens/components/subscribe_form.dart';

import 'components/image_gallery.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: <Widget>[
            _appBar(),
            const PlanYourIdealDay(),
            const ParksAndAttraction(),
            const HappeningsCarousel(),
            const PlanYourVisit(),
            const ImageGallery(),
            const SubscribeForm(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_activity), label: "Activities"),
            BottomNavigationBarItem(
                icon: Icon(Icons.landscape), label: "Attraction"),
            BottomNavigationBarItem(
                icon: Icon(Icons.percent), label: "Promotion"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: "More"),
          ],
        ),
      ),
    );
  }

  _appBar(){
    return SliverAppBar(
      // title: PreferredSize(
      //     preferredSize: Size.fromHeight(28),
      //     child: Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth, height: 50, alignment: FractionalOffset.center,)
      // ),
      backgroundColor: Colors.white,
      expandedHeight: 400,
      floating: false,
      stretch: true,
      excludeHeaderSemantics: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        background: Image.asset(
          'assets/images/banner.png',
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
          StretchMode.fadeTitle
        ],
      ),
    );
  }

}
