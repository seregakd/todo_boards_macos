import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class AddProjectWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTapAdd;

  const AddProjectWidget({
    super.key,
    required this.controller,
    required this.onTapAdd,
  });

  @override
  Widget build(BuildContext context) {
    return MacosSheet(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'Create new project',
              style: MacosTheme
                  .of(context)
                  .typography
                  .title1
                  .copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MacosTextField(
                controller: controller,
                placeholder: 'Project name',
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PushButton(
                  buttonSize: ButtonSize.large,
                  isSecondary: true,
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('No'),
                ),
                const SizedBox(width: 24),
                PushButton(
                  buttonSize: ButtonSize.large,
                  onPressed: onTapAdd,
                  child: const Text('Create'),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}