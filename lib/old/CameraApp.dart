import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';


List<CameraDescription> cameras;

Future<void> openCameras() async{
  cameras = await availableCameras();
  runApp(CameraApp());
}
class CameraApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => _CameraAppState();

}

class _CameraAppState extends State<CameraApp>{

  CameraController controller;

  @override
  void initState(){
    super.initState();
    controller = CameraController(cameras[0],ResolutionPreset.medium);
    controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState((){});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(!controller.value.isInitialized){
      return Container();
    }
    return AspectRatio(
      aspectRatio:
      controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

}