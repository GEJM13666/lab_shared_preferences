import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:labshared_pref/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
      String? myName;
  // Declare your function to load data
    void removeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('myName');
  }
 void loadData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myName = prefs.getString("myName");
    });
    
  }
  @override
  void initState(){
    loadData();
    super.initState();
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Page"),
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(myName??
                'รอสักครู่',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
               ElevatedButton(
                onPressed: () {
                
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
          
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blueAccent, // Background color
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text(
                    'HomePage',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
               ElevatedButton(
                onPressed: () {
                  removeData();
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
          
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blueAccent, // Background color
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text(
                    'FirstPage',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
