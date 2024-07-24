import 'package:flutter/material.dart';
import 'package:sangrakshan/global/color.dart';
import 'package:sangrakshan/models/disasters.dart';

class DisasterDetailScreen extends StatelessWidget {
  const DisasterDetailScreen({super.key, required this.disaster});

  final Disasters disaster;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disaster.title),
        centerTitle: true,
      ),
      backgroundColor: klightPurple,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        child: Column(
          children: [
            Hero(
              tag: disaster.id,
              child: Image.asset(
                disaster.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              )
            ),

            SizedBox(height: 14,),

            Text(
              '${disaster.title} (${disaster.date})',
              style: const TextStyle(
                color: kblackSubHeading,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),

            SizedBox(height: 7,),

            Text(
              disaster.location,
              style: const TextStyle(
                color: kblackSubHeading,
                fontSize: 16,
              ),
              ),

              SizedBox(height: 10,),

              const Text(
                'Incident',
                style: TextStyle(
                  color: kblackHeading,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              for(final desc in disaster.description.first.split('\n'))
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    desc,
                    style: const TextStyle(
                      color: kblackSubHeading,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),

                SizedBox(height: 10,),

              const Text(
                'Consequences',
                style: TextStyle(
                  color: kblackHeading,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              for(final desc in disaster.description.skip(1).first.split('\n'))
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    desc,
                    style: const TextStyle(
                      color: kblackSubHeading,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),

                SizedBox(height: 10,),

              const Text(
                'Causes',
                style: TextStyle(
                  color: kblackHeading,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              for(final desc in disaster.description.last.split('\n'))
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    desc,
                    style: const TextStyle(
                      color: kblackSubHeading,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}