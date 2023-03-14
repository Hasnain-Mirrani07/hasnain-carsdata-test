import 'package:flutter/material.dart';
import 'package:m_hasnain/data/models/carsdata_model.dart';

import '../../utils/appurls.dart';
import '../../utils/colors.dart';

class StacCard extends StatelessWidget {
  const StacCard(
      {super.key, this.image, this.title, this.disp, this.list, this.datetime});
  final String? title;
  final String? disp;
  final String? image;
  final String? datetime;
  final List<ContentContent>? list;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Card(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                  "${AppUrls.baseUrl}$image",
                  height: 270,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
        Positioned(
          top: 220,
          left: 20,
          child: SizedBox(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 2,
                  title.toString(),
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " $datetime ",
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                  child: SizedBox(
                    height: 40,
                    width: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: list != null ? list!.length : 1,
                      itemBuilder: (context, index) {
                        return list != null
                            ? Text(
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                "${list![index].description}",
                                style: const TextStyle(
                                    color: AppColors.greylight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              )
                            : const Text(
                                "description"
                                "The Audi Q7 is masculine, yet exudes lightness. Inside, it offers comfort at the highest level. With even more space for your imagination. The 3.0 TDI engine accelerates this powerhouse as a five-seater starting at an impressive 6.3 seconds from 0 to 100 km/h",
                                style: TextStyle(
                                    color: AppColors.greylight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
