import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_web/components/desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_view_builder.dart';
import 'package:portofolio_web/project/project_item_body.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: 'images/eventz.png',
    title: 'EventZ',
    description:
        "Discover events & upcoming events in your city and near you.",
    technologies: ['Flutter'],
  ),
  ProjectItem(
    image: 'images/momovie.png',
    title: 'MOMOVIE',
    description:
        "Discover what to watch: popular tv shows, trending movies, top rated movies",
    technologies: ['Flutter', 'API'],
  ),
  ProjectItem(
    image: 'images/food_recipes.png',
    title: 'ChefBook',
    description:
        "This app will makes your cooking easier, faster, and more convenient.",
    technologies: ['Flutter', 'API'],
  ),
  ProjectItem(
      image: 'images/coin_tracker.png',
      title: 'Coin Tracker',
      description:
          "This crypto tracker app allows you to access real-time market data for Bitcoin, Ethereum and Binance Coin",
      technologies: ['Flutter', 'API']),
  ProjectItem(
      image: 'images/todoey_app.png',
      title: 'Todoey',
      description:
          "Todoey is the task management app that makes it easy to stay organised and manage your life",
      technologies: ['Flutter']),
  ProjectItem(
      image: 'images/welcome_screen.png',
      title: 'Welcome Page',
      description:
          'Welcome page is a first screen that appears when you first time download the app',
      technologies: ['Flutter', 'Firebase']),
  ProjectItem(
      image: 'images/login_pages.png',
      title: 'Login Page',
      description:
          'A login page is an entry app by entering a username and password',
      technologies: ['Flutter']),
  ProjectItem(
      image: 'images/chat_screen.png',
      title: 'Flash Chat',
      description:
          'Flash Chat is a modern messaging app where users can sign up and log in to chat',
      technologies: ['Flutter', 'Firebase']),
  ProjectItem(
    image: 'images/bmi-calculator.png',
    title: 'BMI Calculator',
    description:
    "Calculate your Body Mass Index (BMI) based on the relevant information on body weight, height, age and sex",
    technologies: ['Flutter'],
  ),
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
  static const title = 'Projects';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.title,
      children: [
        SizedBox(height: 20),
        FadeInDown(
          delay: Duration(milliseconds: 2300),
          duration: Duration(milliseconds: 2300),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var item = 0; item < 3; item++)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProjectItemBody(item: kProjectItems[item]),
                ))
            ],
          ),
        ),
        FadeInDown(
          delay: Duration(milliseconds: 3300),
          duration: Duration(milliseconds: 2300),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var item = 3; item < 6; item++)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProjectItemBody(item: kProjectItems[item]),
                ))
            ],
          ),
        ),
        FadeInDown(
          delay: Duration(milliseconds: 4300),
          duration: Duration(milliseconds: 2300),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var item = 6; item < kProjectItems.length; item++)
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProjectItemBody(item: kProjectItems[item]),
                    ))
            ],
          ),
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [for (final item in kProjectItems) ProjectItemBody(item: item)],
    );
  }
}
