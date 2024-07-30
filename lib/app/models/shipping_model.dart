class Shipping{
  final String id;
  final String name;
  final double cost;
  final DateTime timeEnd;
  final String icon;
  final DateTime timeStart;

  Shipping({
    required this.id,
    required this.name,
    required this.cost,
    required this.timeEnd,
    required this.icon,
    required this.timeStart,
  });

  factory Shipping.fromJson(Map<String, dynamic> json){
    return Shipping(
      id: json['id'],
      name: json['name'],
      cost: json['cost'] as double,
      timeEnd: DateTime.parse(json['timeEnd']),
      icon: json['icon'],
      timeStart: DateTime.parse(json['timeStart']),
    );
  }
}