class Disasters {
  const Disasters(
      {required this.id,
      required this.category,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.date,
      required this.location});

  final String id;
  final String category;
  final String title;
  final String imageUrl;
  final List<String> description;
  final String date;
  final String location;
}
