import 'package:hive/hive.dart';

import '../models/carsdata_model.dart';
import '../models/hivemodel/carsdata_hivemodel.dart';
import '../services/carsdata_services.dart';

class CarsDataController {
  bool loadingCarsdata = false;
  String errCarsdata = '';
  var carsmodel = CarsDataModel();
  var carsdataModelHive = CarsDataModelHive();
  List<CarsDataModelHive> carsDataList = [];
  List<CarsDataModelHive>? carlistfromHive;
  final box = Hive.box("NotesDatabase");

  getCarsDataFunc() async {
    loadingCarsdata = true;
    var res = await GetCarsDataServices.getCarsDataApi();
    if (res is CarsDataModel) {
      carsmodel = res;
      _saveDataOffline();
      errCarsdata = '';
      loadingCarsdata = false;
    } else {
      loadingCarsdata = false;
      errCarsdata = res.toString();
    }
  }

//Data save in Hive
  _saveDataOffline() async {
    for (var element in carsmodel.content!) {
      carsDataList.add(CarsDataModelHive(
        title: element.title,
        image: element.image,
        datetime: element.dateTime,
      ));
    }
    await box.put("list", carsDataList);
    carlistfromHive = box.get("list");
    print("cars data save in hive ${carlistfromHive![0].title}");
    print("cars data save in hive ${carlistfromHive![0].image}");
  }
}
