import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final String textButton;
  const MyCustomButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    //411.42857142857144
    double anchoPantalla = MediaQuery.of(context).size.width;

    //820.5714285714286
    double altoPantalla = MediaQuery.of(context).size.height;
    return Container(
      width: anchoPantalla * 0.5596107055961071,
      height: altoPantalla * 0.0548780487804878,

      child: ElevatedButton(
        onPressed: () => print("tocando"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 31, 75, 165),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          textButton,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: anchoPantalla * 0.0437956204379562,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
