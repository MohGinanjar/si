import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si/routes/name_route.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Center(
          child: ListView(
            children: [
              SizedBox(height: 150,),
              Container(height: 80,
              child: Image.asset('assets/logo/logo.png'),),
              Center(child: Text("PT.Surveyor Indonesia", style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),)),
              SizedBox(height: 60,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        
                        child: TextButton(
                            onPressed: () => Get.offNamed(RouteName.home),
                            child: Text("LOGIN", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),))),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
