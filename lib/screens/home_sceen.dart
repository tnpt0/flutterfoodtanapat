import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfood/auth.dart';
import 'package:flutterfood/screens/note_editor.dart';
import 'package:flutterfood/screens/note_reader.dart';
import 'package:flutterfood/screens/widget_tree.dart';
import 'package:flutterfood/style/app_style.dart';
import 'package:flutterfood/widgets/note_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_registor_page.dart';
class HomeScreen extends StatefulWidget {
    HomeScreen({super.key});
  

  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Flutterfood',
          style: GoogleFonts.nunito(
            color: AppStyle.PrimaryColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            ),
          ),
        centerTitle: true,
        backgroundColor: AppStyle.bgColor,
        actions: [IconButton(onPressed: () {
          setState(() {
            Auth().signOut();
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) =>   WidgetTree()));
          
        }, icon: const Icon(
          Icons.logout_outlined
          ),
          )
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All recipes',
              style: AppStyle.hpmainTitle
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("note").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return ListView(
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 2),
                      children: snapshot.data!.docs.map((note) => noteCard(() {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => NoteReaderScreen(note),));
                      }, note)).toList(),
                    
                    );
                  }
                  return Text('ther,s no Notes',style: GoogleFonts.nunito(color: Colors.white),);
                },
                ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditorScreen()));
      }, 
      label: Text('Add recipe'),
      icon: Icon(Icons.add),
      ),
    );
  }
}