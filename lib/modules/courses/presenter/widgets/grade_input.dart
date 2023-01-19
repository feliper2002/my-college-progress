import 'package:flutter/material.dart';

class GradeInput extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextInputType? textInputType;
  final bool? enabled;
  final String? initialValue;

  const GradeInput({
    Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.textInputType = TextInputType.number,
    this.enabled,
    this.initialValue,
  }) : super(key: key);

  @override
  State<GradeInput> createState() => _GradeInputState();
}

class _GradeInputState extends State<GradeInput> {
  bool enab = true;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            controller: widget.controller,
            maxLines: 1,
            maxLength: 4,
            enabled: enab,
            decoration: InputDecoration(
              hintText: widget.hintText,
              helperStyle: widget.hintStyle,
              labelText: widget.labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.purple[900]!),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.controller.text.isNotEmpty,
          child: IconButton(
            onPressed: () {
              setState(() {
                enab = !enab;
              });
            },
            icon: !enab
                ? (widget.initialValue!.isEmpty
                    ? const SizedBox.shrink()
                    : const Icon(Icons.edit))
                : const Icon(Icons.check),
          ),
        ),
      ],
    );
  }
}
