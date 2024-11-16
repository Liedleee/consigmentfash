import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io'; // Impor File dari dart:io

class SensorController extends GetxController {
  var isCameraReady = false.obs;
  var cameraController = Rx<CameraController?>(null);
  var videoPlayerController = Rx<VideoPlayerController?>(null);
  var selectedImage = Rx<XFile?>(null); // Untuk gambar
  var selectedVideo = Rx<XFile?>(null); // Untuk video
  var isRecording = false.obs; // Menyimpan status apakah sedang merekam video

  // Inisialisasi Kamera
  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    cameraController.value =
        CameraController(cameras[0], ResolutionPreset.high);
    await cameraController.value?.initialize();
    isCameraReady.value = true;
  }

  // Ambil gambar menggunakan kamera
  Future<void> takePicture() async {
    try {
      final image = await cameraController.value?.takePicture();
      selectedImage.value = image;
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  // Ambil video menggunakan kamera
  Future<void> recordVideo() async {
    try {
      // Mulai rekaman video
      await cameraController.value?.startVideoRecording();
      isRecording.value = true; // Menandakan sedang merekam
    } catch (e) {
      print("Error recording video: $e");
    }
  }

  // Stop rekaman video dan buat player
  Future<void> stopRecording() async {
    try {
      // Stop rekaman video dan simpan path file
      final videoFile = await cameraController.value?.stopVideoRecording();
      if (videoFile != null) {
        selectedVideo.value = XFile(videoFile.path);

        // Konversi XFile ke File
        final file = File(selectedVideo.value!.path);

        // Setelah rekaman selesai, buat video player controller
        videoPlayerController.value = VideoPlayerController.file(file)
          ..initialize().then((_) {
            videoPlayerController.value?.play();
          });
      }
      isRecording.value = false; // Menandakan rekaman selesai
    } catch (e) {
      print("Error stopping video: $e");
    }
  }

  @override
  void onClose() {
    cameraController.value?.dispose();
    videoPlayerController.value?.dispose();
    super.onClose();
  }
}
