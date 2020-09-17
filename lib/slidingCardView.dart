import 'package:flutter/material.dart';
import 'package:parallax/slidingCard.dart';

class SlidingCardView extends StatefulWidget {
  @override
  _SlidingCardViewState createState() => _SlidingCardViewState();
}

class _SlidingCardViewState extends State<SlidingCardView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);

    pageController.addListener(() {
      setState(() =>
          pageOffset = pageController.page); //<-- add listener and set state
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: [
          SlidingCard(
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: '4.20-30',
            assetName: 'food1.jpg',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Dawan District, Guangdong Hong Kong and Macao',
            date: '4.28-31',
            assetName: 'food2.jpg',
            offset: pageOffset - 1,
          ),
        ],
      ),
    );
  }
}
