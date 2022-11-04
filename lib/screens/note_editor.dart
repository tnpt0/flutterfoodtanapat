import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfood/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  //int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  TextEditingController _ingredientController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor,
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add a new recipes',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding (
        padding:  EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Title',style: AppStyle.noteTitle,),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter title here',
                ),
                style: AppStyle.mainTitle,
              ),
              SizedBox(height: 2.0,),
              Text('Ingredients',style: AppStyle.noteTitle,),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _ingredientController,
                decoration: InputDecoration
                (border: InputBorder.none,
                hintText: 'Enter ingredients here',
                ),
                style: AppStyle.mainTitle,
              ),
              SizedBox(height: 2.0,),
              Text('Directions',style: AppStyle.noteTitle,),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _mainController,
                decoration: InputDecoration
                (border: InputBorder.none,
                hintText: 'Enter direction here',
                ),
                style: AppStyle.mainTitle,
              ),SizedBox(height: 2.0,),
              
              Text('ImageURL',style: AppStyle.noteTitle,),
              TextField(
                controller: _imageController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter imageURL here',
                ),
                style: AppStyle.mainTitle,
              ),
              Text(date,style: AppStyle.dateTitle,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async{
          FirebaseFirestore.instance.collection('note').add({
            'note_title' : _titleController.text,
            'creation_date' : date,
            'note_content' : _mainController.text,
            'ingredients':_ingredientController.text,
            'imageurl' : _imageController.text

          }).then((value) {
            print(value.id);
          }).catchError((error) => print('Failed to add new Note due to $error'));
        },
        child: Icon(Icons.save),

      ),
    );
  }
}