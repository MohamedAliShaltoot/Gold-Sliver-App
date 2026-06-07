class GoldModel {
  final String name;
  final num price;
  final String symbol;
   final String currency;
  final String updatedAt;
  final String updatedAtReadable;

  GoldModel({required this.name, required this.price, required this.symbol, required this.updatedAt, required this.updatedAtReadable, required this.currency});

factory GoldModel.fromJson(Map<String, dynamic> json) {
    return GoldModel(
      name: json['name'] ?? 'Unknown',
      price: json['price'] ?? 0,
      symbol: json['symbol'] ?? 'Unknown',
      currency: json['currency'] ?? 'Unknown',
      updatedAt: json['updatedAt'] ?? 'Unknown',
      updatedAtReadable: json['updatedAtReadable'] ?? 'Unknown',
    );
  }
}