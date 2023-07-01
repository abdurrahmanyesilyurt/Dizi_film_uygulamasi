class Siklar{

  String dogru;
  String y1;
  String y2;
  String y3;

  Siklar(this.dogru, this.y1, this.y2, this.y3);

  factory Siklar.fromJson(Map<dynamic,dynamic>json){
    return Siklar(json["dogru"] as String,json["y1"] as String,json["y2"]as String, json["y3"] as String);
  }
}