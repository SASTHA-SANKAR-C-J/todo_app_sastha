import 'package:flutter/material.dart';
import 'package:todo_app_sastha/controller/to_list_screen_controller.dart';
import 'package:todo_app_sastha/model/notes_model.dart';
import '../widgets/todo_list.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    loading();
    super.initState();
  }

  loading() async {
    ListController dataController = ListController();
    await dataController.loadDataBase();
  }

  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _descriptioncontroller = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();
  ListController dataController = ListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: ListView.separated(
        itemCount: dataController.datalist.length,
        itemBuilder: (context, index) => ToDoList(
          title: dataController.datalist[index].title,
          description: dataController.datalist[index].des,
          date: dataController.datalist[index].date,
          onPressed: () {
            dataController.deleteNote(index);
            setState(() {});
          },
        ),
        separatorBuilder: (context, index) => Spacer(),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _titlecontroller,
                          decoration: InputDecoration(
                              hintText: 'enter title',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _descriptioncontroller,
                          decoration: InputDecoration(
                              hintText: 'enter description',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _datecontroller,
                          decoration: InputDecoration(
                              hintText: 'enter date',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              dataController.addNote(NoteModel(
                                  title: _titlecontroller.text,
                                  date: _datecontroller.text,
                                  des: _descriptioncontroller.text));
                              _datecontroller.clear();
                              _descriptioncontroller.clear();
                              _titlecontroller.clear();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              'Add',
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
