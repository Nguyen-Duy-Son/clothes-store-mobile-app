class PayMethod {
  final String id;
  final String name;
  final String icon;
  final double totalMoney;

  PayMethod({required this.name, required this.icon,required this.id,required this.totalMoney});
  factory PayMethod.fromJson(Map<String, dynamic> json) {
    return PayMethod(
      id: json['id'],
      name: json['name'],
      icon: json['icon'] as String,
      totalMoney: json['totalMoney'] ,
    );
  }
}
