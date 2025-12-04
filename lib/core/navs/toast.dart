import 'package:flutter/material.dart';

class Toast extends StatefulWidget {
  const Toast({required Key key, required this.child}): super(key:key);
  final Widget child;

  @override
  ToastState createState() => ToastState();
}

class ToastState extends State<Toast> {
  static const _toastDuration = Duration(seconds: 2);
  var _showToast = false;
  Widget? _toastBody;

  Future<void> showToast(
  {
    required Widget child,
    Duration duration = const Duration(seconds: 3),
}
      )async {
    _toastBody = child;
    setState(()=> _showToast = true);
    await Future.delayed(duration);
    setState(()=> _showToast = false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
      Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedOpacity(opacity: _showToast ? 1 : 0, duration: _toastDuration,
              child: _ToastWidget(
                child: _toastBody,
              ),
              ),
              const SizedBox(height: 10),
            ],
        )
      )
    ]);
  }
}

class _ToastWidget extends StatelessWidget {
  const _ToastWidget({Key? key , this.child}): super (key: key);

  final Widget? child;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(10),
    ),
        child: child ?? const Text('toast'));
  }
}
