import 'package:hive/hive.dart';
import 'package:todo_app_sastha/model/notes_model.dart';

class ListController {
  List<NoteModel> datalist = [];
final myBox = Hive.box('mydata');
  void addNote(NoteModel newNote) {
    datalist.add(newNote);
    updateDataBase();
  }

  void deleteNote(int index) {
    datalist.removeAt(index);
    updateDataBase();
  }
  
  loadDataBase() async {
    datalist= await myBox.get('noteDataList');
  }

  void updateDataBase(){
    myBox.put('noteDataList', datalist);
  }
}
