import 'package:my_portfolio/utils/responsive.dart';

import '../../import.dart';

class TypingStyleWidget extends StatelessWidget {
  const TypingStyleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: ResponsiveUtils.screenWidthMultiply(context) * 0.06),
      width: double.maxFinite,
      
      child: Align(
        alignment: Alignment.centerLeft,
        child: Selector<HomePageProvider, String>(
            selector: (_, provider) => provider.currentText,
            builder: (_, currText, __) {
              return EasyText(
                text: currText,
                color: Colors.white,
                fontSize: 40,
              );
            }),
      ),
    );
  }
}

class HomePageBackgroundWiget extends StatelessWidget {
  const HomePageBackgroundWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 800,
      color: Colors.yellow,

    );
  }
}
