import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/models/turf_model.dart';

class TurfScreen extends StatefulWidget {
  const TurfScreen({super.key, required this.turf});
  final Turf turf;
  @override
  State<TurfScreen> createState() => TturfScreenState();
}

class TturfScreenState extends State<TurfScreen> {
  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
       final screenRatio = screenSize.width / screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.turf.name, style: const TextStyle( fontSize: 18, fontWeight: FontWeight.bold),),
      ),

      body:  Column(children: [
          Container(
              width: screenRatio,
              child: CachedNetworkImage(
                imageUrl: widget.turf.imgurl,
              placeholder: (context, url) => const CircularProgressIndicator(), 
              errorWidget: (context, url, error) => const Icon(Icons.error), 
              ),
            ),
            Text(widget.turf.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
      ],),
    );
  }
}