class Activity{
  final String name;
  final String category;
  final String excerpt;
  final String description;
  final double price;
  final String? promotion;


  Activity({
    required this.name,
    required this.category,
    required this.excerpt,
    required this.description,
    required this.price,
    this.promotion,
  });
}