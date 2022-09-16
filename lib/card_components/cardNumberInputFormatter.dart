import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue){
    var text = newValue.text;

    if(newValue.selection.baseOffset==0){
      return newValue;
    }
    var buffer = StringBuffer();
    for(int i = 0; i < text.length; i++){
      buffer.write(text[i]);
      var noneZeroIndex = i + 1;
      if (noneZeroIndex % 4 == 0 && noneZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length)
    );
  }
}