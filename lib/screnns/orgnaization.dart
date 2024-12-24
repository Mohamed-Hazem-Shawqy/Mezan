import 'package:flutter/material.dart';
import 'package:mezan/constant/responsive.dart';
import 'package:mezan/constant/shared.dart';
import 'package:mezan/custom/chat.dart';
import 'package:mezan/custom/indecator.dart';
import 'package:mezan/fixed/colors.dart';

class Orgnaization extends StatefulWidget {
  const Orgnaization({super.key});

  @override
  State<Orgnaization> createState() => _OrgnaizationState();
}

class _OrgnaizationState extends State<Orgnaization> {
  int money = int.parse(Pref.getData(key: 'money'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text(
          'ميزان',
          style: TextStyle(fontFamily: 'ReemKufi', fontSize: 30),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Chat(
                  content:
                      'فى هذه الصفحه يتم عرض افضل نسبه لتنظيم مصروفاتك من خلال مرتبك'),
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                width: ResponsiveScreen.screenWidth / 2.5,
                height: ResponsiveScreen.screenWidth / 6,
                decoration: BoxDecoration(
                  color: kPrimaryColor4,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  Pref.getData(key: 'money'),
                  style: const TextStyle(
                      color: Colors.white, fontSize: 30, fontFamily: 'Handjet'),
                ),
              ),
              SizedBox(height: ResponsiveScreen.screenHeight / 20),
              SizedBox(
                height: ResponsiveScreen.screenHeight / 2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: ResponsiveScreen.screenHeight / 2,
                      width: ResponsiveScreen.screenWidth / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kPrimaryColor3)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Expanded(
                                child: Text(
                              'مصروفاتك الاساسيه الثابته',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Indecator(
                              backgroundColor: kPrimaryColor2,
                              percent: money * .5 / money,
                              progressColor: kPrimaryColor3,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '50%',
                                    style: TextStyle(
                                        fontFamily: 'Handjet', fontSize: 20),
                                  ),
                                  Text((money * .5).toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Handjet', fontSize: 20)),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: ResponsiveScreen.screenHeight / 10),
                            const Text(
                              'فواتير الكهرباء والمياه',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'مصاريف التعليم',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'الرعايه الصحيه',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'النقل',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'الاتصالات',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: ResponsiveScreen.screenHeight / 2,
                      width: ResponsiveScreen.screenWidth / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kPrimaryColor3)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Expanded(
                                child: Text(
                              'مصروفاتك الشخصيه المتغيره',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Indecator(
                              backgroundColor: kPrimaryColor2,
                              percent: money * .3 / money,
                              progressColor: kPrimaryColor3,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('30%',
                                      style: TextStyle(
                                          fontFamily: 'Handjet', fontSize: 20)),
                                  Text((money * .3).toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Handjet', fontSize: 20)),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: ResponsiveScreen.screenHeight / 7.4),
                            const Text(
                              '  التسوق',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              ' الانشطه الترفيهيه',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              ' الرحالات',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'الهدايا',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: ResponsiveScreen.screenHeight / 2,
                      width: ResponsiveScreen.screenWidth / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kPrimaryColor3)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            const Expanded(
                                child: Text(
                              'الاستثمارات و الادخارات',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Indecator(
                              backgroundColor: kPrimaryColor2,
                              percent: money * .2 / money,
                              progressColor: kPrimaryColor3,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('20%',
                                      style: TextStyle(
                                          fontFamily: 'Handjet', fontSize: 20)),
                                  Text((money * .2).toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Handjet', fontSize: 20)),
                                ],
                              ),
                            ),
                            SizedBox(height: ResponsiveScreen.screenHeight / 6),
                            const Text(
                              ' زياده المدخرات',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'تعجيل سداد الديون',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'حالات الطوارئ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
