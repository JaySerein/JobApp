import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';

class MultiSelect extends StatefulWidget {
  final List<String> options;
  final List<String> selectedItems;
  const MultiSelect(
      {super.key, required this.options, required this.selectedItems});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> selectedItems = [];
  void additem() {
    for (var item in widget.selectedItems) {
      selectedItems.add(item);
    }
    widget.selectedItems.clear();
  }

  void itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedItems.add(itemValue);
      } else {
        selectedItems.remove(itemValue);
      }
    });
  }

  void cancel() {
    Get.back();
  }

  void submit() {
    Get.back(result: selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    additem();
    return AlertDialog(
      surfaceTintColor: JColors.white,
      title: const Text('Chọn kĩ năng'),
      content: SingleChildScrollView(
        child: ListBody(
            children: widget.options
                .map((item) => CheckboxListTile(
                      value: selectedItems.contains(item),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(item),
                      onChanged: (isChecked) => itemChange(item, isChecked!),
                    ))
                .toList()),
      ),
      actions: [
        SizedBox(
            width: 120,
            child:
                OutlinedButton(onPressed: cancel, child: const Text('Huỷ bỏ'))),
        SizedBox(
            width: 120,
            child: ElevatedButton(
                onPressed: submit, child: const Text('Xác nhận')))
      ],
    );
  }
}
