import 'package:flutter/material.dart';

Widget buildDivider() {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
    child: Divider(
      color: Colors.grey.withOpacity(.2),
    ),
  );
}
