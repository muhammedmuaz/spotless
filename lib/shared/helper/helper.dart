/// [removeFocus] is a fun , that is used for remove the focus of the FocusNode

import 'package:flutter/material.dart';

void removeFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
  return;
}
