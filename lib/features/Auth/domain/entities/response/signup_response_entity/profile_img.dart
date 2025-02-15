class ProfileImg {
  String? url;
  String? id;

  ProfileImg({this.url, this.id});

  factory ProfileImg.fromJson(Map<String, dynamic> json) => ProfileImg(
        url: json['url'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'id': id,
      };
}
