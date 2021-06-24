import 'package:flutter/material.dart';
import 'package:getx_internationalization/screens/home.dart';
import 'package:getx_internationalization/screens/login.dart';
import 'package:im_stepper/stepper.dart';

import 'myForm.dart';

void main() {
  runApp(IconStepperDemo());
}

class IconStepperDemo extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<IconStepperDemo> {
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 3; // upperBound MUST BE total number of icons minus 1.

  List<Icon> listOfIcons = [
    Icon(Icons.supervised_user_circle),
    Icon(Icons.flag),
    Icon(Icons.access_alarm),
    Icon(Icons.check),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('IconStepper Example'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: IconStepper(
                  enableNextPreviousButtons: false,
                  icons: listOfIcons,

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 6,
                child: activeStepForm(),
              ),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Text((activeStep == upperBound) ? "Done" : "Continue"),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF039BE5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF039BE5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget activeStepForm() {
    switch (activeStep) {
      case 1:
        return Login();

      case 2:
        return MyForm();

      default:
        return Text('Done Setting up everything');

      // case 4:
      //   return 'Publisher Information';
      //
      // case 5:
      //   return 'Reviews';
      //
      // case 6:
      //   return 'Chapters #1';
      //
      // default:
      //   return Text('Introduction');
    }
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Preface';

      case 2:
        return 'Table of Contents';
      //
      // case 3:
      //   return 'About the Author';
      //
      // case 4:
      //   return 'Publisher Information';
      //
      // case 5:
      //   return 'Reviews';
      //
      // case 6:
      //   return 'Chapters #1';

      default:
        return 'Introduction';
    }
  }
}
