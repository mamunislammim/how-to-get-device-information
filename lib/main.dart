import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // String ? deviceIDPackage;
  String? deviceModel;
  String? deviceBrand;
  String? deviceId;
  String? deviceBoard;
  String? deviceBootloader;
  String? display;
  String? displayMetrics;
  String? fingerprint;
  String? hardware;
  String? host;
  String? isPhysicalDevice;
  String? manufacturer;
  String? product;
  String? serialNumber;
  String? tag;
  String? type;
  String? version;
  String? data;


  // Not Working
  // Future getDeviceId()async{
  //   print("object");
  //    try {
  //      print("BBBBBBBBBB");
  //     var deviceIDPackage = await PlatformDeviceId.getDeviceId;
  //      print("Dev : ${deviceIDPackage?.length}");
  //   } on PlatformException {
  //      print("AAAAAAAAA");
  //    var deviceIDPackage = 'Failed to get deviceId.';
  //      print("Error : $deviceIDPackage");
  //   }
  // }

  Future getModel()async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo =  await deviceInfo.androidInfo;
    deviceModel  = androidInfo.model;
    deviceBrand = androidInfo.brand;
    deviceId = androidInfo.id;
    deviceBoard = androidInfo.board;
    deviceBootloader = androidInfo.bootloader;
    display = androidInfo.display;
    displayMetrics = androidInfo.displayMetrics as String?;
    fingerprint = androidInfo.fingerprint;
    hardware =androidInfo.hardware;
    host = androidInfo.host;
    isPhysicalDevice = androidInfo.isPhysicalDevice as String?;
    manufacturer = androidInfo.manufacturer;
    product = androidInfo.product;
    serialNumber = androidInfo.serialNumber;
    tag = androidInfo.tags;
    type = androidInfo.type;
    version = androidInfo.version as String?;
    data = androidInfo.data as String?;
    setState(() {
    });
  }
  
  @override
  void initState(){
    getModel();
   // getDeviceId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Information"),
        centerTitle: true,
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Brand : $deviceBrand"),
                //Text("Device Id Package : $deviceIDPackage"),
                Text("Id : $deviceId"),
                Text("Model : $deviceModel"),
                Text("Device : $deviceBoard"),
                Text("DeviceBootLoader : $deviceBootloader"),
                Text("Display : $display"),
                Text("DisplayMetrix : $displayMetrics"),
                Text("Fingerprint : $fingerprint"),
                Text("Hardware : $hardware"),
                Text("Host : $host"),
                Text("Isp Physical Device : $isPhysicalDevice"),
                Text("Manufacturer : $manufacturer"),
                Text("Product : $product"),
                Text("SerialNumber : $serialNumber"),
                Text("Tag :$tag"),
                Text("Type : $type"),
                Text("Version : $version"),
                Text("Data : $data")
              ],
            ),
          ),
        ),
      )
    );
  }
}
