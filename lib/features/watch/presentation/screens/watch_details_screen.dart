import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../data/models/watch_model.dart';

class WatchDetailsScreen extends StatelessWidget {
  final WatchModel watch;

  const WatchDetailsScreen({super.key, required this.watch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: AppColors.dark),
                    onPressed: () => Get.back(),
                  ),
                  const Icon(IconlyLight.heart, color: AppColors.dark),
                ],
              ),
            ),

            // watch image
            Expanded(
              flex: 5,
              child: Hero(
                tag: watch.name,
                child: Image.asset(
                  watch.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // details section
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, -4),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // watch name + rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            watch.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.dark,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.star,
                                    size: 16, color: Colors.orange),
                                SizedBox(width: 4),
                                Text("4.9",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.dark)),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),
                      const Text("(With solo loop)",
                          style: TextStyle(color: AppColors.textLight)),

                      const SizedBox(height: 16),
                      const Text(
                        "Colors",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // colors row
                      Row(
                        children: [
                          _buildColorOption("Silver", Colors.grey.shade300),
                          const SizedBox(width: 10),
                          _buildColorOption(
                              "Bright Orange", Colors.deepOrangeAccent,
                              isSelected: true),
                          const SizedBox(width: 10),
                          _buildColorOption("Starlight", Colors.white70),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // details text
                      const Text(
                        AppStrings.details,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        AppStrings.description,
                        style: TextStyle(
                          color: AppColors.textLight,
                          height: 1.5,
                        ),
                      ),

                      const Spacer(),

                      // Add to cart button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              "Add to Cart | \$${watch.price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(String label, Color color, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.grey.shade300,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 6, backgroundColor: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primary : AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
