import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giphy_get/giphy_get.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

// image from gallery
Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (error) {
    showSnackBar(
      context: context,
      content: error.toString(),
    );
  }
  return image;
}

// video from gallery
Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? video;
  try {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      video = File(pickedVideo.path);
    }
  } catch (error) {
    showSnackBar(
      context: context,
      content: error.toString(),
    );
  }
  return video;
}

// gif from gallery
Future<GiphyGif?> pickGIF(BuildContext context) async {
  GiphyGif? gif;
  try {
    gif = await GiphyGet.getGif(
      context: context,
      apiKey: "your api key HERE",
    );
  } catch (error) {
    showSnackBar(
      context: context,
      content: error.toString(),
    );
  }
  return gif;
}
