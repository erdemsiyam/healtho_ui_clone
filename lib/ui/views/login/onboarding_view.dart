import 'package:flutter/material.dart';
import 'package:healtho_ui_clone/ui/shared/text_style.dart';
import 'package:healtho_ui_clone/ui/shared/ui_helper.dart';
import 'package:healtho_ui_clone/ui/shared/widget/onboard_widget.dart';

// 02 - tanıtım ekranı
class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _pageView),
            _indicatorPageView,
            _nextButtonWrap,
          ],
        ),
      ),
    );
  }

  void _onPageChangeEvent(int number) {
    if (number == UIHelper.ONBOARD_PAGE_COUNT) {
      // son sayfadır, login sayfasına gidilir
      _navigateLoginPage();
    } else {
      // güncel sayfa sergilenir
      setState(() {
        _currentPageIndex = number;
      });
    }
  }

  // bir sonraki sayfa
  void _navigateLoginPage() {
    // şu rotaya git, bundan önceki sayfaları stacktan kaldır
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  AppBar get _appBar => AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: UIHelper.Space0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          ActionChip(
            label: Text(
              'skip',
              style: TextStyle(letterSpacing: 2),
            ),
            elevation: UIHelper.Space0,
            onPressed: _navigateLoginPage,
          ),
          SizedBox(
            width: UIHelper.Space15,
          ),
        ],
      );

  Widget get _indicatorPageView => SizedBox(
        height: UIHelper.Space50,
        width: UIHelper.dynamicWidth(300),
        child: ListView.builder(
          itemCount: UIHelper.ONBOARD_PAGE_COUNT,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                radius: 5,
                backgroundColor:
                    index == _currentPageIndex ? Colors.yellow : Colors.grey,
              ),
            );
          },
        ),
      );

  Widget get _nextButtonWrap => SizedBox(
        width: UIHelper.dynamicHeight(UIHelper.Space200),
        child: RaisedButton(
          child: Text(
            'NEXT',
            style: onBoardingNextButtonStyle,
          ),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIHelper.Space25),
              borderSide: BorderSide(color: Colors.white10)),
          onPressed: () {
            _onPageChangeEvent(_currentPageIndex);
            _pageController.nextPage(
              duration: Duration(milliseconds: UIHelper.ONBOARD_NEXT_DURATION),
              curve: Curves.easeIn,
            );
          },
        ),
      );
  Widget get _pageView => PageView(
        onPageChanged: (page) {
          _onPageChangeEvent(page);
        },
        controller: _pageController,
        children: [
          OnBoardWidget(
            title: "Exercises",
            subTitle: "To Your Personalized Profile",
            imagePath: "onboard1",
          ),
          OnBoardWidget(
            title: "Keep Eye On Health Tracking",
            subTitle: "Log & reminder your activities",
            imagePath: "onboard2",
          ),
          OnBoardWidget(
            title: "Check Your Progress",
            subTitle: "An tracking calendar",
            imagePath: "onboard3",
          ),
        ],
      );
}
