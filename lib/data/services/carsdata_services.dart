import 'package:http/http.dart' as http;
import '../../utils/appurls.dart';
import '../models/carsdata_model.dart';

import '../../utils/base_client.dart';

class GetCarsDataServices {
  static Future<dynamic> getCarsDataApi() async {
    var url = "${AppUrls.baseUrl}${AppUrls.carsdataUrl}";

    var res = await BaseClientClass.get(url, "");
    try {
      if (res is http.Response) {
        return carsDataModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
