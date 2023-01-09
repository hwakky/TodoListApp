import 'package:flutter/material.dart';
import 'package:play_flutter/screens/home_screen.dart';
import 'package:play_flutter/services/category_screen.dart';

import '../models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.blue),
                onPressed: () {
                  _category.name = _categoryNameController.text;
                  _category.desciption = _categoryDescriptionController.text;
                  _categoryService.saveCategory(_category);
                },
                child: Text('Save'),
              ),
            ],
            title: Text('Categories Form'),
            content: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                TextField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                      hintText: 'Write a category', labelText: 'Categories'),
                ),
                TextField(
                  controller: _categoryDescriptionController,
                  decoration: InputDecoration(
                      hintText: 'Write a description',
                      labelText: 'Description'),
                )
              ],
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
        title: Text('Categories'),
      ),
      body: Center(child: Text('Welcome to Categories Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
