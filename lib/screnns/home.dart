import 'package:flutter/material.dart';
import 'package:mezan/constant/responsive.dart';
import 'package:mezan/constant/shared.dart';
import 'package:mezan/custom/chat.dart';
import 'package:mezan/fixed/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List content = [
    'حساب تحويل العملات الى دولار',
    'عرض الاقساط وموعيدها',
    'تنظيم المصروفات بالنسبه لدخلك الشهرى',
    'البيانات الشخصيه'
  ];
  List photo = [
    'assets/images/dolar.png',
    'assets/images/aqsat.jpg',
    'assets/images/masrouf.png',
    'assets/images/data.jpg'
  ];
  
  

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'ميزان',
            style: TextStyle(fontFamily: 'ReemKufi', fontSize: 35),
          ),
        ),
        body: Column(children: [
          Chat(content: 'اهلا بك فى الميزان يا ${Pref.getData(key: 'name')}'),
          const SizedBox(height: 30),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                if (index == 0) {
                  Navigator.pushNamed(context, 'change');
                }
                if (index == 1) {
                  Navigator.pushNamed(context, 'premuim');
                }
                if (index == 2) {
                  Navigator.pushNamed(context, 'orgnization');
                }
                if (index == 3) {
                  Navigator.pushNamed(context, 'info');
                }
              },
              child: Container(
                width: double.infinity,
                height: ResponsiveScreen.screenHeight / 6.5,
                decoration: BoxDecoration(
                    color: kPrimaryColor3,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      content[index],
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    )),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(photo[index]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
