import 'package:app_dictionnary_eng_viet/data_sources/dictionary_databases/word_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final WordModel word;

  const DetailScreen({Key? key, required this.word}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin của từ"),
          foregroundColor: Colors.cyan,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(50),
                      bottomLeft: const Radius.circular(50),
                      topRight: const Radius.circular(5),
                      bottomRight: const Radius.circular(120)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Text(
                  "Từ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  widget.word.word!,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(50),
                      bottomLeft: const Radius.circular(50),
                      topRight: const Radius.circular(5),
                      bottomRight: const Radius.circular(120)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Text(
                  "Phát âm",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  widget.word.pronounce!,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:  const BorderRadius.only(
                      topLeft: const Radius.circular(50),
                      bottomLeft: const Radius.circular(50),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(120)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Text(
                  "Nghĩa",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  widget.word.meaning!,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
