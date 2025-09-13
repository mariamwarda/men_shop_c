
part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<String> categories;
  final String selectedCategory;

  CategoryLoaded(this.categories, {this.selectedCategory = "All"});
}
