import 'package:flutter/material.dart';
import 'package:flutterweb/util/keys.dart';
import 'package:flutterweb/util/sizingninfo.dart';
import 'package:flutterweb/values/responsive.dart';
import 'package:flutterweb/widgets/components/carousel.dart';
import 'package:flutterweb/widgets/mobileComponents/menuTap.dart';
import 'package:flutterweb/widgets/mobileComponents/shopAppBar.dart';
import 'package:flutterweb/widgets/mobileComponents/shopDrawer.dart';
import 'package:flutterweb/widgets/webComponents/body/sectionList.dart';
import 'package:flutterweb/widgets/webComponents/footer/footer.dart';
import 'package:flutterweb/widgets/webComponents/header/header.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// import 'package:goodcoffee/Widgets/WebComponents/Body/MenuSection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;
  double _opacity = 0;

  late AutoScrollController autoScrollController;
  bool _isVisible = false;
  late ResponsiveApp responsiveApp;

  _scrollListener() {
    setState(() {
      _scrollPosition = autoScrollController.position.pixels;
    });
  }

  @override
  void initState() {

    autoScrollController = AutoScrollController(
      //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);

    autoScrollController.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);

    _opacity = _scrollPosition < responsiveApp.opacityHeight
        ? _scrollPosition / responsiveApp.opacityHeight
        : 1;

    _isVisible = _scrollPosition >= responsiveApp.menuHeight;
    return Scaffold(
        key: homeScaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: Visibility(
          visible: _isVisible,
          child: FloatingActionButton(
            onPressed: () => {
              autoScrollController.scrollToIndex(0)},
            child:  const Icon(Icons.arrow_upward),
          ),
        ),
        appBar:
      isMobileAndTablet(context)
            ? ShopAppBar(_opacity)
            : Header(_opacity),
        drawer: ShopDrawer(),
        body: ListView(controller: autoScrollController, children: [
          Carousel(),
         isMobileAndTablet(context)
              ? MenuTap()
              : SectionListView(autoScrollController),
          isMobileAndTablet(context) ? const SizedBox.shrink() : Footer()
        ]));
  }
}