// import 'package:flutter/material.dart';

// class CustomDialog extends StatelessWidget {
//   final Icon? icon;
//   final EdgeInsetsGeometry? iconPadding;
//   final Color? iconColor;
//   final Widget? title;
//   final EdgeInsetsGeometry? titlePadding;
//   final TextStyle? titleTextStyle;
//   final Widget? content;
//   final EdgeInsetsGeometry? contentPadding;
//   final TextStyle? contentTextStyle;
//   final VoidCallback? onYesPressed; // Callback for "Yes" button
//   final VoidCallback? onClosePressed; // Callback for "Close" button

//   CustomDialog({
//     Key? key,
//     this.icon,
//     this.iconPadding,
//     this.iconColor,
//     this.title,
//     this.titlePadding,
//     this.titleTextStyle,
//     this.content,
//     this.contentPadding,
//     this.contentTextStyle,
//     this.onYesPressed,
//     this.onClosePressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8), // Set border radius here
//       ),
//       insetPadding: EdgeInsets.all(8),
//       child: StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (title != null)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 010, vertical: 10.0),
//                   child: DefaultTextStyle(
//                     style: Theme.of(context).textTheme.headline6!,
//                     child: title!,
//                   ),
//                 ),
//               if (content != null)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 04.0, vertical: 1.0),
//                   child: DefaultTextStyle(
//                     style: Theme.of(context).textTheme.bodyText2!,
//                     child: content!,
//                   ),
//                 ),
//               if (onYesPressed != null || onClosePressed != null)
//                 ButtonBar(
//                   children: [
//                     if (onYesPressed != null)
//                       ElevatedButton(
//                         onPressed: () {
//                           if (onYesPressed != null) {
//                             onYesPressed!();
//                             Navigator.of(context).pop(); // Dismiss the dialog
//                           }
//                         },
//                         child: Text('Yes'),
//                       ),
//                     if (onClosePressed != null)
//                       ElevatedButton(
//                         onPressed: () {
//                           if (onClosePressed != null) {
//                             onClosePressed!();
//                             Navigator.of(context).pop(); // Dismiss the dialog
//                           }
//                         },
//                         child: Text('Close'),
//                       ),
//                   ],
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Icon? icon;
  final EdgeInsetsGeometry? iconPadding;
  final Color? iconColor;
  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final VoidCallback? onYesPressed; // Callback for "Yes" button
  final VoidCallback? onClosePressed; // Callback for "Close" button

  CustomDialog({
    Key? key,
    this.icon,
    this.iconPadding,
    this.iconColor,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.onYesPressed,
    this.onClosePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Set border radius here
      ),
      insetPadding: EdgeInsets.all(8),
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: DefaultTextStyle(
                    style: titleTextStyle ??
                        Theme.of(context).textTheme.titleLarge!,
                    child: title!,
                  ),
                ),
              if (content != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 10.0),
                  child: DefaultTextStyle(
                    style: contentTextStyle ??
                        Theme.of(context).textTheme.bodyMedium!,
                    child: content!,
                  ),
                ),
              if (onYesPressed != null || onClosePressed != null)
                ButtonBar(
                  children: [
                    if (onYesPressed != null)
                      ElevatedButton(
                        onPressed: () {
                          if (onYesPressed != null) {
                            onYesPressed!();
                            Navigator.of(context).pop(); // Dismiss the dialog
                          }
                        },
                        child: Text('Yes'),
                      ),
                    if (onClosePressed != null)
                      ElevatedButton(
                        onPressed: () {
                          if (onClosePressed != null) {
                            onClosePressed!();
                            Navigator.of(context).pop(); // Dismiss the dialog
                          }
                        },
                        child: Text('Close'),
                      ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
