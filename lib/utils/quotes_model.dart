import 'dart:ui';

class QuotesModel
{
  String? quote;
  String? author;
  Color? colorfind;
  List<QuotesModel> quotesModelColorList=[];
  List<QuotesModel> quotesModelList=[];
  QuotesModel({this.author,this.quote,this.colorfind});

  factory QuotesModel.fromQuotes(Map m1)
  {
    return QuotesModel(author: m1['quote'],quote: m1['author'],colorfind: m1['color']);
  }

  QuotesModel.toList(List l1,List l2)
  {
    for(int i=0; i<l1.length;i++)
      {
        quotesModelList.add(QuotesModel.fromQuotes(l1[i]));
      }
    for(int i=0; i<l2.length;i++)
      {
        quotesModelColorList.add(QuotesModel.fromQuotes(l2[i]));
      }
  }
}


