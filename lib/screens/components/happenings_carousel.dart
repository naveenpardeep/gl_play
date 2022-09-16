import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/happening.dart';

class HappeningsCarousel extends StatefulWidget {
  const HappeningsCarousel({Key? key}) : super(key: key);

  @override
  State<HappeningsCarousel> createState() => _HappeningsCarouselState();
}

class _HappeningsCarouselState extends State<HappeningsCarousel> {
  int _current = 0;

  final List<Happening> happenings = [
    Happening(
        title: "FLOATI'N'MOVIE",
        description:
            'Float the night away whilst enjoying a line-up of blockbuster films. You can hire a tube or why not watch the movie poolside on a deck chair. Selected food & drink outlets will be open to indulge in a tasty snack and quench your thirst.',
        tags: '(SPLASH)(CINEMA)(SplashMania)'),
    Happening(
        title: "TENT-TOBER CAMPING WEEKEND",
        description:
            'Join us for an overnight camping experience Saturday evening through Sunday morning. There will be activities to enjoy throughout the evening including campfires, kayaking animal feeding, bird watching, camping gear demonstrations and more.',
        tags: '(NATURE)(Payah Indah Discovery Wetlands)'),
    Happening(
        title: "RICK ROLL",
        description:
            'Never gonna give you up. Never gonna let you down. Never gonna run around and dessert you. Never gonna make you cry. Never gonna say good bye. Never gonna tell a lie and hurt you.',
        tags: '(MEME)(Rick Atsley)(LMAO)')
  ];

  late CarouselController _controller;

  @override
  void initState() {
    _controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "HAPPENINGS",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Builder(
                  builder: (context) {
                    return CarouselSlider(
                        carouselController: _controller,
                        // map the from list and create slider for each item in happenings array
                        items: happenings
                            .map((item) => _happeningCard(
                                item.title, item.description, item.tags))
                            .toList(),
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.65,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }
                            // autoPlay: false,
                            ));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  /// Some difficult shit here, try to understand it
                  children: happenings.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key,
                          duration: const Duration(milliseconds: 200)),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            _buttonWithBorderRadius("VIEW ALL", Colors.white, Colors.red)
          ],
        ),
      ),
    );
  }

  Widget _happeningCard(String title, String description, String tag) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(height: 40),
            Text(
              description,
              style: const TextStyle(fontSize: 20, color: Colors.black54),
            ),
            const SizedBox(height: 15),
            const Expanded(
                child: SizedBox(
              width: double.infinity,
            )),
            const Divider(
              color: Colors.black54,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  text: 'TAG: ',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: tag,
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                  ]),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buttonWithBorderRadius(
      String label, Color labelColor, Color buttonColor) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.015,
        bottom: MediaQuery.of(context).size.height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0),
        color: buttonColor,
      ),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 18, color: labelColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
