import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_internationalization/models/country.dart';
import 'package:getx_internationalization/service/country_service.dart';

class CountryController extends GetxController {
  var isLoading = false.obs;
  var countryList = <Country>[].obs;
  var countryCodeMap = <String, Country>{}.obs;

  @override
  void onInit() {
    fetchAllCountries();
    super.onInit();
  }

  void fetchAllCountries() async {
    try {
      showLoading();
      var countries = await CountryService.fetchCountries();
      if (countries != null) {
        countryList = countries.obs;
        for (var country in countryList) {
          countryCodeMap[country.name] = country;
        }
      }
    } finally {
      hideLoading();
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
