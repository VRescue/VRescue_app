import 'package:flutter/material.dart';
import 'package:sangrakshan/global/color.dart';
import 'package:sangrakshan/models/disasters.dart';
import 'package:sangrakshan/views/disaster_detail.dart';
import 'package:sangrakshan/widgets/disaster_card.dart';

class DisasterScreen extends StatelessWidget {
  const DisasterScreen({
    super.key,
    required this.title,
    required this.disasters,
    });

    final String title;
    final List<Disasters> disasters;

    void selectDisaster(BuildContext context, Disasters disaster) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => DisasterDetailScreen(
          disaster: disaster,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget Content = ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: disasters.length,
      itemBuilder: (ctx, index) {
        return DisasterItem(
          disaster: disasters[index],
          onSelectDisaster: (disaster) {
            selectDisaster(context, disaster);
          }
          );
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        backgroundColor: klightPurple,
        body: Content,
      );
  }
}