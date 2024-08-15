import 'package:bakery/data/constant.dart';
import 'package:bakery/presentation/widget/about_screen_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Bakery 🥖"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2.9,
                child: Image.network(
                  aboutData['aboutImage'],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Welcome to the Bakery 🥖",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(aboutData['desc'])
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Gallery 🏞️",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: aboutData['gallery'].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = aboutData['gallery'][index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Image.network(
                            data['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Reviews 👥",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: aboutData['review'].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = aboutData['review'][index];
                      return AboutScreenReview(data: data);
                    }),
              ),
              const SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
