part of '../screen/home.dart';

class AllProductHomePage extends StatelessWidget {
  const AllProductHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.model.length,
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final product = state.model[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(model: product),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.network(
                          product.image ?? "",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        product.title ?? "",
                        style: AppTextStyles.kTextStyle16MediumBlack,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        r"$" + product.price.toString(),
                        style: AppTextStyles.kTextStyle16Grey,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductFailure) {
          return Center(
            child: Text(
              "Error: ${state.error}",
              style: AppTextStyles.kTextStyle16MediumBlack.copyWith(
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
