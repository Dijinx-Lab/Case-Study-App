class Team {
  final int? id;
  final String? name;
  final String? code;
  final DateTime? createdOn;
  final dynamic updatedOn;
  final dynamic deletedOn;

  Team({
    this.id,
    this.name,
    this.code,
    this.createdOn,
    this.updatedOn,
    this.deletedOn,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        updatedOn: json["updatedOn"],
        deletedOn: json["deletedOn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "createdOn": createdOn?.toIso8601String(),
        "updatedOn": updatedOn,
        "deletedOn": deletedOn,
      };
}
