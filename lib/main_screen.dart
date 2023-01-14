import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  int counter = 0;
  void incrementFtn() async{
    final SharedPreferences sharedPreferences = await prefs;
    setState(() {
      counter++;
    } );
    sharedPreferences.setInt('counterValue', counter);
      }
  void resetFtn() async{
    final SharedPreferences sharedPreferences = await prefs;
    setState((){
      counter = 0;
    } );
    sharedPreferences.setInt('counterValue',counter);
  }
  void getInitialValue() async {
    final SharedPreferences sharedPreference = await prefs;
    setState((){

    } );
  }
  @override
  void initState(){
    super.initState();
    getInitialValue();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      color: Colors.cyan[100],
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          GestureDetector(
            onTap:() => incrementFtn(),
        
         child: CircleAvatar(
            radius: 150,
            backgroundColor: Colors.pinkAccent,
            child: Text(
              '$counter',
              style: const TextStyle(
                color: Colors.black,
                fontSize:90,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:  EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => resetFtn(),
                child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueGrey,
                child: Text(
                  'Reset',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}


