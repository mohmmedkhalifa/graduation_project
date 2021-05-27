import 'package:flutter/material.dart';

class DropMenu extends StatefulWidget {
  String dropValue;
  List<String> myMenu;
  Function onChanged;
  String title;

  DropMenu({this.dropValue, this.myMenu, this.onChanged, this.title});

  @override
  _DropMenuState createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: InputDecorator(
                decoration: InputDecoration(
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  labelText: widget.title,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                isEmpty: widget.dropValue == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: widget.dropValue,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        widget.dropValue = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: widget.myMenu.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
