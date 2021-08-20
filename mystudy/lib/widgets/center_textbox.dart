import 'package:flutter/material.dart';

class centerTextBox extends StatelessWidget {
  const centerTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        // color: Colors.amber,
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.amber,
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  // spreadRadius: 10,
                  offset: Offset(2.0, 5.0))
            ],
            gradient: LinearGradient(colors: [Colors.red, Colors.yellow])),
        child: Text(
          "NOICE",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
