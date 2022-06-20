class Review {
  int? orderID;
  int? star;
  String? comment;

  Review({
    this.orderID,
    this.star,
    this.comment,
  });

  factory Review.fromMap(Map<String, dynamic> map) => Review(
        orderID: map['order_id'],
        star: map['star'],
        comment: map['comment'],
      );
}
