class AddReviewRequest {
  final String id;
  final String name;
  final String review;

  AddReviewRequest(
      {required this.id, required this.name, required this.review});

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "id": id,
      };
}
