import 'package:hive/hive.dart';
part 'carsdata_hivemodel.g.dart';

@HiveType(typeId: 0)
class CarsDataModelHive extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? datetime;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  final String? discrip;

  CarsDataModelHive(
      {this.id, this.title, this.datetime, this.image, this.discrip});
}
