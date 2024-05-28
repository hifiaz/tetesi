// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
