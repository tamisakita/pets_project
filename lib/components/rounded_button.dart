import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red[200],
      borderRadius: BorderRadius.circular(50),
      elevation: 4,
      child: InkWell(
        child: ListTile(
          onTap: onTap,
          title: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}