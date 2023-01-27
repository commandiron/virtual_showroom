class Project {
  String companyImagePath;
  String name;
  List<String> generalViewImagePaths;
  List<String> planImagePaths;
  DateTime startDate;
  DateTime estimatedFinishDate;

  Project(
    {
      required this.companyImagePath,
      required this.name,
      required this.generalViewImagePaths,
      required this.planImagePaths,
      required this.startDate,
      required this.estimatedFinishDate
    }
  );

  static Project project1 = Project(
    companyImagePath: "assets/demirli_ins_logo.png",
    name: "Suadiye | Oran Apartmanı",
    generalViewImagePaths: [
      "assets/image_1.jpg",
      "assets/image_2.jpg"
    ],
    planImagePaths: [
      "assets/image_3.jpeg",
      "assets/image_4.jpg",
      "assets/image_5.jpg"
    ],
    startDate: DateTime(
        2022, 10, 7
    ),
    estimatedFinishDate: DateTime(
      2023, 11, 7
    )
  );
}