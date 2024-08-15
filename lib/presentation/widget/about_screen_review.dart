import 'package:flutter/material.dart';

class AboutScreenReview extends StatelessWidget {
  final Map<String, dynamic> data;
  const AboutScreenReview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(data['image']),
                radius: 30,
              ),
              const SizedBox(height: 4),
              Text(
                data['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                data['review'],
                style: TextStyle(),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
