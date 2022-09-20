import 'package:flutter/material.dart';

class PlanYourIdealDay extends StatefulWidget {
  const PlanYourIdealDay({Key? key}) : super(key: key);

  @override
  State<PlanYourIdealDay> createState() => _PlanYourIdealDayState();
}

class _PlanYourIdealDayState extends State<PlanYourIdealDay> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "PLAN YOUR IDEAL DAY",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Select Your Preference Activities to Personalize Your Experience",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            _preferenceActivitiesPlaceHolder(),
            _preferenceActivitiesPlaceHolder(),
            _preferenceActivitiesPlaceHolder(),
          ],
        ),
      ),
    );
  }

  Widget _preferenceActivitiesPlaceHolder() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placeholder(
                  fallbackWidth: MediaQuery.of(context).size.width / 5,
                  fallbackHeight: MediaQuery.of(context).size.height / 10),
              const Text(
                "WATER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Icon(
                Icons.check_circle_outline,
                size: 50,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placeholder(
                  fallbackWidth: MediaQuery.of(context).size.width / 5,
                  fallbackHeight: MediaQuery.of(context).size.height / 10),
              const Text(
                "WATER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Icon(
                Icons.check_circle_outline,
                size: 50,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placeholder(
                  fallbackWidth: MediaQuery.of(context).size.width / 5,
                  fallbackHeight: MediaQuery.of(context).size.height / 10),
              const Text(
                "WATER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Icon(
                Icons.check_circle_outline,
                size: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
