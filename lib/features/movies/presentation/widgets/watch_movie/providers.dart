import 'package:flutter/material.dart';

class Providers extends StatelessWidget {
  final String movieId;
  const Providers({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
          "$movieId jksahdksahfdilhdsliufhsdilufhidushfiduslahfluidashfuidashfiusdhfuihsdiufhsduilhfiusdhfuisdhifuhsuiafhlds\ndiashjduiahliudhsduifhilsduhfuilsdhfuilsdhilfuhsdilufhsdilufhsdilufhsduihfiusdhius\nadfjhghasdjkyfgbksdyuagfuysdgfuysdgyufgsduyafgusdykgfusdgfdsak hola"),
    );
  }
}
