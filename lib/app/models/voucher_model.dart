class Voucher{
  final String id;
  final String code;
  final DateTime expiryDate;
  final double discount;

  Voucher({ required this.id, required this.code, required this.expiryDate,required this.discount});

  factory Voucher.fromJson(Map<String, dynamic> json){
    return Voucher(
      id: json['id'],
      code: json['code'],
      expiryDate: DateTime.parse(json['expiryDate']),
      discount: json['discount']
    );
  }

}