import 'package:flutter/material.dart';
import 'package:mezan/constant/shared.dart';
import 'package:mezan/custom/textform.dart';
import 'package:mezan/fixed/colors.dart';
import 'package:mezan/screnns/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController money1 = TextEditingController();
  TextEditingController bank1 = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ميزان'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                fit: BoxFit.fill,
                'assets/images/login.gif',
                height: 200,
              ),
            ),
            Form(
              key: name,
              child: CustomTextField(
                controller: name1,
                obScure: false,
                labelText: 'الاسم بالكامل',
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
            ),
            Form(
              key: email,
              child: CustomTextField(
                controller: email1,
                obScure: false,
                labelText: ' البريد الالكترونى',
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  if (!regExp.hasMatch(val)) {
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
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
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
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                if (name.currentState!.validate() &&
                    email.currentState!.validate() &&
                    money.currentState!.validate() &&
                    bank.currentState!.validate() &&
                    selectedValue != null) {
                  Pref.setData(key: 'name', value: name1.text);
                  Pref.setData(key: 'email', value: email1.text);
                  Pref.setData(key: 'money', value: money1.text);
                  Pref.setData(key: 'bank', value: bank1.text);
                  Pref.setData(key: 'country', value: selectedValue);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }
              },
              child: const Text('تسجيل الدخول'),
            )
          ],
        ),
      ),
    );
  }
}
