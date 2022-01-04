import 'package:flutter/material.dart';

class MainPageListTile extends StatelessWidget {
  const MainPageListTile({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
