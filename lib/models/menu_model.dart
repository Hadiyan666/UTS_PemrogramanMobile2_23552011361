class MenuModel {
  final String id;
  final String name;
  final int price;
  final String category; // makanan / minuman
  final double discount; // contoh: 0.10 = 10%

  MenuModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.discount,
  });

  int getDiscountedPrice() {
    return (price - (price * discount)).toInt();
  }
}
