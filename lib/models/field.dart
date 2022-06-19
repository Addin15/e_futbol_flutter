class Field {
  int? id;
  String? name;

  Field({
    this.id,
    this.name,
  });

  factory Field.fromMap(Map<String, dynamic> map) => Field(
        id: map['id'],
        name: map['field_name'],
      );
}
