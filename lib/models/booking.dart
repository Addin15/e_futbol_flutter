class Booking {
  int? id;
  String? bookDate;
  int? time;

  Booking({
    this.id,
    this.bookDate,
    this.time,
  });

  factory Booking.fromMap(Map<String, dynamic> map) => Booking(
        id: map['id'],
        bookDate: map['book_date'],
        time: map['time'],
      );
}
