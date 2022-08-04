import 'package:flutter/cupertino.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo/logo.png",
      height: 80.0,
    );
  }
}
