class CrosswordModel {
  int id;
  String hint;
  List<String> listHint;
  List<List<String>> letters;

  CrosswordModel({
    required this.id,
    required this.hint,
    required this.listHint,
    required this.letters,
  });

  factory CrosswordModel.fromJson(Map<String, dynamic> json) => CrosswordModel(
        id: json["id"],
        hint: json["hint"],
        listHint: List<String>.from(json["listHint"].map((x) => x)),
        letters: List<List<String>>.from(
            json["letters"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hint": hint,
        "listHint": List<dynamic>.from(listHint.map((x) => x)),
        "letters": List<dynamic>.from(
            letters.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
