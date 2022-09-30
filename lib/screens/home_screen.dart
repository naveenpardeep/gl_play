import 'package:flutter/material.dart';
import 'components/activities_carousel.dart';
import 'components/happenings_carousel.dart';
import 'components/parks_and_attractions.dart';
import 'components/plan_your_ideal_day.dart';
import 'components/plan_your_visit.dart';
import 'components/subscribe_form.dart';
import 'components/image_gallery.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("Device's height: ${MediaQuery.of(context).size.height}" );
    print("Device's width: ${MediaQuery.of(context).size.width}" );
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: <Widget>[
        _appBar(),
        const PlanYourIdealDay(),
        const ActivitiesCarousel(),
        const ParksAndAttraction(),
        const HappeningsCarousel(),
        const PlanYourVisit(),
        //const ImageGallery(),
        const SubscribeForm(),
      ],
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

  @override
  bool get wantKeepAlive => true;
}
