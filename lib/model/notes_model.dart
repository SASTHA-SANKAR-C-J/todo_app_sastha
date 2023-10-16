import 'package:hive/hive.dart';
part 'notes_model.g.dart';
@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String des;
  @HiveField(2)
  final String date;
NoteModel({
  required this.title,
  required this.date,
  required this.des,
});
}