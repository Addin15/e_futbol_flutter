class Arena {
  int? id;
  String? arenaName;
  String? providerName;
  int? numberField;
  String? grassType;
  int? numberLight;
  bool? subsBench;
  double? dayPrice;
  double? nightPrice;
  bool? refferee;
  bool? spectatorsSeat;
  String? address;

  Arena({
    this.id,
    this.arenaName,
    this.providerName,
    this.numberField,
    this.grassType,
    this.numberLight,
    this.subsBench,
    this.dayPrice,
    this.nightPrice,
    this.refferee,
    this.spectatorsSeat,
    this.address,
  });

  factory Arena.fromMap(Map<String, dynamic> map) => Arena(
        id: map['id'],
        arenaName: map['arena_name'],
        providerName: map['provider_name'],
        numberField: int.parse(map['number_field']),
        grassType: map['grass_type'],
        numberLight: int.parse(map['number_light']),
        subsBench: int.parse(map['subs_bench']) == 1 ? true : false,
        dayPrice: double.parse(map['day_price']),
        nightPrice: double.parse(map['night_price']),
        refferee: int.parse(map['refferee']) == 1 ? true : false,
        spectatorsSeat: int.parse(map['spectators_seat']) == 1 ? true : false,
        address: map['arena_address'],
      );
}
