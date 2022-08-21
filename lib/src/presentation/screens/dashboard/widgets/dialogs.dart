import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class Dialogs {
  static void showTextDialog({
    required BuildContext context,
    required Widget icon,
    required String title,
    required String message,
    required VoidCallback onTapYes,
  }) {
    showMacosAlertDialog(
      context: context,
      builder: (context_) => MacosAlertDialog(
        appIcon: const MacosIcon(
          CupertinoIcons.trash,
          size: 32,
        ),
        title: Text(
          title,
          style: MacosTheme.of(context)
              .typography
              .title2
              .copyWith(fontWeight: FontWeight.bold),
        ),
        message: Text(
          message,
          textAlign: TextAlign.center,
        ),
        horizontalActions: false,
        primaryButton: PushButton(
          buttonSize: ButtonSize.large,
          onPressed: onTapYes,
          child: const Text('YES'),
        ),
        secondaryButton: PushButton(
          buttonSize: ButtonSize.large,
          isSecondary: true,
          onPressed: Navigator.of(context).pop,
          child: const Text('NO'),
        ),
      ),
    );
  }

  static void showEditTextDialog({
    required BuildContext context,
    required Widget icon,
    required String title,
    String placeholder = '',
    required TextEditingController controller,
    required VoidCallback onTapYes,
  }) {
    showMacosAlertDialog(
      context: context,
      builder: (context_) => MacosAlertDialog(
        appIcon: icon,
        title: Text(
          title,
          style: MacosTheme.of(context)
              .typography
              .title2
              .copyWith(fontWeight: FontWeight.bold),
        ),
        message: MacosTextField(
          controller: controller,
          placeholder: placeholder,
        ),
        horizontalActions: false,
        primaryButton: PushButton(
          buttonSize: ButtonSize.large,
          onPressed: onTapYes,
          child: const Text('YES'),
        ),
        secondaryButton: PushButton(
          buttonSize: ButtonSize.large,
          isSecondary: true,
          onPressed: Navigator.of(context).pop,
          child: const Text('NO'),
        ),
      ),
    );
  }
}
