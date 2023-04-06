import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class TranslaterController extends GetxController {
  TextEditingController textt = TextEditingController();

  var isListerning = 0.obs;
  List charList = [].obs;
  List showsigns = [].obs;
  var text = "".obs;
  static const List<Map<String, String>> handsignsMap = [
    {'A': 'assets/signlangwage/A.jpg'},
    {'B': 'assets/signlangwage/B.jpg'},
    {'C': 'assets/signlangwage/C.jpg'},
    {'D': 'assets/signlangwage/D.jpg'},
    {'E': 'assets/signlangwage/E.jpg'},
    {'F': 'assets/signlangwage/F.jpg'},
    {'G': 'assets/signlangwage/G.jpg'},
    {'H': 'assets/signlangwage/H.jpg'},
    {'I': 'assets/signlangwage/I.jpg'},
    {'J': 'assets/signlangwage/J.jpg'},
    {'K': 'assets/signlangwage/K.jpg'},
    {'L': 'assets/signlangwage/L.jpg'},
    {'M': 'assets/signlangwage/M.jpg'},
    {'N': 'assets/signlangwage/N.jpg'},
    {'O': 'assets/signlangwage/O.jpg'},
    {'P': 'assets/signlangwage/P.jpg'},
    {'Q': 'assets/signlangwage/Q.jpg'},
    {'R': 'assets/signlangwage/R.jpg'},
    {'S': 'assets/signlangwage/S.jpg'},
    {'T': 'assets/signlangwage/T.jpg'},
    {'U': 'assets/signlangwage/U.jpg'},
    {'V': 'assets/signlangwage/V.jpg'},
    {'W': 'assets/signlangwage/W.jpg'},
    {'X': 'assets/signlangwage/X.jpg'},
    {'Y': 'assets/signlangwage/Y.jpg'},
    {'Z': 'assets/signlangwage/Z.jpg'},
    {' ': 'assets/signlangwage/space.jpg'},
    {'0': 'assets/signlangwage/numbers/0.jpg'},
    {'1': 'assets/signlangwage/numbers/1.jpg'},
    {'2': 'assets/signlangwage/numbers/2.jpg'},
    {'3': 'assets/signlangwage/numbers/3.jpg'},
    {'4': 'assets/signlangwage/numbers/4.jpg'},
    {'5': 'assets/signlangwage/numbers/5.jpg'},
    {'6': 'assets/signlangwage/numbers/6.jpg'},
    {'7': 'assets/signlangwage/numbers/7.jpg'},
    {'8': 'assets/signlangwage/numbers/8.jpg'},
    {'9': 'assets/signlangwage/numbers/9.jpg'},
  ];

  SpeechToText speechToText = SpeechToText();

  void TranslateToSign() {
    charList = text.split('').toList(); // [H, e, l, l, o,  , W, o, r, l, d]
    showsigns = List.filled(charList.length, null);
    for (int i = 0; i < charList.length; i++) {
      showsigns[i] = handsignsMap
          .where((element) =>
              element.containsKey(charList[i].toString().toUpperCase()))
          .first;
    }
    print(showsigns.length);
    update();
  }

  WrittenMessage() {
    if (textt.text.isEmpty) {
      Get.snackbar("Alert", "Please Enter a Message");
    }
    text.value = textt.text;
    TranslateToSign();
  }

  ListernToUser() async {
    if (isListerning.value == 0) {
      var avalable = await speechToText.initialize();
      if (avalable) {
        isListerning.value = 1;
        speechToText.listen(
          onResult: (result) {
            textt.text = result.recognizedWords;
            text.value = result.recognizedWords;
          },
        );
      }
    }
  }

  stopListerning() {
    isListerning.value = 0;
    speechToText.stop();
    if (text.value == "") {
      Get.snackbar("Alert", "Could not hear you, Please Try Again");
    }
    TranslateToSign();
  }
}
