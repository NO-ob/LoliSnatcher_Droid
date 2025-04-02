import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class TagsManagerListFilter extends StatelessWidget {
  const TagsManagerListFilter({
    required this.title,
    required this.controller,
    required this.onChanged,
    super.key,
  });

  final String title;
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SettingsTextInput(
              onlyInput: true,
              controller: controller,
              onChanged: onChanged,
              title: title,
              hintText: title,
              inputType: TextInputType.text,
              clearable: true,
              pasteable: true,
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 5),
              enableIMEPersonalizedLearning: !SettingsHandler.instance.incognitoKeyboard,
            ),
          ),
        ],
      ),
    );
  }
}
