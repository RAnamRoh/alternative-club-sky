class MediaUploadResponse {
  String name;
  String url;
  String contentType;
  String created;
  String createdBy;
  String updated;
  String updatedBy;

  MediaUploadResponse({
    required this.name,
    required this.url,
    required this.contentType,
    required this.created,
    required this.createdBy,
    required this.updated,
    required this.updatedBy,
  });

  // From JSON
  factory MediaUploadResponse.fromJson(Map<String, dynamic> json) {
    return MediaUploadResponse(
      name: json['name'],
      url: json['url'],
      contentType: json['contentType'],
      created: json['created'],
      createdBy: json['createdBy'],
      updated: json['updated'],
      updatedBy: json['updatedBy'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'contentType': contentType,
      'created': created,
      'createdBy': createdBy,
      'updated': updated,
      'updatedBy': updatedBy,
    };
  }
}
