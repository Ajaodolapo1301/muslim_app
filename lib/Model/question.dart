
enum Type {
  multiple,
  boolean
}

enum Difficulty {
  easy,
  medium,
  hard
}




class Question{
  String type;
  String level;
  String question;
   String id;
   List options;
   Question({this.options, this.level, this.type, this.id,this.question});

   factory Question.fromJson(Map <String,  dynamic> json)=>Question(
      type : json['type'],
      id: json["_id"],
       question: json["question"],
       level : json["level"],
     options: json["options"],


  );
}