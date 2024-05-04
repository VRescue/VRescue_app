import 'package:flutter/material.dart';
import 'package:sangrakshan/global/color.dart';
import 'package:sangrakshan/models/disasters.dart';
import 'package:transparent_image/transparent_image.dart';

class DisasterItem extends StatelessWidget {
  const DisasterItem({super.key, required this.disaster, required this.onSelectDisaster});

  final Disasters disaster;
  final void Function(Disasters disaster) onSelectDisaster;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectDisaster(disaster);
        },
        child: Stack(
          children: [
            Hero(
              tag: disaster.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage(disaster.imageUrl),
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 44,
                  ),
                  child: Column(
                    children: [
                      Text(
                        disaster.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: kwhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}