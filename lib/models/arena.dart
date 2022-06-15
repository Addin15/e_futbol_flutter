class Arena {
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
        arenaName: map['arena_name'],
        providerName: map['provider_name'],
        numberField: int.parse(map['number_field']),
        grassType: map['grass_type'],
        numberLight: int.parse(map['number_light']),
        subsBench: map['subs_bench'],
        dayPrice: double.parse(map['day_price']),
        nightPrice: double.parse(map['night_price']),
        refferee: map['refferee'],
        spectatorsSeat: map['spectators_seat'],
        address: map['arena_address'],
      );
}
