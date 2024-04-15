// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';
import 'package:facebook_autamation_adnan/core/functions.dart';
import 'package:facebook_autamation_adnan/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

class FacebookPostImage extends StatefulWidget {
  const FacebookPostImage({super.key});

  @override
  FacebookPostImageState createState() => FacebookPostImageState();
}

class FacebookPostImageState extends State<FacebookPostImage> {
  String? imageLocation;
  String caption = 'Add Caption';
  TextEditingController controller = TextEditingController();
  bool isLoading = false;

  selectImage() async {
    imageLocation = await pickImage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Facebook Post Image',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                    image: imageLocation == null
                        ? const DecorationImage(
                            image: AssetImage('asset/10832788.jpg'),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: FileImage(File(imageLocation!)),
                            fit: BoxFit.cover,
                          ))),
            const SizedBox(height: 50),
            SizedBox(
              width: 250,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Add Caption'),
                onChanged: (value) {
                  setState(() {
                    caption = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButtonWidget(
              onPressed: selectImage,
              buttonText: 'Select Image',
            ),
            const SizedBox(height: 20),
            isLoading == false
                ? ElevatedButtonWidget(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await postImageToFacebook(
                          imageLocation, caption, context);
                      setState(() {
                        isLoading = false;
                      });
                    },
                    buttonText: 'Post Image to Facebook',
                  )
                : const CircularProgressIndicator(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
