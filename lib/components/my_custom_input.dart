import 'package:flutter/material.dart';

class MyCustomInput extends StatelessWidget {
  final String iconRoute;
  final String inputLabel;
  final String inputPlaceholder;
  final TextInputType inputType;
  final bool isTextHidden;
  final TextEditingController controller; 

  const MyCustomInput({
    super.key,
    required this.iconRoute,
    required this.inputLabel,
    required this.inputPlaceholder,
    required this.inputType,
    required this.isTextHidden, 
    required this.controller,
  });


  @override
  Widget build(BuildContext context) {
    //411.42857142857144
    double anchoPantalla = MediaQuery.of(context).size.width;

    //820.5714285714286
    double altoPantalla = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: altoPantalla * 0.0975609756097561,
      child: Row(
        children: [
          SizedBox(
            width: anchoPantalla * 0.121654501216545,
            height: altoPantalla * 0.0609756097560976,
            child: Image.asset(iconRoute),
          ),
          SizedBox(width: anchoPantalla * 0.0608272506082725),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    inputLabel,

                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: anchoPantalla * 0.048661800486618,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller, 
                      obscureText: isTextHidden,
                      keyboardType: inputType,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: anchoPantalla * 0.048661800486618,
                          color: const Color.fromARGB(255, 131, 130, 130),
                        ),
                        hintText: inputPlaceholder,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Colors
                                    .black, // Cambia el color de la línea a negro
                            width: 2.0, // Ajusta el ancho de la línea
                          ),
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
