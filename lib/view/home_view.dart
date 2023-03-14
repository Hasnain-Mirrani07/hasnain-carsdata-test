import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../data/controller/carsdata_controller.dart';
import '../data/models/hivemodel/carsdata_hivemodel.dart';
import '../utils/colors.dart';
import 'homeview_components/stackcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var carsController = CarsDataController();
  bool isinternet = false;
  final box = Hive.box("NotesDatabase");
  List<CarsDataModelHive>? carlistfromHive;

  @override
  void initState() {
    super.initState();

    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status $e');
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  String? dateTimeformate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            _connectionStatus.name == "none"
                ? Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Center(
                        child: Row(
                      children: const [
                        Icon(Icons.wifi_off_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "No Internet Connection",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    )),
                  )
                : const SizedBox()
          ],
          backgroundColor: Colors.black,
          title: const Text(
            "cars",
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _connectionStatus.name == "none"
                ? Expanded(
                    child: ListView.builder(
                    itemCount: carsController.carlistfromHive!.length,
                    itemBuilder: (context, index) {
                      var carlist = carsController.carlistfromHive?[index];
                      dateTimeformater(carlist!.datetime);
                      return StacCard(
                        image: carlist.image,
                        title: carlist.title.toString(),
                        datetime: dateTimeformate,
                      );
                    },
                  ))
                : Expanded(
                    child: FutureBuilder(
                    future: carsController.getCarsDataFunc(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                          child: ListView.builder(
                            itemCount: carsController.carsmodel.content?.length,
                            itemBuilder: (context, index) {
                              //shorting the link
                              var carlist =
                                  carsController.carsmodel.content?[index];
                              dateTimeformater(carlist!.dateTime);
                              return StacCard(
                                image: carlist.image,
                                title: carlist.title.toString(),
                                list: carlist.content,
                                datetime: dateTimeformate,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ))
          ]),
        ),
      ),
    );
  }

  dateTimeformater(apidatetime) {
    String? inputDate = apidatetime;
    DateFormat inputFormat = DateFormat('dd.MM.yyyy hh:mm');
    DateFormat outputFormat = DateFormat('dd-MMMM-yyyy hh:mm a');
    DateTime dateTime = inputFormat.parse(inputDate!);
    String outputDate = outputFormat.format(dateTime);
    dateTimeformate = outputDate;
    if (outputDate.compareTo(DateTime.now().toString()) == true) {
      print("DT1 is before DT2");
    }
    print(outputDate);
  }
}
