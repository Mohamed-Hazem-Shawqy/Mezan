import 'package:flutter/material.dart';
import 'package:mezan/constant/responsive.dart';
import 'package:mezan/custom/chat.dart';
import 'package:mezan/fixed/colors.dart';

class Change extends StatefulWidget {
  const Change({super.key});

  @override
  State<Change> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  String selectedValue = 'Egypt (EGP)';
  TextEditingController control = TextEditingController();
  double? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'ميزان',
          style: TextStyle(fontFamily: 'ReemKufi', fontSize: 35),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Chat(
                  content:
                      'فى هذه الغرفه يمكنك تحويل العملات الى قيمتها الدولاريه'),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const Text(
                  'اختر العمله المراد تحويلها',
                  style: TextStyle(fontSize: 17),
                ),
                DropdownButton(
                    dropdownColor: kPrimaryColor3,
                    value: selectedValue,
                    items: items.map((item) {
                      return DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontFamily: 'Handjet', fontSize: 20),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedValue = val;
                      });
                    })
              ]),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: control,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'ادخل المبلغ'),
                  )),
              const SizedBox(height: 20),
              MaterialButton(
                height: 60,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: kPrimaryColor3,
                onPressed: () {
                  setState(() {
                    value =
                        double.parse(control.text) / moneyFelow[selectedValue]!;
                  });
                },
                child: const Text(
                  'تحويل',
                  style: TextStyle(fontSize: 18, fontFamily: 'Lemoada'),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(40),
                height: ResponsiveScreen.screenHeight / 6,
                width: ResponsiveScreen.screenHeight / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kPrimaryColor3)),
                child: value != null
                    ? Text(
                        ''' = (${control.text}) $selectedValue  
            ${value!.toStringAsFixed(3)}USD
                      ''',
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ReadexPro'),
                      )
                    : const Text(
                        'الرجاء ادخال المبلغ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ReadexPro'),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
