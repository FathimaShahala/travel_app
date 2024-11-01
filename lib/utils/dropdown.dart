import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
   Dropdown({
    super.key,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = 'Finland';

  var items = [
    "New Zealand", "UAE","India","USA", "Paris","Japan","Finland","Vietnam","Norway","Italy"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton(
          value: dropdownValue,
          items: items.map((String item){
            return DropdownMenuItem(
              value: item,
              child: Text(item,style: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),)
            );
          }).toList(),
          onChanged:(String? newValue){
            setState((){
              dropdownValue = newValue!;
            });
          },
        ) ,
          ]
        );
  }
}