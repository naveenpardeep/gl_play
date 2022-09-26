import 'package:flutter/material.dart';
import 'package:gl_play/model/acitivity.dart';
import 'package:gl_play/screens/activity_detail_screen.dart';
import 'package:gl_play/styles/text_style.dart';
import 'components/subscribe_form.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen>
    with AutomaticKeepAliveClientMixin {
  final List<Activity> activities = [
    Activity(
        name: "Splashmania",
        category: "WATER",
        excerpt: "Asia's Largest Raiforest Themed Water Park.",
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 69.00,
        promotion: "Buy 2 Free 1"),
    Activity(
        name: "Big Bucket Splash",
        category: "WATER",
        excerpt: "Calling young hearts to spend a day at BIG BUCKET SPLASH!",
        description:
            'Calling young hearts to spend a day at BIG BUCKET SPLASH!  Immerse in our thrilling and exciting water playground, where everyone is free to run their water-wild imaginations. It is a rainforest themed water play attraction that covers 1,000 sq ft of land features towering slides, shallow pool, rain bucket and many more. ',
        price: 69.00,
        promotion: "-69%"),
    Activity(
        name: "Water Playscape",
        category: "WATER",
        excerpt:
            "The perfect space for your little ones to cool off, located within The Buzz.ar",
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 69.00),
    Activity(
        name: "Beach Pool Club",
        category: "WATER",
        excerpt:
            "A premier event and dining destination, guests are invited to escape the hustle.",
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 69.00),
    Activity(
        name: "D'Swim Academy",
        category: "WATER",
        excerpt:
            "DSA is proud to be the LARGEST and only GOLD LEVEL AUTISM Recognised Swim Centre in Malaysia.",
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 69.00),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: <Widget>[
        _appBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
                padding: EdgeInsets.zero,
                //make this un-scrollable
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.375,
                    crossAxisSpacing: 20.0),
                itemCount: activities.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ActivityDetailScreen(activity: activity)));
                      },
                      child: _activityCard(activity));
                }),
          ),
        ),
        const SubscribeForm(),
      ],
    );
  }

  Widget _activityCard(Activity activity) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageAndPromotion(activity),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              activity.category.toUpperCase(),
              style: AppTextStyle.normalText().copyWith(fontWeight: FontWeight.bold,color: Colors.blue),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(activity.name.toUpperCase(),
                style: AppTextStyle.header3()),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              activity.excerpt,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.normalText().copyWith(color: Colors.black54),
            ),
            const Expanded(
                child: SizedBox(
              height: double.infinity,
            )),
            const Divider(
              color: Colors.black54,
              thickness: 0.5,
            ),
            Text("NOW", style: AppTextStyle.header3()),
            Text(
              'RM${activity.price.toStringAsFixed(2)}',
              style: AppTextStyle.title(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
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
          'assets/images/water_banner.png',
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

  Widget _imageAndPromotion(Activity activity) {
    return Stack(
      children: [
        Hero(
          transitionOnUserGestures: true,
          tag: activity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset('assets/images/confused_cat.jpeg'),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: activity.promotion != null
              ? Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.red),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 4.0),
                    child: Text(
                      activity.promotion!.toUpperCase(),
                      style: AppTextStyle.smallText().copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
