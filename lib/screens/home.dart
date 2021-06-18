import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_internationalization/controllers/country-controller.dart';
import 'package:getx_internationalization/service/country_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String countryValue;

  String stateValue;

  String cityValue;

  CountryService service = CountryService();

  final CountryController countryController = Get.put(CountryController());

  var flag = "".obs;
  final countryWithCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var countriesKey = GlobalKey<FindDropdownState>();

    return Scaffold(
      appBar: AppBar(title: Text('Cheetah Coding')),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Scrollbar(
          child: Center(
            child: Container(
              width: 700,
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: ListView(
                  children: <Widget>[
                    // SizedBox(height: 24),
                    // Text(
                    //   'Easy Language Translations',
                    //   style: TextStyle(fontSize: 36, color: Colors.white),
                    //   textAlign: TextAlign.center,
                    // ),
                    // SizedBox(height: 24),
                    // Text(
                    //   'This text will automatically be translated into the appropriate language',
                    //   style: TextStyle(fontSize: 20, color: Colors.white),
                    // ),
                    // SizedBox(height: 24),
                    // FlatButton(
                    //   child: Text(
                    //     "Change language",
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    //   color: Colors.indigo,
                    //   textColor: Colors.white,
                    //   onPressed: () => {},
                    // ),
                    // SizedBox(height: 24),
                    // FlatButton(
                    //   child: Text(
                    //     "Go to Test",
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    //   color: Colors.indigo,
                    //   textColor: Colors.white,
                    //   onPressed: () => Navigator.pushNamed(context, 'test'),
                    // ),
                    // FlatButton(
                    //   child: Text(
                    //     "Go to Form",
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    //   color: Colors.indigo,
                    //   textColor: Colors.white,
                    //   onPressed: () => Navigator.pushNamed(context, 'form'),
                    // ),
                    SizedBox(
                      height: 70.0,
                    ),

                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: countryWithCode,
                            decoration: InputDecoration(
                              prefixIcon: SvgPicture.network(
                                flag.value,
                                width: 3,
                                height: 4,
                              ),
                            ),
                            onChanged: (value) {
                              // service
                              //     .fetchCountries(value)
                              //     .then((countries) => print('Complete:'));
                            },
                          ),
                        ],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 600.0,
                      ),
                      child: FindDropdown(
                        items: countryController.countryCodeMap.keys.toList(),
                        label: "País",
                        onChanged: (item) {
                          print("Printing an item: " + item);
                          countriesKey.currentState
                              ?.setSelectedItem(<String>[]);
                          var country = countryController.countryCodeMap[item];
                          print(
                            "countrycode: " +
                                countryController
                                    .countryCodeMap[item].alpha2Code,
                          );
                          countryWithCode.text =
                              country.callingCodes.first + " " + country.name;
                          flag.value = country.flag;
                        },
                        selectedItem: "Brasil",
                        showSearchBox: true,
                        labelStyle: TextStyle(color: Colors.blue),
                        backgroundColor: Colors.grey[300],
                        titleStyle: TextStyle(color: Colors.greenAccent),
                        labelVisible: false,
                        constraints: BoxConstraints(
                          maxWidth: 600.0,
                        ),
                        validate: (String item) {
                          if (item == null)
                            return "Required field";
                          else if (item == "Brasil")
                            return "Invalid item";
                          else
                            return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    // FindDropdown<String>.multiSelect(
                    //   key: countriesKey,
                    //   items: ['Cameroon', 'Brasil', 'Tanzania', 'Nigeria'],
                    //   label: "Países",
                    //   selectedItems: ["Brasil"],
                    //   onChanged: (selectedItems) =>
                    //       print("countries: $selectedItems"),
                    //   showSearchBox: true,
                    //   labelStyle: TextStyle(color: Colors.redAccent),
                    //   titleStyle: TextStyle(color: Colors.greenAccent),
                    //   dropdownItemBuilder: (context, item, isSelected) {
                    //     return ListTile(
                    //       title: Text(item.toString()),
                    //       trailing: isSelected ? Icon(Icons.check) : null,
                    //       selected: isSelected,
                    //     );
                    //   },
                    //   okButtonBuilder: (context, onPressed) {
                    //     return Align(
                    //       alignment: Alignment.centerRight,
                    //       child: FloatingActionButton(
                    //           child: Icon(Icons.check),
                    //           onPressed: onPressed,
                    //           mini: true),
                    //     );
                    //   },
                    //   validate: (List<String> items) {
                    //     print("VALIDATION: $items");
                    //     String response;
                    //     if (items == null || items.isEmpty) {
                    //       response = "Required field";
                    //     } else if (items.contains("Brasil")) {
                    //       response = "'Brasil' não pode ser selecionado.";
                    //     }
                    //     print(response);
                    //     return response;
                    //   },
                    // ),
                    // CountryListPick(
                    //   pickerBuilder: (context, CountryCode countryCode) {
                    //     return Row(
                    //       children: [
                    //         // Image.asset(
                    //         //   countryCode.flagUri,
                    //         //   package: 'country_list_pick',
                    //         // ),
                    //         // Text(countryCode.code + " "),
                    //         Text(countryCode.dialCode + " "),
                    //         // Text(countryCode.name),
                    //       ],
                    //     );
                    //   },
                    //   countryBuilder: (context, code) {},
                    //   useUiOverlay: false,
                    //   theme: CountryTheme(
                    //     isShowFlag: false,
                    //     isShowTitle: false,
                    //     isShowCode: true,
                    //     isDownIcon: false,
                    //     showEnglishName: true,
                    //   ),
                    //   initialSelection: '+237',
                    //   // or
                    //   // initialSelection: 'US'
                    //   onChanged: (CountryCode code) {
                    //     print(code.name);
                    //     print(code.code);
                    //     print(code.dialCode);
                    //     print(code.flagUri);
                    //   },
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     showCountryPicker(
                    //       context: context,
                    //       //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                    //       exclude: <String>['KN', 'MF'],
                    //       //Optional. Shows phone code before the country name.
                    //       showPhoneCode: true,
                    //       onSelect: (Country country) {
                    //         print('Select country: ${country.displayName}');
                    //       },
                    //       // Optional. Sets the theme for the country list picker.
                    //       countryListTheme: CountryListThemeData(
                    //         // Optional. Sets the border radius for the bottomsheet.
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(40.0),
                    //           topRight: Radius.circular(40.0),
                    //         ),
                    //         // Optional. Styles the search field.
                    //         inputDecoration: InputDecoration(
                    //           labelText: 'Search',
                    //           hintText: 'Start typing to search',
                    //           prefixIcon: const Icon(Icons.search),
                    //           border: OutlineInputBorder(
                    //             borderSide: BorderSide(
                    //               color:
                    //                   const Color(0xFF8C98A8).withOpacity(0.2),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   child: const Text('Show country picker'),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
