import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healtho_ui_clone/ui/shared/ui_helper.dart';

// 01 - ilk/geçiş ekranı
class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtilInit();
    return Scaffold(
      body: _centerWidget,
    );
  }

  // bir sonraki sayfa
  void _navigateToHomePage() {
    Future.delayed(
      // Dikkat, sabit süreli splash süresi, standartta kabul görülecek bir durum değildir.
      Duration(milliseconds: UIHelper.SPLASH_DURATION),
      () {
        Navigator.of(context).pushNamed('/onboard');
      },
    );
  }

  void _screenUtilInit() => ScreenUtil().init(context);

  Widget get _centerWidget => Center(
        child: Image.asset(
          UIHelper.HEALTHO_ICON,
        ),
      );
}
