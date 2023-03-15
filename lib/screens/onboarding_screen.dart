import 'package:ema/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String name = ' ';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // lib/images/logo.png
            SizedBox(height: 50,),
            Center(
                child: Container(
                  height: 250,
                  width: 250,
                  child: Image(
                      image: AssetImage('lib/images/logo.png'),
                  )
                ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (val) => name = val,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      label: Text('Enter your Name',style: TextStyle(fontSize: 20),),
                      prefixIcon: Icon(Icons.person),

                  ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('name', name);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.pink),
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(color: Colors.pink)),
                ),
              ),
              child: const Text(
                "Done",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
