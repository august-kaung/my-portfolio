import "dart:convert";
import "dart:typed_data";

const String _alphabet = "0123456789abcdef";
const HexCodec hex = HexCodec();

class HexCodec extends Codec<List<int>, String> {
  const HexCodec();

  @override
  Converter<List<int>, String> get encoder => const HexEncoder();

  @override
  Converter<String, List<int>> get decoder => const HexDecoder();
}

class HexEncoder extends Converter<List<int>, String> {
  final bool upperCase;

  const HexEncoder({this.upperCase = false});

  @override
  String convert(List<int> input) {
    StringBuffer buffer = StringBuffer();
    for (int part in input) {
      if (part & 0xff != part) {
        throw const FormatException("Non-byte integer detected");
      }
      buffer.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    if (upperCase) {
      return buffer.toString().toUpperCase();
    } else {
      return buffer.toString();
    }
  }
}

class HexDecoder extends Converter<String, List<int>> {
  const HexDecoder();

  @override
  List<int> convert(String input) {
    String str = input.replaceAll(" ", "");
    str = str.toLowerCase();
    if (str.length % 2 != 0) {
      str = "0$str";
    }
    Uint8List result = Uint8List(str.length ~/ 2);
    for (int i = 0; i < result.length; i++) {
      int firstDigit = _alphabet.indexOf(str[i * 2]);
      int secondDigit = _alphabet.indexOf(str[i * 2 + 1]);
      if (firstDigit == -1 || secondDigit == -1) {
        throw FormatException("Non-hex character detected in $input");
      }
      result[i] = (firstDigit << 4) + secondDigit;
    }
    return result;
  }
}
