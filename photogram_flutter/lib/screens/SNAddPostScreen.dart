import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';

class SNAddPostScreen extends StatefulWidget {
  static String tag = '/SNAddPostScreen';

  @override
  SNAddPostScreenState createState() => SNAddPostScreenState();
}

class SNAddPostScreenState extends State<SNAddPostScreen> {
  CameraController? cameraController;
  List? cameras;
  late int selectedCameraIndex;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    availableCameras().then((value) {
      cameras = value;
      if (cameras!.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        initCamera(cameras![selectedCameraIndex]).then((value) {});
      } else {
        print('No camera available');
      }
    }).catchError((e) {
      print('Error : ${e.code}');
    });
  }

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController!.dispose();
    }

    cameraController = CameraController(cameraDescription, ResolutionPreset.high);

    cameraController!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController!.value.hasError) {
      print('Camera Error ${cameraController!.value.errorDescription}');
    }

    try {
      await cameraController!.initialize();
    } catch (e) {
      String errorText = 'Error ${e.toString()} \nError message: ${e.toString()}';
    }

    if (mounted) {
      setState(() {});
    }
  }

  onCapture(context) async {
    try {
      final p = await getTemporaryDirectory();
      final name = DateTime.now();
      final path = "${p.path}/$name.png";

      await cameraController!.takePicture().then((value) {
        print('here');
        print(path);
      });
    } catch (e) {}
  }

  getCameraLensIcons(lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return CupertinoIcons.photo_camera;
      default:
        return Icons.device_unknown;
    }
  }

  onSwitchCamera() {
    selectedCameraIndex = selectedCameraIndex < cameras!.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras![selectedCameraIndex];
    initCamera(selectedCamera);
  }

  Widget cameraToggle() {
    if (cameras == null || cameras!.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras![selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
          onPressed: () {
            onSwitchCamera();
          },
          icon: Icon(getCameraLensIcons(lensDirection), color: Colors.white, size: 24),
          label: Text(
            '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget cameraPreview() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return Text(
        'Loading',
        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      );
    }

    return AspectRatio(
      aspectRatio: cameraController!.value.aspectRatio,
      child: CameraPreview(cameraController!),
    );
  }

  @override
  void dispose() {
    super.dispose();
    cameraController?.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: cameraPreview(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
            ).paddingOnly(bottom: 24)
          ],
        ),
      ),
    );
  }
}
