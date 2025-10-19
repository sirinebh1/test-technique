import 'package:get/get.dart';
import '../../data/models/watch_model.dart';
import '../../../../core/constants/app_assets.dart';

class WatchController extends GetxController {
  var watches = <WatchModel>[].obs;
  var selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    loadWatches();
  }

  void loadWatches() {
    watches.value = [
      WatchModel(
        name: "Apple Watch SE",
        brand: "Apple",
        image: AppAssets.appleWatchSE,
        price: 349.99,
      ),
      WatchModel(
        name: "Galaxy Watch 4",
        brand: "Samsung",
        image: AppAssets.galaxyWatch4,
        price: 249.99,
      ),
      WatchModel(
        name: "Amazfit GTS 2",
        brand: "Amazfit",
        image: AppAssets.amazfitGTS2,
        price: 199.99,
      ),
      WatchModel(
        name: "Galaxy Watch 7",
        brand: "Samsung",
        image: AppAssets.galaxyWatch7,
        price: 279.99,
      ),
    ];
  }
  void selectWatch(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
  }
}
