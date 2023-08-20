class News {
  String title;
  String subtitle;
  String buttonText;
  String? url;
  dynamic nextPage;
  late String actionType; // Website or page?
  String image;

  News.website({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.url,
    required this.image,
  }) {
    actionType = "website";
  }

  News.page({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.nextPage,
    required this.image,
  }) {
    actionType = "page";
  }
}