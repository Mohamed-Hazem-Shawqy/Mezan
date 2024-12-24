import 'package:flutter/material.dart';
import 'package:mezan/constant/responsive.dart';
import 'package:mezan/constant/sqflite.dart';
import 'package:mezan/fixed/colors.dart';
import 'package:mezan/custom/textform.dart';

class Kdialog extends StatefulWidget {
  final dynamic id;
  final dynamic first;
  final dynamic second;
  final dynamic third;
  // final Future<dynamic> read;
  const Kdialog({
    super.key,
    this.id,
    this.first,
    this.second,
    this.third,
  });

  @override
  State<Kdialog> createState() => _KdialogState();
}

class _KdialogState extends State<Kdialog> {
  Sqfdb sqfdb = Sqfdb();
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();

  Future<int> editData() async {
    int response =
        await sqfdb.updateData('''UPDATE notes SET money='${first.text}',
             date='${second.text}',
             content='${third.text}'
             WHERE id=${widget.id}
                                              
             ''');
    // await widget.read;
    // print(widget.read);

    return response;
  }

  @override
  void initState() {
    first.text = widget.first;
    second.text = widget.second;
    third.text = widget.third;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPrimaryColor2,
      actions: [
        TextButton(
            onPressed: () async {
              await editData();

              if (mounted) {
                Navigator.pop(context);
              }

              first.text = '';
              second.text = '';
              third.text = '';
            },
            child: const Text(
              'تعديل',
              style: TextStyle(color: kPrimaryColor5),
            )),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('الغاء', style: TextStyle(color: kPrimaryColor5)),
        ),
      ],
      content: SizedBox(
        height: ResponsiveScreen.screenHeight / 3,
        child: Column(
          children: [
            const Text(
              'تعديل قسط ',
              style: TextStyle(fontSize: 20),
            ),
            CustomTextField(
              obScure: false,
              hintText: 'القسط الشهرى ',
              controller: first,
              labelText: first.text,
            ),
            CustomTextField(
              obScure: false,
              hintText: 'الميعاد',
              controller: second,
              labelText: second.text,
            ),
            CustomTextField(
              obScure: false,
              hintText: ' الملاحظات ',
              controller: third,
              labelText: third.text,
            )
          ],
        ),
      ),
    );
  }
}
