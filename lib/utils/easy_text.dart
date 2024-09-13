 
import '../../import.dart';


class EasyText extends StatelessWidget {
  const EasyText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.start,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w400,
      this.color = Colors.black,
      this.decoration = TextDecoration.none,
      this.maxLine,
      this.overflow = TextOverflow.ellipsis});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration;
  final TextOverflow overflow;
  final int? maxLine;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      maxLines: maxLine,
      style: TextStyle(
        fontSize: FontTypography.getFontSizeByDevice(context, fontSize),
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
        decorationColor: Colors.white,
        decorationThickness: 2.0,
        overflow: overflow,
        fontFamily: isEng(text) ? 'Inter' : 'myanmar',
      ),
    );
  }
}

bool isEng(String text) {
  // final RegExp english1 = RegExp(r'^[a-zA-Z]+');
  // final RegExp english2 = RegExp(r'[a-zA-Z]');
  // final RegExp english3 = RegExp(r"[a-zA-Z\s.,?!']+$");
  final RegExp myanmarPattern = RegExp(r'[\u1000-\u109F\uAA60-\uAA7F]+');
  return !myanmarPattern.hasMatch(text);
  // final RegExp english = RegExp(r"[a-zA-Z0-9\s.,?!']+$");
  // return english.hasMatch(text);
}
