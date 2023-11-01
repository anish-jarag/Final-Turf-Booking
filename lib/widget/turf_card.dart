import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/turf_model.dart';

class TurfCard extends StatelessWidget {
  const TurfCard({super.key, required this.turf});

  final Turf turf;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 200,
              child: CachedNetworkImage(
                imageUrl: turf.imgurl,
              placeholder: (context, url) => const CircularProgressIndicator(), 
              errorWidget: (context, url, error) => const Icon(Icons.error), 
              ),
            ),

            // SizedBox(
            //     height: 100, width: 150, child: Image.network(turf.imgurl)),

                const SizedBox(width: 10,),

            Column(
              children: [
                Text(
                  turf.name,
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    color: Color(0xff000000),
                  ),
                ),
                Text(turf.address,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xff000000),
                    )),
                Text(turf.phoneNumber.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xff000000),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
