class Activity{
  final String name;
  final String category;
  final String description;
  final String? promotion;
  final double price;

  Activity({
    required this.name,
    required this.category,
    required this.description,
    this.promotion,
    required this.price
  });
}