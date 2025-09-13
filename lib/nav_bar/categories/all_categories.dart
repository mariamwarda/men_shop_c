part of '../screen/home.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final cubit = context.read<CategoryCubit>();

        if (state is CategoryLoading) {
          return const SizedBox(
            height: 40,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }

        if (state is CategorySuccess) {
          final categories = [ ...state.list];
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = state.index == index;
                final category = categories[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  child: InkWell(
                    onTap: () {
                      cubit.changeIndex(index);
                      if (category == "All") {
                        context.read<ProductCubit>().getProducts();
                      } else {
                        context.read<ProductCubit>().updateCategoryProduct(category);
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3)],
                        color: isSelected ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        category,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
