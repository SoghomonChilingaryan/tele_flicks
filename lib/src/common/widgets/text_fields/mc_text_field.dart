import 'package:flutter/material.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';

class MCTextField extends StatefulWidget {
  final TextEditingController controller;
  // final double? horizontalPadding;
  final TextInputType? keyboardType;
  final bool obscureText;
  // final TextCapitalization textCapitalization;
  // final TextInputAction textInputAction;
  // final bool autocorrect;
  // final Widget? prefixIcon;
  // final String? prefixText;
  final String? hint;
  final String? errorText;
  final String? labelText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  // final ValueChanged<String>? onSubmitted;
  // final List<TextInputFormatter> inputFormatters;
  // final String? error;
  // final bool showErrorText;
  // final FocusNode? focusNode;
  // final String? labelText;

  const MCTextField({
    super.key,
    required this.controller,
    // this.horizontalPadding = 50.0,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    // this.textCapitalization = TextCapitalization.none,
    // this.textInputAction = TextInputAction.newline,
    // this.autocorrect = false,
    // this.prefixIcon,
    // this.prefixText,
    this.hint,
    this.errorText,
    this.labelText,
    this.onChanged,
    // this.onSubmitted,
    // required this.inputFormatters,
    // this.error,
    // this.showErrorText = true,
    // this.focusNode,
    // this.labelText,
  });

  @override
  _MCTextFieldState createState() => _MCTextFieldState();
}

class _MCTextFieldState extends State<MCTextField> {
  // FocusNode? _focusNode;
  // late bool _isEmpty;

  @override
  void initState() {
    super.initState();
    // _focusNode = widget.focusNode ?? FocusNode();
    // _focusNode!.addListener(_onFocusChanged);
    // _isEmpty = (widget.controller?.text ?? '').isEmpty;
  }

  @override
  void dispose() {
    // _focusNode!.removeListener(_onFocusChanged);
    // if (widget.focusNode == null) {
    //   _focusNode!.dispose();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    // final prefixTextStyle = _focusNode!.hasFocus || !_isEmpty
    //     ? theme.textTheme.titleMedium
    //     : theme.inputDecorationTheme.hintStyle;

    // Widget? prefixWidget;
    // if (widget.prefixIcon != null && widget.prefixText != null) {
    //   prefixWidget = Row(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       widget.prefixIcon!,
    //       Padding(
    //         padding: const EdgeInsets.only(top: _prefixTextTopPadding),
    //         child: Text(
    //           widget.prefixText!,
    //           style: prefixTextStyle,
    //         ),
    //       ),
    //     ],
    //   );
    // } else if (widget.prefixIcon != null) {
    //   prefixWidget = widget.prefixIcon;
    // } else if (widget.prefixText != null) {
    //   prefixWidget = Padding(
    //     padding: EdgeInsets.only(
    //       left: _hPadding,
    //       top: _prefixTextTopPadding,
    //     ),
    //     child: Text(
    //       widget.prefixText!,
    //       style: prefixTextStyle,
    //     ),
    //   );
    // } else {
    //   prefixWidget = const SizedBox(width: _hPadding);
    // }

    // final errorBorder = (widget.error != null && !widget.showErrorText)
    //     ? OutlineInputBorder(
    //         borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
    //       )
    //     : null;
    final borderRadius = BorderRadius.circular(10);
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: AppColors.primaryText)),
        focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: AppColors.primaryText)),
        border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: AppColors.primaryText)),
        errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: AppColors.primaryText)),
        hintText: widget.hint,
        labelText: widget.labelText,
        errorText: widget.errorText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 10,
        ),
        suffixIcon: widget.suffixIcon,
        // contentPadding: const EdgeInsets.only(
        //   top: _prefixTextTopPadding,
        //   right: _hPadding,
        // ),
        // fillColor: (widget.error != null)
        //     ? theme.colorScheme.error.withOpacity(0.1)
        //     : AppColors.lightGrey,
        // filled: true,
        // prefixIcon: prefixWidget,
        // prefixIconConstraints: const BoxConstraints(),
        // errorText: widget.showErrorText ? widget.error : null,
        // labelText: widget.labelText,
      ),

      // controller: widget.controller,
      onChanged: widget.onChanged,
      // onSubmitted: widget.onSubmitted,
      // inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      // textCapitalization: widget.textCapitalization,
      // autocorrect: widget.autocorrect,
      // focusNode: _focusNode,
      // textAlignVertical: TextAlignVertical.top,
      // textInputAction: widget.textInputAction,
      // decoration: InputDecoration(
      //   enabledBorder: errorBorder,
      //   focusedBorder: errorBorder,
      //   hintText: widget.hint,
      //   contentPadding: const EdgeInsets.only(
      //     top: _prefixTextTopPadding,
      //     right: _hPadding,
      //   ),
      //   fillColor: (widget.error != null)
      //       ? theme.colorScheme.error.withOpacity(0.1)
      //       : AppColors.lightGrey,
      //   filled: true,
      //   prefixIcon: prefixWidget,
      //   prefixIconConstraints: const BoxConstraints(),
      //   errorText: widget.showErrorText ? widget.error : null,
      //   labelText: widget.labelText,
      // ),
    );
  }

//   void _onFocusChanged() {
//     setState(() {});
//   }

//   void _onChanged(String value) {
//     setState(() {
//       _isEmpty = value.isEmpty;
//     });
//     if (widget.onChanged != null) {
//       widget.onChanged!(value);
//     }
//   }
}
