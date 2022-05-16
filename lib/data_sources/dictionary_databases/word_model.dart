class WordModel{
  int? word_id;
  String? word;
  String? pronounce;
  String? meaning;

  WordModel(this.word_id, this.word, this.pronounce, this.meaning);

   WordModel.fromJson(Map<String, dynamic> json) {
    word_id = json['word_id'];
    word = json['word'];
    pronounce = json['pronounce'];
    meaning = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word_id'] = word_id;
    data['word'] = word;
    data['pronounce'] = pronounce;
    data['meaning'] = meaning;
    return data;
  }
}
