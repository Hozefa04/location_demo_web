import 'package:fl_location/fl_location.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LocationDemo());
}

class LocationDemo extends StatelessWidget {
  const LocationDemo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInitialized = false;
  late Location location;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  Future<void> getLocation() async {
    LocationPermission locationPermission =
        await FlLocation.checkLocationPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      await FlLocation.requestLocationPermission();
    }

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
