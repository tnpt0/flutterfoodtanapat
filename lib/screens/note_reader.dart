import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfood/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
   NoteReaderScreen(this.doc,{Key? key}):super(key: key);
   QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    // int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                         Text(
                widget.doc['note_title'],
                style: AppStyle.hpmainTitle,
              ),
              SizedBox(height: 4.0,),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(widget.doc['imageurl']),
                    fit: BoxFit.cover
                    )
                  ),
        
                ),
         
              SizedBox(height: 8.0,),
              Text('Ingredients',style: AppStyle.noteTitle,),
              Text(
                widget.doc['ingredients'],
                style: AppStyle.mainContent,
              ),
              SizedBox(height: 8.0,),
              Text('Directions',style: AppStyle.noteTitle,),
              Text(
                widget.doc['note_content'],
                style: AppStyle.mainContent,
                
              ),
              Text(
                widget.doc['creation_date'],
                style: AppStyle.dateTitle,
              ),
        
        
            ],
          ),
        ),
      ),
    );
  }
}