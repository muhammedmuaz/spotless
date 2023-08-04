/// This [DatePickerInput] class is used to pick date using [showDatePicker] fun

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'input_field.dart';

class DatePickerInput extends StatefulWidget {
  DatePickerInput(
      {Key? key,
      this.controller,
      this.hintText,
      this.validators,
      this.onSelect,
      this.lastDate})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? validators;
  final DateTime? lastDate;
  final Function(DateTime)? onSelect;

  @override
  _DatePickerInputState createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  DateTime? selectedDate;
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(alignment: Alignment.topRight, children: [
        InputField(
          onTap: showCalendarPicker,
          validators: widget.validators,
          controller: _controller,
          readOnly: true,
          hintText: widget.hintText,
          padding: EdgeInsets.zero,
        ),
        Positioned(
            child: ClipRRect(
                child: Container(
          decoration: BoxDecoration(color: MainTheme.redTypeColor),
          child: IconButton(
              color: MainTheme.redTypeColor,
              onPressed: showCalendarPicker,
              icon: Icon(Icons.calendar_month, color: Colors.white)),
        )))
      ]),
    );
  }

  Future<void> showCalendarPicker() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: widget.lastDate ?? DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    _controller!.value =
        TextEditingValue(text: DateFormat.yMMMd().format(selectedDate!));
    widget.onSelect!(selectedDate!);
  }
}
