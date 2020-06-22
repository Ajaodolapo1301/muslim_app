import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muslim_app/Model/question.dart';
abstract class AModelApi{
  Future<Map<String, dynamic>> getQuran({String type, String level });
//  Future<Map<String, dynamic>> eatByRestaurant({String token,  restId});
//  Future<Map<String, dynamic>> getCategories({String token });
//  Future<Map<String, dynamic>> eatByCategories({String token,  catId});
//  Future<Map<String, dynamic>> deleteCard({String token, String cardId,});
//  Future<Map<String, dynamic>> walletHistory({String token,});
//  Future<Map<String, dynamic>> cashOut({String amount, String token });
}




class Quran implements AModelApi{
  @override
  Future<Map<String, dynamic >> getQuran({String type, String level}) async {
    Map<String, dynamic> result = {};
    var url =  "https://muslim-app-api.herokuapp.com/api/$type/$level";
    try{
      var response = await  http.get(url);
        int statusCode = response.statusCode;
      if(statusCode != 200){
        result['message'] = "error occurred";
        result['error'] = true;
      }else{
        result['error'] = false;
        List<Question> question= [];
        (jsonDecode(response.body)as List).forEach((ques){
          question.add(Question.fromJson(ques));

        });


        result['question'] = question;
      }


    }catch(e){
      print(e.toString());
    }
    return result;
  }

}