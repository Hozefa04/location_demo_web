import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  String? para1 = Uri.base.queryParameters["para1"];
  String? para2 = Uri.base.queryParameters["para2"];
  if (para1 == null) {
    () async {
      await launchLink('https://location-fetcher.netlify.app/',
          isNewTab: false);
    }();
  }
  runApp(LocationDemo(
    para1: para1,
    para2: para2,
  ));
}

Future<void> launchLink(String url, {bool isNewTab = true}) async {
  await launchUrl(
    Uri.parse(url),
    webOnlyWindowName: isNewTab ? '_blank' : '_self',
  );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.para1 == null
                ? "Parameter1 is null"
                : "Parameter 1 = ${widget.para1!}"),
            Text(widget.para2 == null
                ? "Parameter2 is null"
                : "Parameter 2 = ${widget.para2!}"),
          ],
        ),
      ),
    );
  }
}
