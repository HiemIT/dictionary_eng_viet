import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
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
      body: Container(
          child: Column(
        children: [
          _searchBox(),
          Container(),
        ],
      )),
    );
  }

  Widget _searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
      ),
    );
  }
}
