import 'package:app_dictionnary_eng_viet/data_sources/dictionary_databases/dictionary_database.dart';
import 'package:flutter/material.dart';

import '../../data_sources/dictionary_databases/word_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<List<WordModel>>? wordList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 50.0,
        centerTitle: true,
        title: const Text("Tra từ điển Anh - Việt",
            style: TextStyle(
                color: Colors.cyan, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Column(
              children: [
                _searchBox(),
                Container(),
              ],
            ),
            _searchList(),
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: TextField(
        controller: _searchController,
        focusNode: FocusNode(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          hintText: "Nhập từ hoặc câu cần tra cứu",
          prefixIcon: const Icon(Icons.search, color: Colors.cyan),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchController.clear();
              });
            },
          ),
        ),
        onChanged: (input) {
          setState(() {
            wordList = DictionaryDatabase().searchEnglishResults(input);
          });
        },
      ),
    );
  }

  Widget _searchList() {
    if (_searchController.text != "") {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 50.0),
          child: Card(
            elevation: 20.0,
            shadowColor: Colors.black,
            child: FutureBuilder<List<WordModel>>(
              future: wordList,
              builder: (context, snapshot) {
                if ((snapshot.hasError) || (!snapshot.hasData)) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<WordModel> list = snapshot.data!;
                print(list);
                return ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _itemSearch(word: list[index]);
                  },
                );
              },
            ),
          ),
        ),
      );
    }
    return Container();
  }

  _itemSearch({required WordModel word}) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              word.word ?? "Không tìm thấy",
              textAlign: TextAlign.left,
            ),
            const Divider()
          ],
        ),
      ),
      onTap: () {
        print("tapped");
        var route = MaterialPageRoute(
          builder: (context) => DetailScreen(
            word: word,
          ),
        );
        Navigator.push(context, route);

      },
    );
  }
}
