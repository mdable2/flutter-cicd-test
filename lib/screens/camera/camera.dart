import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'package:firebase_storage/firebase_storage.dart';

/********** TODO: Added...finish taking picture save image path logic
class CameraState extends State<CameraWidget> {
  final GlobalKey<ScaffoldState> scaffoldKey= GlobalKey<ScaffoldState>();
  CameraController controller;
  
  // Variables for keeping state and image path for camera operations
  bool isReady = false;
  bool showCamera = true;
  String imagePath;
}
Future<String> takePicture() async {
  final Directory extDir = await getApplicationDocumentsDirectory();
}
***************/

List<CameraDescription> cameras;

class CameraWidget extends StatefulWidget {
  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<CameraWidget> {
  List<CameraDescription> cameras;
  CameraController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    setupCameras();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
    } on CameraException catch (_) {
      setState(() {
        isReady = false;
      });
    }
    setState(() {
      isReady = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Take a picture")),
      body: FutureBuilder<void>(
        builder: (context, snapshot) {
          if (!isReady && !controller.value.isInitialized) {
            return Container();
          }
          return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(controller));
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback
        onPressed: () async {
          // Take the Picture in a try / catch block
          try {
            // TODO: might need to initialzie a controllerFuture as in here: https://flutter.dev/docs/cookbook/plugins/picture-using-camera

            // Construct the path where the image should be saved using the pattern package
            final path = join(
              // Store the picture in the temp directory
              // Find the temp directory using the 'path_provider' plugin
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved
            await controller.takePicture(path);

            // Upload image to Firebase Storage
            final StorageReference storageRef = FirebaseStorage.instance.ref().child(path);
            final StorageUploadTask uploadTask = storageRef.putFile(File(path));
            final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
            final String url = (await downloadUrl.ref.getDownloadURL());
            print("URL is $url");

            // If picture was taken, display it on a new screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          }
          catch(e) {
            // Print to console the error if occurs
            print(e);
          }

        }),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}