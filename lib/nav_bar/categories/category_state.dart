part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySuccess extends CategoryState {
  final List<String> list;
  final int index;

  CategorySuccess(this.list, this.index);
}
class CategoryFailure extends CategoryState {}