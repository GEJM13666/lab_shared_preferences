import 'package:flutter/material.dart';
import 'another_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
   // Declare your variable for data
    String? myName;
  // Declare your function to load data
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
        title: const Text("Home Page"),
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
                  MaterialPageRoute(builder: (context) => AnotherPage()),
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
                    'AnotherPage',
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
