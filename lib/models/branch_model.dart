class Branch {
  int? id;
  String? name;
  String? nameEn;
  String? phone;
  String? whatsapp;

  Branch({
    this.id,
    this.name,
    this.nameEn,
    this.phone,
    this.whatsapp,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    phone: json["phone"],
    whatsapp: json["whatsapp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "phone": phone,
    "whatsapp": whatsapp,
  };
}