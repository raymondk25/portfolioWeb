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
  final String url;

  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.technologies,
    @required this.url,
  });
}

final kProjectItems = [
  ProjectItem(
      url: 'https://github.com/raymondk25/ChatGPT-Flutter',
      image: 'images/chatGPT_clone.png',
      title: 'ChatGPT Clone',
      description:
          "Discover the new way of communication and productivity with ChatGPT, powered by OpenAI's advanced technology",
      technologies: ['Flutter', 'OpenAI API']),
  ProjectItem(
      url: 'https://github.com/raymondk25/news_app',
      image: 'images/news_app.png',
      title: 'News App',
      description: "Build a fully functional News app from scratch using 2 different Rest APIs",
      technologies: ['Flutter', 'API', 'Firebase']),
  ProjectItem(
      url: 'https://github.com/raymondk25/store_api_flutter',
      image: 'images/store_app.png',
      title: 'Store App',
      description: 'Build a mini Store app with Rest API from scratch',
      technologies: ['Flutter', 'API']),
  ProjectItem(
    url: 'https://github.com/raymondk25/Find-Party-Event-Flutter',
    image: 'images/eventz.png',
    title: 'EventZ',
    description: "Discover events & upcoming events in your city and near you.",
    technologies: ['Flutter'],
  ),
  ProjectItem(
    url: 'https://github.com/raymondk25/Movie-Description-Flutter',
    image: 'images/momovie.png',
    title: 'MOMOVIE',
    description: "Discover what to watch: popular tv shows, trending movies, top rated movies",
    technologies: ['Flutter', 'API'],
  ),
  ProjectItem(
      url: 'https://github.com/raymondk25/Coin-Tracker-Flutter',
      image: 'images/coin_tracker.png',
      title: 'Coin Tracker',
      description:
          "This crypto tracker app allows you to access real-time market data for Bitcoin, Ethereum and Binance Coin",
      technologies: ['Flutter', 'API']),
  ProjectItem(
    url: 'https://github.com/raymondk25/Food-Recipe-Flutter',
    image: 'images/food_recipes.png',
    title: 'ChefBook',
    description: "This app will makes your cooking easier, faster, and more convenient.",
    technologies: ['Flutter', 'API'],
  ),
  ProjectItem(
      url: 'https://github.com/raymondk25/Flash-Chat-Flutter',
      image: 'images/chat_screen.png',
      title: 'Flash Chat',
      description: 'Flash Chat is a modern messaging app where users can sign up and log in to chat',
      technologies: ['Flutter', 'Firebase']),
  ProjectItem(
    url: 'https://github.com/raymondk25/BMI-Calculator-Flutter',
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
    return MobileDesktopViewBuilder(mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
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
