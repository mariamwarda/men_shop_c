import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/helpers/assets.dart';
import 'package:menshop/helpers/field.dart';
import 'package:menshop/nav_bar/products/product_cubit.dart';
import 'package:menshop/nav_bar/products/product-state.dart';
import 'package:menshop/widgets/category_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text("Discover", style: AppTextStyles.kHeadTextStyle32),
              const SizedBox(height: 16),

              // Search + Filter
              Row(
                children: [
                  Expanded(
                    child: Field(
                      hintText: "Search for clothes",
                      ShowIcon: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.settings,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 16),

              // Categories Tabs
              SizedBox(
                height: 40,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoaded) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: state.categories.map((category) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<CategoryCubit>()
                                  .selectCategory(category);
                            },
                            child: _buildCategoryTab(
                              category,
                              isSelected: state.selectedCategory == category,
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Products Grid
              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductFailure) {
                      return Center(
                        child: Text(
                          "Error: ${state.error}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (state is ProductSuccess) {
                      return BlocBuilder<CategoryCubit, CategoryState>(
                        builder: (context, catState) {
                          String selectedCategory = "All";
                          if (catState is CategoryLoaded) {
                            selectedCategory = catState.selectedCategory;
                          }

                          final filteredProducts = selectedCategory == "All"
                              ? state.model
                              : state.model
                              .where((p) =>
                          (p.category ?? "").toLowerCase() ==
                              selectedCategory.toLowerCase())
                              .toList();

                          return GridView.builder(
                            padding: const EdgeInsets.only(top: 8),
                            itemCount: filteredProducts.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade100,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          product.image ?? "",
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) =>
                                          const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      product.title ?? "",
                                      style: AppTextStyles.kTextStyle16Grey,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "\$${product.price ?? ""}",
                                      style: AppTextStyles.kTextStyle16MediumGrey,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
