import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getCategoryProducts() {
    emit(CategoryLoaded(
      ["All", "Clothes", "Electronics", "Shoes"],
    ));
  }

  void selectCategory(String category) {
    if (state is CategoryLoaded) {
      final currentState = state as CategoryLoaded;
      emit(CategoryLoaded(
        currentState.categories,
        selectedCategory: category,
      ));
    }
  }
}
