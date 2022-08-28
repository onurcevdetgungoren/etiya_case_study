import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final void Function(dynamic s) pressed;
  final List<dynamic> itemList;
  final String hintText;
  final dynamic value;
  final bool isSorting;
  const CustomDropDown(
      {Key? key,
      required this.pressed,
      required this.itemList,
      required this.hintText,
      required this.value,
      required this.isSorting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(70, 63, 113, 1),
          borderRadius: BorderRadius.circular(90.0),
        ),
        child: DropdownButtonHideUnderline(
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color.fromRGBO(70, 63, 113, 1),
            ),
            child: DropdownButton(
                value: value == 0 ? null : value,
                style: TextStyle(color: Colors.grey.shade300),
                hint: Text(
                  hintText,
                  style: const TextStyle(color: Colors.white),
                ),
                items: isSorting != true
                    ? (itemList.isNotEmpty
                        ? itemList.map((e) {
                            return DropdownMenuItem(
                              value: e.id,
                              child: Text(e.name.toString()),
                            );
                          }).toList()
                        : [
                            const DropdownMenuItem(
                              value: 0,
                              child: Text(""),
                            )
                          ])
                    : (itemList.isNotEmpty
                        ? itemList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList()
                        : [
                            const DropdownMenuItem(
                              value: 0,
                              child: Text(""),
                            )
                          ]),
                onChanged: pressed),
          ),
        ),
      ),
    );
  }
}
