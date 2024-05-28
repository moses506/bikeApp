import 'package:flutter/material.dart';

enum DialogType { info, yesNo, input }

Future<dynamic> showAppDialog(
  BuildContext context, {
  required String title,
  required String message,
  String yesText = 'Yes',
  String noText = 'No',
  String labelText = 'Enter value here',
  DialogType dialogType = DialogType.yesNo,
  void Function(String?)? onConfirm,
  bool barrierDismissible = true,
  TextInputType? inputType,
  String? initialInput,
}) async {
  return showDialog<dynamic>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => _AppAlertDialog(
      title: title,
      message: message,
      yesText: yesText,
      noText: noText,
      labelText: labelText,
      dialogType: dialogType,
      onConfirm: onConfirm,
      initialInput: initialInput,
      inputType: inputType,
    ),
  );
}

class _AppAlertDialog extends StatelessWidget {
  const _AppAlertDialog({
    required this.title,
    required this.message,
    required this.yesText,
    required this.noText,
    required this.dialogType,
    required this.labelText,
    this.initialInput,
    this.inputType,
    this.onConfirm,
  });

  final String title;
  final String message;
  final String yesText;
  final String noText;
  final String labelText;
  final String? initialInput;
  final TextInputType? inputType;
  final DialogType dialogType;
  final void Function(String?)? onConfirm;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialInput);
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          if (dialogType == DialogType.input) ...[
            TextField(
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(labelText: labelText),
            ),
            const SizedBox(height: 16),
          ],
          FilledButton(
            onPressed: () {
              Navigator.pop(context, true);
              onConfirm?.call(controller.text);
            },
            child: Text(yesText),
          ),
          const SizedBox(height: 4),
          if (dialogType == DialogType.yesNo)
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(noText),
            ),
        ],
      ),
    );
  }
}
