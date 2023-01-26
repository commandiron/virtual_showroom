class Project {
  String companyImagePath;
  String name;
  List<String> imagePaths;

  Project(
    {
      required this.companyImagePath,
      required this.name,
      required this.imagePaths,
    }
  );

  static Project project1 = Project(
    companyImagePath: "assets/demirli_ins_logo.png",
    name: "Oran Apartmanı",
    imagePaths: [
      "assets/image_1.jpg",
      "assets/image_2.jpg"
    ]
  );
}