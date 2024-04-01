import 'package:flutter/material.dart';

class GeneralErrorWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget? body;
  final String? message;
  final String? buttonText;

  const GeneralErrorWidget({
    super.key,
    this.onTap,
    this.message,
    this.body,
    this.buttonText,
  });

  @override
  State<GeneralErrorWidget> createState() => _GeneralErrorWidgetState();
}

class _GeneralErrorWidgetState extends State<GeneralErrorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          widget.body ?? Container(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.message ?? "Something went wrong. Please try again",
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: const Size(120, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Try Again'),
            ),
          )
        ],
      ),
    );
  }
}
