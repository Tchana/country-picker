import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 800.0,
        child: Form(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  width: 600,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.close,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 0.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text("customer.preferredName + "
                                    " + customer.name"),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text("customer.gender"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 0.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text("customer.telephone"),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text("customer.email"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 30, 40, 0.0),
                        child: Divider(
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 0.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text("customer.address.streetAddress"),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text("customer.address.addressLocality" +
                                    " " +
                                    "customer.address.addressCountry.name"),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
