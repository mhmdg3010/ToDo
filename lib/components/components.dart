
import 'package:flutter/material.dart';

Widget defaultButton({
   double width =double.infinity ,
   Color backGr = Colors.blue,
   required Function() function,
   required String text,
})=> Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: backGr,

  ),
  width: width,
  child: MaterialButton(
    onPressed: function,
    child: Text(text.toUpperCase(),
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),),
  ),
);



Widget defaultTextForm ({
  required TextEditingController controller,
  void Function(String)? onSubmit,
  required TextInputType type,
  required String label,
  required Widget preIcon,
  required String hintText,
  required String? Function(String?) validator,
  required String? Function(String?) onChange,

}) => TextFormField(
  onChanged: onChange,
  validator: validator,
  controller: controller,

  onFieldSubmitted: onSubmit,
  keyboardType: type,
  decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      prefixIcon: preIcon,
));

Widget defaultTextFormFaild({
  required TextEditingController controller,
  void Function(String)? onChanged,
  bool obscureText = false,
  void Function(String)? onFieldSubmitted,
  required TextInputType type,
  void Function()? onTap,
  required String? Function(String?)? validator,
  required String label,
  required Widget? prefixIcon,
  Widget? suffixIcon,
  bool isClickable = true,
}) {
  return TextFormField(
    enabled: isClickable,
    controller: controller,
    keyboardType: type,
    onChanged: onChanged,
    obscureText: obscureText,
    onFieldSubmitted: onFieldSubmitted,
    onTap: onTap,
    validator: validator,
    decoration: InputDecoration(
      label: Text(label),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(),
      ),
    ),
  );
}


Widget buildTaskItem (Map model) =>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40,
        child: Text(
          '${model ['time']}',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${model['title']}',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('${model['date']}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),


        ],
      ),
    ],
  ),
);