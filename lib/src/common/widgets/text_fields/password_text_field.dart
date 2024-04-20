// import 'package:flutter/material.dart';
// import 'package:tele_flicks/src/common/res/app_colors.dart';
// import 'package:tele_flicks/src/common/widgets/text_fields/mc_text_field.dart';

// class PasswordTextFiled extends StatefulWidget {
//   final TextEditingController controller;
//   final double? horizontalPadding;
//   final TextInputType? keyboardType;
//   final bool obscureText;
//   final bool isObscured;
//   // final TextCapitalization textCapitalization;
//   // final TextInputAction textInputAction;
//   // final bool autocorrect;
//   // final Widget? prefixIcon;
//   // final String? prefixText;
//   final String? hint;
//   final String? errorText;
//   final String? labelText;
//   final Widget? suffixIcon;
//   // final ValueChanged<String>? onChanged;
//   // final ValueChanged<String>? onSubmitted;
//   // final List<TextInputFormatter> inputFormatters;
//   // final String? error;
//   // final bool showErrorText;
//   // final FocusNode? focusNode;
//   // final String? labelText;

//   const PasswordTextFiled({
//     super.key,
//     required this.controller,
//     this.horizontalPadding = 50.0,
//     this.keyboardType,
//     this.obscureText = false,
//     this.isObscured = false,
//     this.suffixIcon,
//     // this.textCapitalization = TextCapitalization.none,
//     // this.textInputAction = TextInputAction.newline,
//     // this.autocorrect = false,
//     // this.prefixIcon,
//     // this.prefixText,
//     this.hint,
//     this.errorText,
//     this.labelText,
//     // this.onChanged,
//     // this.onSubmitted,
//     // required this.inputFormatters,
//     // this.error,
//     // this.showErrorText = true,
//     // this.focusNode,
//     // this.labelText,
//   });

//   @override
//   _PasswordTextFiledState createState() => _PasswordTextFiledState();
// }

// class _PasswordTextFiledState extends State<PasswordTextFiled> {
//   // FocusNode? _focusNode;
//   // late bool _isEmpty;

//   @override
//   void initState() {
//     super.initState();
//     // _focusNode = widget.focusNode ?? FocusNode();
//     // _focusNode!.addListener(_onFocusChanged);
//     // _isEmpty = (widget.controller?.text ?? '').isEmpty;
//   }

//   @override
//   void dispose() {
//     // _focusNode!.removeListener(_onFocusChanged);
//     // if (widget.focusNode == null) {
//     //   _focusNode!.dispose();
//     // }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final theme = Theme.of(context);

//     // final prefixTextStyle = _focusNode!.hasFocus || !_isEmpty
//     //     ? theme.textTheme.titleMedium
//     //     : theme.inputDecorationTheme.hintStyle;

//     // Widget? prefixWidget;
//     // if (widget.prefixIcon != null && widget.prefixText != null) {
//     //   prefixWidget = Row(
//     //     mainAxisSize: MainAxisSize.min,
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: [
//     //       widget.prefixIcon!,
//     //       Padding(
//     //         padding: const EdgeInsets.only(top: _prefixTextTopPadding),
//     //         child: Text(
//     //           widget.prefixText!,
//     //           style: prefixTextStyle,
//     //         ),
//     //       ),
//     //     ],
//     //   );
//     // } else if (widget.prefixIcon != null) {
//     //   prefixWidget = widget.prefixIcon;
//     // } else if (widget.prefixText != null) {
//     //   prefixWidget = Padding(
//     //     padding: EdgeInsets.only(
//     //       left: _hPadding,
//     //       top: _prefixTextTopPadding,
//     //     ),
//     //     child: Text(
//     //       widget.prefixText!,
//     //       style: prefixTextStyle,
//     //     ),
//     //   );
//     // } else {
//     //   prefixWidget = const SizedBox(width: _hPadding);
//     // }

//     // final errorBorder = (widget.error != null && !widget.showErrorText)
//     //     ? OutlineInputBorder(
//     //         borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
//     //       )
//     //     : null;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 0),
//       child: MCTextField(
//         controller: widget.controller,
//         obscureText: widget.obscureText,
//         keyboardType: widget.keyboardType,
//         suffixIcon: IconButton(
//           icon: Icon(
//             widget.isObscured ? Icons.visibility : Icons.visibility_off,
//           ),
//           onPressed: () =>widget.onSuffixIconPress;
//         ),
//       ),
//     );
//   }
// }
