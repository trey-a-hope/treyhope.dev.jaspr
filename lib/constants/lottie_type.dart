enum LottieType {
  underConstruction('/animations/under_construction_animation.json'),
  loading('/animations/loading_animation.json')
  ;

  const LottieType(this.path);
  final String path;
}
