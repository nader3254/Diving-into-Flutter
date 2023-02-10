import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Page One
class Page extends StatelessWidget {
  String img, text1, text2;
  Page(this.img, this.text1, this.text2);

  Widget pageImage(String imgURL) {
    return Image(
      image: AssetImage(
        imgURL,
      ),
      height: 220.0,
      width: 220.0,
    );
  }

  Widget pageTxt(String txt, bool headline) {
    if (headline == true) {
      return Text(txt,
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'Raleway',
              color: Colors.white.withOpacity(1.0),
              fontWeight: FontWeight.bold));
    } else {
      return Text(
        txt,
        style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.6)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: Colors.indigo,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: pageImage(img),
          ),
          const SizedBox(height: 30.0),
          Container(
            margin: const EdgeInsets.only(left: 8),
            alignment: Alignment.topLeft,
            child: pageTxt(text2, true),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 8),
            alignment: Alignment.center,
            child: pageTxt(text1, false),
          ),
        ],
      ),
    );
  }
}

class MyIntroPage extends StatefulWidget {
  const MyIntroPage({super.key});

  @override
  State<MyIntroPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyIntroPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPageView = 0, lastIndex = 0;

  BoxDecoration MainContainerStyling() {
    return const BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Color(0xFF3594DD),
        Color(0xFF4563DB),
        Color(0xFF5036D5),
        Color(0xFF5B16D0),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.4, 0.7, 0.9],
    ));
  }

  Widget SkipButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () => print('Skip'),
        child:
            Text("skip", style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }

  Widget PageViewWidget() {
    String p1_img = 'assets/images/onboarding0.png';
    String p2_img = 'assets/images/onboarding1.png';
    String p3_img = 'assets/images/onboarding2.png';

    String p1_txt =
        'Lorem ipsum 1 dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.';
    String p2_txt =
        'Lorem ipsum 2 dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.';
    String p3_txt =
        'Lorem ipsum 3 dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.';

    String p1_txt1 = 'Connect people\naround the world';

    String p2_txt1 = 'Live your life smarter\nwith us!';
    String p3_txt1 = 'Get a new experience\nof imagination';
    Page page1 = Page(p1_img, p1_txt, p1_txt1);
    Page page2 = Page(p2_img, p2_txt, p2_txt1);
    Page page3 = Page(p3_img, p3_txt, p3_txt1);

    return Container(
      height: 420.0,
      child: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          print('index is ${index}');

          setState(() {
            currentPageView = index;
          });
        },
        physics: ClampingScrollPhysics(),
        children: [page1, page2, page3],
      ),
    );
  }

  Widget indicatorElement(int button_NO) {
    // bool isActive = false;
    // if (button_NO == currentPageView) {
    //   isActive = true;
    // } else {
    //   isActive = false;
    // }
    return Container(
        child: AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: (button_NO == currentPageView) ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color:
            (button_NO == currentPageView) ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: TextButton(
        onPressed: () {
          print('page ${button_NO}');
          lastIndex = button_NO;
          _pageController.animateToPage(button_NO,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        child: const Text(''),
      ),
    ));
  }

  List<Widget> test() {
    List<Widget> mylist = [];
    for (int i = 0; i < 3; i++) {
      mylist.add(indicatorElement(i));
    }
    return mylist;
  }

  Widget PageViewIndicator() {
    List<Widget> mlst = test();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: mlst,
    );
  }

  Widget NextButton() {
    List<Widget> mlst = test();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            lastIndex++;
            _pageController.animateToPage(lastIndex,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
          child: const Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 30.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          SystemUiOverlayStyle.light, //for making the system bar dark or light
      child: Container(
        decoration: MainContainerStyling(), //background for application
        child: Column(
          children: <Widget>[
            SkipButton(),
            PageViewWidget(),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: PageViewIndicator(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              //alignment: Alignment.bottomCenter,
              child: NextButton(),
            )
          ],
        ),
      ),
    ));
  }
}
