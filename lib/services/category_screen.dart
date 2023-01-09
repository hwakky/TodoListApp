import 'package:play_flutter/repositories/repository.dart';

import '../models/category.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  // create data
  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }

  // Read data from table
  readData() async {
    _repository.readData('categories');
  }
}
