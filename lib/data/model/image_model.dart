class Images {
  final int id;
  final String? name;
  final String? icon;
  final bool? isActive;
  final String? dateCreated;
  final String? dateUpdated;

  Images({
    required this.id,
    required this.name,
    required this.icon,
    required this.isActive,
    required this.dateCreated,
    required this.dateUpdated,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      isActive: json['is_active'],
      dateCreated: json['date_created'],
      dateUpdated: json['date_updated'],
    );
  }
}
