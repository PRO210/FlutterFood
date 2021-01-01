import 'package:mobx/mobx.dart';

import '../data/network/repositories/food_repository.dart';
import '../models/Food.dart';

part 'foods.store.g.dart';
// import 'package:flutter_food/models/Food.dart';
// import 'package:flutter_food/data/network/repositories/food_repository.dart';

class FoodStore = _FoodStoreBase with _$FoodStore;

abstract class _FoodStoreBase with Store {
  FoodRepository _repository;

  _FoodStoreBase() {
    _repository = new FoodRepository();
  }

  @observable
  ObservableList<Food> foods = ObservableList<Food>();

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void addFood(Food food) {
    foods.add(food);
  }

  @action
  void addAll(List<Food> foods) {
    foods.addAll(foods);
  }

  @action
  void removeFood(Food food) {
    foods.remove(food);
  }

  @action
  void clearFoods() {
    foods.clear();
  }

  @action
  Future getFoods(String tokenCompany) async {
    setLoading(true);
    final response = await _repository.getFoods(tokenCompany);
    setLoading(false);

    response.map((food) => addFood(Food.fromJson(food))).toList();
  }
}
