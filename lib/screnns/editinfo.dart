import 'package:flutter/material.dart';
import 'package:mezan/constant/responsive.dart';
import 'package:mezan/constant/shared.dart';
import 'package:mezan/custom/textform.dart';
import 'package:mezan/fixed/colors.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({super.key});

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  TextEditingController name1 =
      TextEditingController(text: Pref.getData(key: 'name'));
  TextEditingController email1 =
      TextEditingController(text: Pref.getData(key: 'email'));
  TextEditingController money1 =
      TextEditingController(text: Pref.getData(key: 'money'));
  TextEditingController bank1 =
      TextEditingController(text: Pref.getData(key: 'bank'));
  GlobalKey<FormState> name = GlobalKey();
  GlobalKey<FormState> email = GlobalKey();
  GlobalKey<FormState> money = GlobalKey();
  GlobalKey<FormState> bank = GlobalKey();
  String? selectedValue;
  bool isSelected = false;
  bool isSelected1 = false;
  RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: kPrimaryColor,
        content: SizedBox(
          height: ResponsiveScreen.screenHeight / 1.5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('تعديل البيانات الشخصيه'),
                Form(
                  key: name,
                  child: CustomTextField(
                    controller: name1,
                    obScure: false,
                    labelText: 'الاسم بالكامل',
                  ),
                ),
                Form(
                  key: email,
                  child: CustomTextField(
                    controller: email1,
                    obScure: false,
                    labelText: ' البريد الالكترونى',
                    validator: (val) {
                      if (!regExp.hasMatch(val!)) {
                        return 'هذا الايميل غير صالح';
                      }
                      return null;
                    },
                  ),
                ),
                Form(
                  key: money,
                  child: CustomTextField(
                    controller: money1,
                    keypord: TextInputType.number,
                    obScure: isSelected,
                    labelText: ' الدخل الشهرى',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        icon: isSelected
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                ),
                Form(
                  key: bank,
                  child: CustomTextField(
                    controller: bank1,
                    obScure: isSelected1,
                    keypord: TextInputType.number,
                    labelText: ' الرصيد فى البنك',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSelected1 = !isSelected1;
                          });
                        },
                        icon: isSelected1
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('اختر دولتك'),
                      Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                            dropdownColor: kPrimaryColor3,
                            borderRadius: BorderRadius.circular(10),
                            value: selectedValue,
                            items: items1.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? name) {
                              setState(() {
                                selectedValue = name;
                              });
                            }),
                      )
                    ]),
                const SizedBox(height: 60),
                MaterialButton(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: kPrimaryColor3,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    if (email.currentState!.validate()) {
                      Pref.setData(key: 'name', value: name1.text);
                      Pref.setData(key: 'email', value: email1.text);
                      Pref.setData(key: 'money', value: money1.text);
                      Pref.setData(key: 'bank', value: bank1.text);
                      Pref.setData(key: 'country', value: selectedValue);

                      Navigator.pop(context);
                    }
                  },
                  child: const Text(' تعديل'),
                )
              ],
            ),
          ),
        ));
  }
}
