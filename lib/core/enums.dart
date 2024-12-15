enum Category {
  all("All"),
  recreational("🏖 Recreational Sites"),
  zoo("🦍 Zoo"),
  musuem("🖼 Musuem"),
  historicalSites("🕌 Historical Site");

  final String name;
  const Category(this.name);
}

enum TextWeight { normal, medium, semiBold, bold }
