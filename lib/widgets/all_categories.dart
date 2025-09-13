import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/widgets/category_cubit.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

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
                final category = state.categories[index];
                final isSelected = state.selectedCategory == category;

                return ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (_) {
                    context.read<CategoryCubit>().selectCategory(category);
                  },
                  selectedColor: Colors.deepPurple,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
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
