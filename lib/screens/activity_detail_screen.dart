import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gl_play/styles/text_style.dart';

import '../model/acitivity.dart';

class ActivityDetailScreen extends StatefulWidget {
  final Activity activity;
  const ActivityDetailScreen({required this.activity, Key? key})
      : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  final List<Activity> recommendedActivities = [
    Activity(
        name: "Beach Pool Club",
        category: "WATER",
        excerpt:
            "A premier event and dining destination, guests are invited to escape the hustle.",
        description: '',
        price: 69.00),
    Activity(
        name: "D'Swim Academy",
        category: "WATER",
        excerpt:
            "DSA is proud to be the LARGEST and only GOLD LEVEL AUTISM Recognised Swim Centre in Malaysia.",
        description: '',
        price: 69.00),
  ];

  final List<bool> _isOpen = [false,false,false,false];
  //final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //_scrollController.addListener(_onScrollEvent);
  }

  @override
  void dispose() {
    super.dispose();
    //_scrollController.dispose();
  }
  // void _onScrollEvent(){
  //   if(_scrollController.position.atEdge){
  //     final isTop = _scrollController.position.pixels;
  //     if( isTop != 0){
  //       showModalBottomSheet(
  //           context: context,
  //           builder: (_) => _bestOfferModal(),
  //           elevation: 0,
  //         isDismissible: true,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.0),
  //         ),
  //         backgroundColor: Colors.white,
  //         constraints: const BoxConstraints(
  //           minHeight: 100,
  //           maxHeight: 200,
  //         )
  //       );
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(),
          _activityDetailSection(widget.activity),
          _expansionPanelList(),
          _totalReviewScoreSection(),
          _gallerySection(),
          _customerReviewsSection(),
          _recommendedActivitiesSection(recommendedActivities),
          //_specialOfferSection(),
        ],
      ),
      //bottomSheet: widget.activity.promotion != null ? _bottomSheet() : null,
    );
  }



  Widget _specialOfferSection(){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            //padding: EdgeInsets.only(top: 10.0),
            margin: const EdgeInsets.only(top: 15.0),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Best Offer',style: AppTextStyle.normalText(),),
                  Text('buy 1 free 1'.toUpperCase(), style: AppTextStyle.bigAssText()),
                  Text('RM99.00 per pax', style: AppTextStyle.normalText().copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10,),
                  _buttonWithBorderRadius('BOOK NOW', Colors.white, Colors.red)
                ],
              ),
            ),
          ),
        ),
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

  Widget _recommendedActivitiesSection(List<Activity> recommendedActivities){
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ACTIVITIES YOU MAY INTERESTED',
              style: AppTextStyle.header1(),
            ),
            GridView.builder(
                padding: EdgeInsets.zero,
                //make this un-scrollable
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                    crossAxisSpacing: 20.0),
                itemCount: recommendedActivities.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final activity = recommendedActivities[index];
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ActivityDetailScreen(
                                activity: activity)));
                      },
                      child: _recommendedActivityCard(activity));
                })
          ],
        ),
      ),
    );
  }

  Widget _customerReviewsSection(){
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _karenReview(),
            _stevenReview(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                  child: Text(
                    'VIEW MORE',
                    style:
                    AppTextStyle.header3(),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalReviewScoreSection(){
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'REVIEWS',
              style: AppTextStyle.header2(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '5.0',
                  style: AppTextStyle.bigAssText(),
                ),
                RatingBar.builder(
                  itemSize: 36,
                  ignoreGestures: true,
                  initialRating: 5,
                  // minRating: 1,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
                Text('69 reviews',style: AppTextStyle.normalText(),),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _gallerySection(){
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text("GALERY", style: AppTextStyle.header2(),),
                  Text("#Gamudaplay", style: AppTextStyle.normalText().copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(width: 10,),
              Expanded(
                  child: Image.asset(
                    'assets/images/confused_cat.jpeg',
                    fit: BoxFit.contain,
                  )),
              Expanded(
                  child: Image.asset(
                    'assets/images/confused_cat.jpeg',
                    fit: BoxFit.contain,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _expansionPanelList(){
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ExpansionPanelList(
          elevation: 0,
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.article,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Ticket Rate'),
                  ],
                );
              },
              body: const Text('Ticket Rates'),
              isExpanded: _isOpen[0],
            ),
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.location_on,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Location'),
                  ],
                );
              },
              body: const Text('Location? Show map here?'),
              isExpanded: _isOpen[1],
            ),
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.access_time_outlined,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Operation Hours'),
                  ],
                );
              },
              body: const Text('Show hidden Operation Hours'),
              isExpanded: _isOpen[2],
            ),
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.question_answer,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Enquiry'),
                  ],
                );
              },
              body: const Text('Show hidden Enquiry'),
              isExpanded: _isOpen[3],
            ),
          ],
          expansionCallback: (index, isExpanded){
            setState(() {
              _isOpen[index] = !_isOpen[index];
            });
          },
        ),
      ),
    );
  }

  Widget _recommendedActivityCard(Activity activity) {
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.blue),
            ),
            Text(activity.name.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black)),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 20,
                ),
                Text(
                  '5.0',
                  style: AppTextStyle.biggerText(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _karenReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black12),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('KAREN',style: AppTextStyle.header2(),),
                RatingBar.builder(
                  itemSize: 24,
                  ignoreGestures: true,
                  initialRating: 5,
                  // minRating: 1,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(right: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
                Text('Highly Recommended',style: AppTextStyle.normalText().copyWith(fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Text('31 FEB 2022',style: AppTextStyle.normalText()),
        const SizedBox(height: 10,),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            style: AppTextStyle.normalText()
        ),
        const SizedBox(height: 10,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.thumb_up_sharp),
              const SizedBox(width: 10,),
              Text('HELPFUL',style: AppTextStyle.normalText())],
          ),
        ),
        const SizedBox(height: 10,),
        Center(
          child: Text('69 People Found This Helpful',style: AppTextStyle.normalText(),),
        ),
        const SizedBox(height: 10,),
        const Divider(
          thickness: 0.5,
          color: Colors.black45,
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
  Widget _stevenReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black12),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STEVEN',style: AppTextStyle.header2(),),
                RatingBar.builder(
                  itemSize: 24,
                  ignoreGestures: true,
                  initialRating: 5,
                  // minRating: 1,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(right: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
                Text('Highly Recommended',style: AppTextStyle.normalText().copyWith(fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Text('31 FEB 2022',style: AppTextStyle.normalText()),
        const SizedBox(height: 10,),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            style: AppTextStyle.normalText()
        ),
        const SizedBox(height: 10,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.thumb_up_sharp),
              const SizedBox(width: 10,),
              Text('HELPFUL',style: AppTextStyle.normalText())],
          ),
        ),
        const SizedBox(height: 10,),
        Center(
          child: Text('69 People Found This Helpful',style: AppTextStyle.normalText(),),
        ),
        const SizedBox(height: 10,),
        const Divider(
          thickness: 0.5,
          color: Colors.black45,
        ),
        const SizedBox(height: 10,),
      ],
    );
  }

  Widget _activityDetailSection(Activity activity){
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: activity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/images/confused_cat.jpeg'),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.category.toUpperCase(),
                      style: AppTextStyle.header2().copyWith(color: Colors.blue),
                    ),
                    Text(
                      activity.name.toUpperCase(),
                      style: AppTextStyle.header2(),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 32,
                ),
                Text(
                  '5.0',
                  style: AppTextStyle.title().copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Icon(Icons.share_outlined, size: 24,),
                const SizedBox(width: 10,),
                Text('Share this',style: AppTextStyle.bigText(),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Icon(Icons.favorite_outline,size: 24,),
                const SizedBox(width: 10,),
                Text('Add to wishlist',style: AppTextStyle.bigText())
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(activity.description,style: AppTextStyle.bigText()),
            ),

            Text(
              'HIGHLIGHTS',
              style: AppTextStyle.header4(),
            ),
            _highlightSegment(),
            _highlightSegment(),
            _highlightSegment(),
          ],
        ),
      ),
    );
  }

  Widget _highlightSegment(){
    return Padding(
      padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 40,
          ),
          const SizedBox(width: 10,),
          Expanded(
              child: Text(
                'Rainforest themed water play attraction that covers 1,000 sq ft of land',
                overflow: TextOverflow.visible,
                style: AppTextStyle.bigText(),
              ))
        ],
      ),
    );
  }



  Widget _appBar() {
    return SliverAppBar(
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.blueAccent, //change your color here
      ),
      title: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
            height: 40,
            alignment: FractionalOffset.center,
          )),
      backgroundColor: Colors.white,
      //expandedHeight: 400,
      //pinned: true,
      floating: true,
      centerTitle: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Divider(
          height: 1,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buttonWithBorderRadius(String label, Color labelColor, Color buttonColor) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
      child:  Center(
        child: Text(
          label,
          style: AppTextStyle.header3().copyWith(color: labelColor),
        ),
      ),
    );
  }

  Widget _bottomSheet(){
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            //padding: EdgeInsets.only(top: 10.0),
            margin: const EdgeInsets.only(top: 15.0),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Best Offer',style: AppTextStyle.normalText(),),
                  Text('buy 1 free 1'.toUpperCase(), style: AppTextStyle.bigAssText()),
                  Text('RM99.00 per pax', style: AppTextStyle.normalText().copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10,),
                  _buttonWithBorderRadius('BOOK NOW', Colors.white, Colors.red)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}
