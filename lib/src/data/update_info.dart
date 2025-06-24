class UpdateInfo {
  const UpdateInfo({
    required this.versionName,
    required this.buildNumber,
    required this.title,
    required this.changelog,
    required this.isInStore,
    required this.isImportant,
    required this.storePackage,
    required this.githubURL,
  });

  final String versionName;
  final int buildNumber;
  final String title;
  final String changelog;
  final bool isInStore;
  final bool isImportant;
  final String storePackage;
  final String githubURL;
}
