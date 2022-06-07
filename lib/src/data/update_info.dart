class UpdateInfo {
  String versionName;
  int buildNumber;
  String title;
  String changelog;
  bool isInStore;
  bool isImportant;
  String storePackage;
  String githubURL;

  UpdateInfo({
    required this.versionName,
    required this.buildNumber,
    required this.title,
    required this.changelog,
    required this.isInStore,
    required this.isImportant,
    required this.storePackage,
    required this.githubURL,
  });
}
