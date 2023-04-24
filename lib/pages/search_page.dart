import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  int _counter = 1;
  final List<String> _dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _getData().then((value) {
                      setState(() {
                        _dataList.add(value);
                      });
                    });
                  },
                  child: const Text('getData'),
                ),
                const SizedBox(height: 20, width: 20,),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _dataList.clear();
                        _counter = 1;
                      });
                    },
                    child: const Text('clearData')),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(_dataList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$_counter'));
    final data = jsonDecode(response.body);
    _counter++;
    await Future.delayed(const Duration(seconds: 1));
    return 'UserID: ${data['userId']}, Id: ${data['id']}, Title: ${data['title']} completed: ${data["completed"]}';
  }
}
