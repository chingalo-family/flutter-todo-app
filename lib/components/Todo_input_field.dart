import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_field.dart';

class TodoInputField extends StatelessWidget {

  TodoInputField({this.inputField, this.onInputValueChange,this.initialValue });

  final TodoField inputField;
  final String initialValue ;

  final Function  onInputValueChange;

  @override
  Widget build(BuildContext context) {

    TextEditingController textController = new TextEditingController(text: initialValue);

    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
        child: Column(
          children: <Widget>[
            TextFormField(
                onTap: ()async{
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate:  DateTime.now(),
                      lastDate: DateTime(2100));
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                    TimeOfDay.fromDateTime(DateTime.now()),
                  );
                },
                obscureText: false,
                keyboardType: TextInputType.text,
                onChanged: onInputValueChange,
                controller: textController,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: this.inputField.label,
                    errorText:null,
                ))
          ],
        ),
      ),
    );
  }
}
