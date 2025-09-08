import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/widgets/category_cubit.dart';

class AllCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoaded) {
          return SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return Chip(
                  label: Text(state.categories[index]),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 8),
            ),
          );
        } else {
          return const Text("Error loading categories");
        }
      },
    );
  }
}
