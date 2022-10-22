import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

TakeScreenshot(
    {required ScreenshotController controller, required String text}) {
  return controller.capture().then((image) async {
    final directory = (await getExternalStorageDirectory())?.path;
    File imgFile = new File('$directory/Coinstate.png');
    imgFile.writeAsBytes(image!);
    // final RenderBox box = context.findRenderObject();
    Share.shareFiles(['$directory/Coinstate.png'],
        subject: 'Share ScreenShot', text: text);
  });
}
