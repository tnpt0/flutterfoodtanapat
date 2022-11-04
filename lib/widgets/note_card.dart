import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfood/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(0.0),
      height: 250,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor,
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: NetworkImage(doc['imageurl']),
          fit: BoxFit.cover
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Container(
          padding: EdgeInsets.all(16),
          height: 70,
          decoration: BoxDecoration(
            color: AppStyle.cardsColor,
            borderRadius: BorderRadius.circular(16.0)
            ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doc['note_title'],
              style: AppStyle.hpcardTitle,
              )
            ],
          ),
        )
          // Text(
          //   doc['note_title'],
          //   style: AppStyle.mainTitle,
          // ),
          // SizedBox(height: 4.0,),
          // Text(
          //   doc['creation_date'],
          //   style: AppStyle.dateTitle,
            
          // ),
          // SizedBox(height: 8.0,),
          // Text(
          //   doc['note_content'],
          //   style: AppStyle.mainContent,
          //   overflow: TextOverflow.ellipsis,
          // ),
        ],
      ),
    ),
  );
}