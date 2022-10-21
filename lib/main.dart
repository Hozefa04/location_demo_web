import 'package:flutter/material.dart';

void main() {
  String? para1 = Uri.base.queryParameters["para1"];
  String? para2 = Uri.base.queryParameters["para2"];
  runApp(LocationDemo(
    para1: para1,
    para2: para2,
  ));
}

class LocationDemo extends StatelessWidget {
  final String? para1;
  final String? para2;
  const LocationDemo({super.key, this.para1, this.para2});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        para1: para1,
        para2: para2,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.para1, this.para2});
  final String? para1;
  final String? para2;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getLocation() async {
    location = await FlLocation.getLocation();
    isInitialized = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isInitialized
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    location.latitude.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    location.longitude.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text("Provide Location"),
            ),
    );
  }
}
