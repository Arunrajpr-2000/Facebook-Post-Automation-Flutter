import 'package:facebook_autamation_adnan/view/facebook_post_image_feed.dart';
import 'package:facebook_autamation_adnan/view/facebook_post_text_feed.dart';
import 'package:facebook_autamation_adnan/view/facebook_post_video_feed.dart';
import 'package:facebook_autamation_adnan/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post Feed On Facebook Page',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButtonWidget(
              buttonText: 'Post Text On Facebook Page',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FacebookPostText(),
                ));
              },
            ),
            const SizedBox(height: 30),
            ElevatedButtonWidget(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FacebookPostImage(),
                ));
              },
              buttonText: 'Post Image On Facebook Page',
            ),
            const SizedBox(height: 30),
            ElevatedButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FacebookPostVideo(),
                  ));
                },
                buttonText: 'Post Video On Facebook Page')
          ],
        ),
      ),
    );
  }
}
