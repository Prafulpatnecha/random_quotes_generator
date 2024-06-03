import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_quotes_generator/utils/quotes_list.dart';
import 'package:random_quotes_generator/utils/quotes_model.dart';


int i=-1;
QuotesModel? quotesModel;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    quotesModel=QuotesModel.toList(quoteListFile,colorList);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Quotes App',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...List.generate(quoteListFile.length, (index) {
              setState(() {
              i++;
              if(colorList.length==i)
                {
                  i=-1;
                  i++;
                }
              });
              return Card(
                color: quotesModel!.quotesModelColorList[i].colorfind!,
                child: ListTile(
                  title: Text(quotesModel!.quotesModelList[index].quote!),
                  subtitle: Text(quotesModel!.quotesModelList[index].author!),
                ),
              );
            },),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random random=Random();
          int x=random.nextInt(quoteListFile.length);
          int y=random.nextInt(colorList.length);
          // print(x);
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text(quotesModel!.quotesModelList[x].quote!),
              content: Text(quotesModel!.quotesModelList[x].author!),
              backgroundColor: quotesModel!.quotesModelColorList[y].colorfind,
              actions: [
                TextButton(onPressed: () {
                setState(() {
                  x=random.nextInt(quoteListFile.length);
                });
                }, child: const Text('Continue',style: TextStyle(color: Colors.black),)),
                TextButton(onPressed: () {
                Navigator.of(context).pop();
                }, child: const Text('Back',style: TextStyle(color: Colors.black),))
              ],
            );
          },);
        },
        child: const Icon(Icons.markunread_mailbox_outlined),
      ),
    );
  }
}
