import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:google_ml_kit/google_ml_kit.dart'; // Import google_ml_kit

import '../includes/Frame_Corner.dart'; // Import the new file here

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isReady = false;
  bool showSnapButton = true;
  bool showRetakeButton = false;
  List<String> extractedTexts = []; // List to hold extracted texts
  Color frameColor = Colors.white; // Initial frame color set to white
  String warningMessage = '';

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        controller = CameraController(cameras![0], ResolutionPreset.high);
        await controller?.initialize();
        controller?.startImageStream((CameraImage image) async {
          if (isReady) {
            await analyzeFrame(image);
          }
        });
        setState(() {
          isReady = true;
        });
      } else {
        print('No cameras found');
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> analyzeFrame(CameraImage cameraImage) async {
    // Convert CameraImage to img.Image
    final img.Image image = convertCameraImage(cameraImage);

    double variance = calculateVarianceOfLaplacian(image);
    bool isBlurred = variance < 50;

    print('Image variance: $variance'); // Debug print
    print('Is image blurred: $isBlurred'); // Debug print

    setState(() {
      if (isBlurred) {
        frameColor = Colors.red;
        warningMessage = 'Image is too blurry';
        showSnapButton = false;
        showRetakeButton = false;
      } else {
        frameColor = Colors.white;
        warningMessage = '';
        showSnapButton = true;
        showRetakeButton = false;
      }
    });
  }

  img.Image convertCameraImage(CameraImage cameraImage) {
    // Convert CameraImage to img.Image here
    // Handle YUV to RGB conversion
    return img.Image.fromBytes(cameraImage.width, cameraImage.height, cameraImage.planes[0].bytes);
  }

  double calculateVarianceOfLaplacian(img.Image image) {
    final laplacianImage = applyLaplacianFilter(image);

    double mean = 0.0;
    double squaredSum = 0.0;
    int count = 0;

    for (int y = 0; y < laplacianImage.height; y++) {
      for (int x = 0; x < laplacianImage.width; x++) {
        int pixel = laplacianImage.getPixel(x, y);
        double laplacianValue = img.getLuminance(pixel).toDouble();
        mean += laplacianValue;
        squaredSum += laplacianValue * laplacianValue;
        count++;
      }
    }

    mean /= count;
    double variance = (squaredSum / count) - (mean * mean);
    return variance;
  }

  img.Image applyLaplacianFilter(img.Image image) {
    final kernel = [
      [0, -1, 0],
      [-1, 4, -1],
      [0, -1, 0],
    ];

    final result = img.Image(image.width, image.height);

    for (int y = 1; y < image.height - 1; y++) {
      for (int x = 1; x < image.width - 1; x++) {
        int sum = 0;
        for (int ky = 0; ky < 3; ky++) {
          for (int kx = 0; kx < 3; kx++) {
            final pixel = image.getPixel(x + kx - 1, y + ky - 1);
            final gray = img.getRed(pixel) * 0.3 + img.getGreen(pixel) * 0.59 + img.getBlue(pixel) * 0.11;
            sum += gray.toInt() * kernel[ky][kx];
          }
        }
        final newValue = (sum < 0) ? 0 : (sum > 255) ? 255 : sum;
        result.setPixel(x, y, img.getColor(newValue, newValue, newValue));
      }
    }

    return result;
  }

  Future<void> _snapImage() async {
    if (controller != null && controller!.value.isInitialized) {
      try {
        final image = await controller!.takePicture();
        print('Image path: ${image.path}'); // Debug print
        await analyzeImage(image.path); // Analyze image for blur
      } catch (e) {
        print('Error capturing image: $e');
      }
    }
  }

  Future<void> analyzeImage(String imagePath) async {
    final File imageFile = File(imagePath);
    final img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;

    double variance = calculateVarianceOfLaplacian(image);
    bool isBlurred = variance < 50;

    print('Image variance: $variance'); // Debug print
    print('Is image blurred: $isBlurred'); // Debug print

    if (!isBlurred) {
      // Proceed to extract text if image is not blurry
      await extractTextFromImage(imagePath);
    } else {
      // Update UI for blurry image
      setState(() {
        frameColor = Colors.red;
        warningMessage = 'Image is too blurry';
        showSnapButton = false;
        showRetakeButton = true;
      });
    }
  }

  Future<void> extractTextFromImage(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final textRecognizer = GoogleMlKit.vision.textRecognizer();

    try {
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      setState(() {
        extractedTexts.add(recognizedText.text); // Append new text
        print('Extracted text: ${recognizedText.text}'); // Print extracted text to terminal
        warningMessage = '';
        showSnapButton = true; // Allow snapping again
        showRetakeButton = false;
      });
    } catch (e) {
      print('Error extracting text: $e');
      setState(() {
        warningMessage = 'Failed to extract text';
        showSnapButton = true;
        showRetakeButton = false;
      });
    } finally {
      textRecognizer.close();
    }
  }

  void _retakeImage() {
    setState(() {
      frameColor = Colors.white; // Reset frame color to white
      warningMessage = '';
      showSnapButton = false;
      showRetakeButton = false;
    });
  }

  List<Widget> _buildCodeWithLineNumbers() {
    List<Widget> lines = [];
    int lineNumber = 1;
    for (String text in extractedTexts) {
      List<String> codeLines = text.split('\n');
      for (String line in codeLines) {
        lines.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$lineNumber  ',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Courier',
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: Text(
                  line,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Courier',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
        lineNumber++;
      }
    }
    return lines;
  }

  @override
  Widget build(BuildContext context) {
    if (!isReady || controller == null || !controller!.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(title: Text('Camera')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final aspectRatio = controller!.value.aspectRatio;

    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final height = constraints.maxWidth / aspectRatio;
              return Stack(
                children: [
                  Container(
                    height: height,
                    child: AspectRatio(
                      aspectRatio: aspectRatio,
                      child: CameraPreview(controller!),
                    ),
                  ),
                  CustomPaint(
                    painter: CornerPainter(color: frameColor),
                    child: Container(
                      width: constraints.maxWidth,
                      height: height,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      color: Colors.black54, // Background for better readability
                      padding: EdgeInsets.all(8),
                      child: Text(
                        warningMessage.isNotEmpty ? warningMessage : '',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  // Centered Snap Button with top margin
                  if (showSnapButton || showRetakeButton) // Show button conditionally
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 100), // Adjust the top margin as needed
                        child: ElevatedButton(
                          onPressed: showSnapButton ? _snapImage : _retakeImage,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            backgroundColor: Color(0xFF0b7970),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            showSnapButton ? 'Snap Code' : 'Retake Photo', // Change text based on button state
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Color(0xFF293038),
              child: Column(
                children: [
                  Container(
                    color: Color(0xFF1e2629),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    child: Text(
                      'Activity #1 / Question #1 / BSIT - 1A / Kim, A.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(8),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildCodeWithLineNumbers(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        backgroundColor: Color(0xFF0b7970),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Finish',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
