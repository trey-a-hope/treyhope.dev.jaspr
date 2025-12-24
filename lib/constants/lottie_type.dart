enum LottieType {
  underConstruction('assets/under_construction_animation.json'),
  loading('assets/loading_animation.json')
  ;

  const LottieType(this.path);
  final String path;
}
