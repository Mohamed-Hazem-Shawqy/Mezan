import 'package:flutter/material.dart';
import 'package:mezan/constant/responsive.dart';
import 'package:mezan/constant/shared.dart';
import 'package:mezan/custom/indecator.dart';
import 'package:mezan/fixed/colors.dart';
import 'package:mezan/screnns/editinfo.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  num currentValue1 = num.parse(Pref.getData(key: 'money'));
  num currentValue2 = num.parse(Pref.getData(key: 'bank'));
  num maxValue = 500000;
  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text(
          'ميزان',
          style: TextStyle(fontFamily: 'ReemKufi', fontSize: 30),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Stack(clipBehavior: Clip.none, children: [
            Container(
              alignment: Alignment.center,
              height: ResponsiveScreen.screenHeight / 1.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: ResponsiveScreen.screenHeight / 10),
                  Text(Pref.getData(key: 'name')),
                  const SizedBox(height: 5),
                  Text(Pref.getData(key: 'email')),
                  Container(
                    width: ResponsiveScreen.screenWidth / 3,
                    height: ResponsiveScreen.screenHeight / 14,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: kPrimaryColor3,
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(Pref.getData(key: 'country')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Indecator(
                            backgroundColor: const Color(0xFFFEF3E2),
                            progressColor: Colors.grey[400],
                            center: Text(Pref.getData(key: 'money')),
                            percent: currentValue1 / maxValue,
                          ),
                          const Text('الراتب الشهرى ')
                        ],
                      ),
                      Column(
                        children: [
                          Indecator(
                            percent: currentValue2 / maxValue,
                            backgroundColor: const Color(0xFFFEF3E2),
                            progressColor: Colors.grey[400],
                            center: Text(Pref.getData(key: 'bank')),
                          ),
                          const Text('الحساب البنكى'),
                        ],
                      )
                    ],
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xFFFEF3E2),
                        ),
                      ),
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (context) => const EditInfo()).then((_) {
                          setState(() {});
                        });
                      },
                      child: const Text(
                        'تعديل',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ))
                ],
              ),
            ),
            Positioned(
                left: ResponsiveScreen.screenWidth / 3,
                bottom: ResponsiveScreen.screenHeight / 1.7,
                child: const CircleAvatar(
                  radius: 70,
                  backgroundColor: Color(0xFFBEC6A0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/slogan.gif'),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
