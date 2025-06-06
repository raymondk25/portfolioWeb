import 'package:after_layout/after_layout.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_web/aboutMe/aboutMe_view.dart';
import 'package:portofolio_web/drawer/drawer_view.dart';
import 'package:portofolio_web/experience/experience_view.dart';
import 'package:portofolio_web/footer/footer_view.dart';
import 'package:portofolio_web/header/header_view.dart';
import 'package:portofolio_web/navigation_bar/navigation_bar_view.dart';
import 'package:portofolio_web/portfolio/back_to_top_button.dart';
import 'package:portofolio_web/project/project_view.dart';
import 'package:portofolio_web/skills/skills_view.dart';
import 'package:provider/provider.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({
    Key? key,
  }) : super(key: key);

  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin {
  final aboutMe = GlobalKey();
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final blogKey = GlobalKey();
  List<NavigationItem> navigationItems = [];

  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem('About Me', key: aboutMe),
        NavigationItem('Projects', key: projectKey),
        NavigationItem('Skills', key: skillsKey),
        NavigationItem('Experiences', key: experienceKey),
        // NavigationItem('Blog', key: blogKey),
      ];
    });
  }

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(update: (_, __) {
          return navigationItems;
        }),
        ChangeNotifierProvider<ScrollController>(create: (_) {
          return scrollController;
        }),
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                FadeInDown(
                    duration: Duration(milliseconds: 1000),
                    child: NavigationBarView()),
                FadeInDown(
                    duration: Duration(milliseconds: 1000),
                    child: HeaderView()),
                FadeInDown(
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 1500),
                    child: AboutMe(key: aboutMe)),
                FadeInDown(
                  delay: Duration(milliseconds: 2000),
                  duration: Duration(milliseconds: 2000),
                  child: ProjectView(
                    key: projectKey,
                  ),
                ),
                FadeInDown(
                    delay: Duration(milliseconds: 5000),
                    duration: Duration(milliseconds: 2000),
                    child: SkillsView(key: skillsKey)),
                FadeInDown(
                    delay: Duration(milliseconds: 5500),
                    duration: Duration(milliseconds: 2000),
                    child: ExperienceView(key: experienceKey)),
                // FadeInDown(
                //     delay: Duration(milliseconds: 6300),
                //     duration: Duration(milliseconds: 2000),
                //     child: BlogView(key: blogKey)),
                FadeInDown(
                    delay: Duration(milliseconds: 5500),
                    duration: Duration(milliseconds: 2000),
                    child: FooterView()),
              ],
            ),
          ),
        ),
        floatingActionButton: BackToTopButton(),
      ),
    );
  }
}

class NavigationItem {
  final String text;
  final GlobalKey key;

  NavigationItem(this.text, {required this.key});

  double get position => _getPosition(key);
}

double _getPosition(GlobalKey key) {
  if (key.currentContext == null) return 0;
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffSet = position.dy;
  return scrollOffSet;
}
