
import 'package:flutter/cupertino.dart';
import 'package:muslim_app/Model/question.dart';
import 'package:muslim_app/api/quranApi.dart';

abstract class AbstractCategoriesModel extends ChangeNotifier{
  Future<Map<String,dynamic>> getQuran({String type});
//  Future<Map<String,dynamic>> getCategories({String token});
//  Future<Map<String,dynamic>> eatByRestaurant({String token, restId});
//  Future<Map<String,dynamic>> eatByCategories({String token, catId});
}



class QuranModel extends AbstractCategoriesModel{



  List<Question> _question = [];
  List<Question> get question => _question;
  set question (List<Question> question1) {
    _question = question1;
    notifyListeners();
  }


  @override
  Future<Map<String, dynamic >> getQuran({String type, String level}) async {
    Map<String, dynamic> result = Map();

    try{
      result =await Quran().getQuran(type: type, level: level);
      print("quran $result");
      if(result["error"] == null) {
        result["error"] = true;
        result['message'] = 'An Error occured, please try again';
      }else{
        if(result["error"] == false){
          result["error"]= false;
          print("pppppppp${result["question"]}");
          question = result["question"];
          print("lalalala$question");
        }
      }
    }catch(error){
      print(error.toString());
    }
    return result;
  }


}