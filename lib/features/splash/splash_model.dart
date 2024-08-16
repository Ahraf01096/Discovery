
class SplashModel {
  final String title;
  final String subTitle;
  final String image;

  SplashModel({
    required this.title,
    required this.subTitle,
    required this.image
  });
}

List<SplashModel> listOfItems = [
  SplashModel(
    title: "Discovery",
    subTitle: "Looking For New Places To Visit? \n We\'ve Got Your Coverd",
    image: 'images/splash/splash1.jpg',
  ),
  SplashModel(
    title: "Discovery",
    subTitle: "Plan Your Trip And Explore The Beauty \n Of Egypt With Us",
    image: 'images/splash/splash2.jpg',
  ),
  SplashModel(
    title: "Discovery",
    subTitle: "Promote Your Favourite Places With Us..",
    image:  'images/splash/splash3.jpeg',
  ),
];