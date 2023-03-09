library better_serve_lib;

import 'package:flutter/material.dart';

class DialogPane extends StatefulWidget {
  final Widget? child;
  final Widget Function(BuildContext context, Function() toggleLoadding)?
      builder;
  final String tag;
  final double width;
  final double minHeight;
  final double? maxHeight;
  const DialogPane({
    Key? key,
    this.builder,
    this.child,
    required this.tag,
    required this.width,
    this.minHeight = 0,
    this.maxHeight,
  }) : super(key: key);

  @override
  State<DialogPane> createState() => _DialogPaneState();
}

class _DialogPaneState extends State<DialogPane> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: widget.tag,
              child: Container(
                width: widget.width,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                constraints: BoxConstraints(
                    minHeight: widget.minHeight,
                    maxHeight: widget.maxHeight ?? size.height),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            widget.child ??
                                widget.builder!(context, () {
                                  setState(() {
                                    loading = !loading;
                                  });
                                }),
                            if (loading)
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.black.withAlpha(100),
                                  child: const Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
