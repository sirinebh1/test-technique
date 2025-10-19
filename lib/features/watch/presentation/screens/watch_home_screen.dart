import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../controllers/watch_controller.dart';
import 'watch_details_screen.dart';

class WatchHomeScreen extends GetView<WatchController> {
  const WatchHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // status bar
              _buildStatusBar(),

              const SizedBox(height: 16),

              // Title
              Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 16),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.searchHint,
                  prefixIcon: const Icon(
                    IconlyLight.search,
                    color: AppColors.textLight,
                  ),
                  suffixIcon: const Icon(
                    IconlyLight.category,
                    color: AppColors.textLight,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //  Category Row
              Row(
                children: [
                  Text(
                    AppStrings.smartWatch,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(AppStrings.apple),
                  const SizedBox(width: 12),
                  Text(AppStrings.samsung),
                  const SizedBox(width: 12),
                  Text(AppStrings.xiaomi),
                ],
              ),

              const SizedBox(height: 20),

              // Product Grid
              Expanded(
                child: Obx(() {
                  final watches = controller.watches;
                  return GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.72,
                    ),
                    itemCount: watches.length,
                    itemBuilder: (context, index) {
                      final watch = watches[index];
                      return GestureDetector(
                        onTap: () {
                          controller.selectWatch(index);
                          Get.to(() => WatchDetailsScreen(watch: watch));
                        },
                        child: Obx(() {
                          final isSelected =
                              controller.selectedIndex.value == index;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: isSelected
                                      ? AppColors.primary.withOpacity(0.3)
                                      : Colors.black.withOpacity(0.05),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Watch image section
                                AnimatedScale(
                                  scale: isSelected ? 1.1 : 1.0,
                                  duration:
                                  const Duration(milliseconds: 250),
                                  curve: Curves.easeInOut,
                                  child: Container(
                                    height: 120,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.productBackgrounds[
                                      index %
                                          AppColors.productBackgrounds
                                              .length],
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Hero(
                                        tag: watch.name,
                                        child: Image.asset(
                                          watch.image,
                                          height: 90,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        watch.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        watch.brand,
                                        style: TextStyle(
                                          color: isSelected
                                              ? AppColors.primary
                                              : AppColors.textLight,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "\$${watch.price.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildStatusBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          AppStrings.time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.dark,
          ),
        ),
        Row(
          children: const [
            Icon(Icons.network_cell, size: 18, color: AppColors.dark),
            SizedBox(width: 6),
            Icon(Icons.wifi, size: 18, color: AppColors.dark),
            SizedBox(width: 6),
            Icon(Icons.battery_full, size: 18, color: AppColors.dark),
          ],
        ),
      ],
    );
  }
}
