class TopDestinationResponse {
  final int id;
  final String title;
  final String subTitle;
  final String imageUrl;
  final String actionSlug;
  final int displayOrder;
  final String startDate;
  final String endDate;
  final String description;

  TopDestinationResponse({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.actionSlug,
    required this.displayOrder,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  factory TopDestinationResponse.fromJson(Map<String, dynamic> json) => TopDestinationResponse(
    id: json["id"],
    title: json["title"],
    subTitle: json["subTitle"] ?? "" ,
    imageUrl: json["imageUrl"] ?? "",
    actionSlug: json["actionSlug"] ?? "",
    displayOrder: json["displayOrder"] ?? 1,
    startDate: json["startDate"] ?? "",
    endDate: json["endDate"] ?? "",
    description: json["description"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subTitle": subTitle,
    "imageUrl": imageUrl,
    "actionSlug": actionSlug,
    "displayOrder": displayOrder,
    "startDate": startDate,
    "endDate": endDate,
    "description": description,
  };


}