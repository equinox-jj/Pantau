import 'package:material_ui/material_ui.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  static Future<T?> show<T>(BuildContext context) => showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (context) => const LoadingDialog(),
  );

  static void dismiss(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const .all(16),
        child: const Row(
          spacing: 16,
          children: [CircularProgressIndicator(), Text('Loading...')],
        ),
      ),
    );
  }
}
