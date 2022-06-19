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
  int? startDayTime;
  int? endDayTime;
  int? endNightTime;

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
    this.startDayTime,
    this.endDayTime,
    this.endNightTime,
  });

  factory Arena.fromMap(Map<String, dynamic> map) => Arena(
        id: map['id'],
        arenaName: map['arena_name'],
        providerName: map['provider_name'],
        numberField: map['number_field'],
        grassType: map['grass_type'],
        numberLight: map['number_light'],
        subsBench: map['subs_bench'] == 1 ? true : false,
        dayPrice: map['day_price'].toDouble(),
        nightPrice: map['night_price'].toDouble(),
        refferee: map['refferee'] == 1 ? true : false,
        spectatorsSeat: map['spectators_seat'] == 1 ? true : false,
        address: map['arena_address'],
        startDayTime: int.parse(map['start_day_time']),
        endDayTime: int.parse(map['end_day_time']),
        endNightTime: int.parse(map['end_night_time']),
      );
}
