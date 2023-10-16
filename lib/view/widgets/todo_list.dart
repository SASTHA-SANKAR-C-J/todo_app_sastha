import 'package:flutter/material.dart';
import 'package:todo_app_sastha/view/home_screen/next_screen.dart';
class ToDoList extends StatefulWidget {
  const ToDoList({super.key,  this.title='',  this.description='',  this.date='',required this.onPressed,});
  final String title;
  final String description;
  final String date;
  final Function onPressed;


  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    
    dynamic width = MediaQuery.of(context).size.width;
    return Container(
      height: 130,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 100,
          width: width * 0.85,
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(title: widget.title, description: widget.description, date: widget.date),));
                    },
                    child: Text(widget.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                  InkWell(
                    onTap: () {
                      widget.onPressed();
                    },
                    child: Icon(Icons.delete_outline)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(title: widget.title, description: widget.description, date: widget.date),));
                    },
                    child: Container(
                      height: 18,
                      width: width*0.5,
                      child: Text(widget.description,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(widget.date),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
