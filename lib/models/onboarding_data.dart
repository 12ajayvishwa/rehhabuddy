class Details {
  String imgUrl;
  String title;
  String desc;
  String headline;

  Details(this.imgUrl, this.title, this.desc, this.headline);
}

List<Details> details = [
  Details(
      "assets/images/doctor.svg",
      "India’s First Multidisciplinary\nTele-Rehabilitation Platform ",
      "Video?Audio Call & Chat",
      "Get Instant Appointments"),
  Details("assets/images/health.svg", "Wide Range Of", "Health & Lab Tests",
      "Easy At Home Sample Collection"),
  Details("assets/images/doctor.svg", "Access your", "Health Insurance",
      "Easy Cashless Hospitalisation"),
  Details("assets/images/health.svg", "Complete Healthcare with",
      "Rehab Buddy Gold", "Save On Subscription")
];
