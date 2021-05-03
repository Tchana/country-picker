import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Country selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Just Testing')),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            width: 400,
            child: Card(
              child: buildSingleCountry(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSingleCountry(BuildContext context){
    final onTap = () async{
      showCountryPicker(
        countryListTheme: CountryListThemeData(
          flagSize: 10.0,
        ),
        context: context,
        showPhoneCode: true,
        onSelect: (Country country) {
          if(country == null) return;
          setState(() {
            this.selectedCountry = country;
          });
          print('Select country: ${country.displayName}');
        },
      );
    };
    return selectedCountry == null
        ? buildListTile(title: 'No selected country', onTap: onTap)
        : buildListTile(
      title: selectedCountry.name,
      onTap: onTap
    );
  }

  Widget buildListTile({@required String title, @required VoidCallback onTap,}) {
    return ListTile(
      onTap: onTap  ,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_drop_down, color: Colors.black,),
    );
  }
}