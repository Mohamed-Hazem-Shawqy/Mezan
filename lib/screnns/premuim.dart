import 'package:flutter/material.dart';
import 'package:mezan/constant/responsive.dart';
import 'package:mezan/constant/sqflite.dart';
import 'package:mezan/custom/chat.dart';
import 'package:mezan/screnns/editdata.dart';
import 'package:mezan/custom/textform.dart';
import 'package:mezan/fixed/colors.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  int i = 0;
  bool selected = false;
  Sqfdb sqfdb = Sqfdb();

  List db = [];
  readData() async {
    db.clear();
    List<Map> response = await sqfdb.selectData("SELECT * FROM notes");
    db.addAll(response);
    if (db.isNotEmpty) selected = true;
    if (mounted) {
      setState(() {});
    }
  }

  Future<int> insertData() async {
    int response = await sqfdb.insertData(
        "INSERT INTO notes (money, date, content) VALUES ( '${first.text}' ,'${second.text}','${third.text}')");

    selected = true;
    print('insert data base ===========================');
    await readData();
    print('*****************************$db*********************************');

    return response;
  }

  Future<int> editData() async {
    int response =
        await sqfdb.updateData('''UPDATE notes SET money='${first.text}',
             date='${second.text}',
             content='${third.text}'
             WHERE id=${db[i]['id']}
                                              
             ''');
    await readData();
    return response;
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => SizedBox(
                    child: AlertDialog(
                      backgroundColor: kPrimaryColor2,
                      actions: [
                        TextButton(
                            onPressed: () {
                              insertData();
                              print('before====================$db');
                              Navigator.pop(context);
                              first.text = '';
                              second.text = '';
                              third.text = '';
                            },
                            child: const Text(
                              'اضافه',
                              style: TextStyle(color: kPrimaryColor5),
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('الغاء',
                              style: TextStyle(color: kPrimaryColor5)),
                        ),
                      ],
                      content: SizedBox(
                        height: ResponsiveScreen.screenHeight / 3,
                        child: Column(
                          children: [
                            const Text(
                              'اضافه قسط جديد',
                              style: TextStyle(fontSize: 20),
                            ),
                            CustomTextField(
                              obScure: false,
                              hintText: 'القسط الشهرى ',
                              controller: first,
                            ),
                            CustomTextField(
                              obScure: false,
                              hintText: 'الميعاد',
                              controller: second,
                            ),
                            CustomTextField(
                              obScure: false,
                              hintText: ' الملاحظات ',
                              controller: third,
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        backgroundColor: kPrimaryColor3,
        child: const Icon(Icons.add),
      ),
      body: selected || db.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const Chat(
                      content:
                          'فى هذه الصفحه يتم عرض او اضافه او حذف او تعديل الاقساط الملتزم بها حاليا'),
                  const SizedBox(height: 30),
                  Table(border: TableBorder.all(), children: [
                    TableRow(children: [
                      TableCell(
                          child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text(
                                'القسط الشهرى',
                                style: TextStyle(fontSize: 18),
                              ))),
                      TableCell(
                          child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text(
                                'الميعاد',
                                style: TextStyle(fontSize: 18),
                              ))),
                      TableCell(
                          child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text(
                                'الملاحظات',
                                style: TextStyle(fontSize: 18),
                              ))),
                    ]),
                  ]),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: db.length,
                      itemBuilder: (context, index) {
                        i = index;
                        return Dismissible(
                          key: Key('${db[index]['id']}'),
                          onDismissed: (direction) async {
                            await sqfdb.deletData(
                                'DELETE FROM notes WHERE id=${db[index]['id']}');
                            await db.removeAt(index);
                            setState(() {});
                            if (mounted) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('تم حذف قسط'),
                                backgroundColor: kPrimaryColor3,
                              ));
                            }

                            print(db);
                          },
                          child: Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Text(
                                          db[index]['money'],
                                          style: const TextStyle(fontSize: 18),
                                        ))),
                                TableCell(
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Text(
                                          db[index]['date'],
                                          style: const TextStyle(fontSize: 18),
                                        ))),
                                TableCell(
                                    child: Row(
                                  children: [
                                    Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Text(
                                          db[index]['content'],
                                          style: const TextStyle(fontSize: 18),
                                        )),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Kdialog(
                                              first: db[index]['money'],
                                              second: db[index]['date'],
                                              third: db[index]['content'],
                                              id: db[index]['id'],
                                            );
                                          },
                                        ).then((_) {
                                          setState(() {
                                            readData();
                                          });
                                        });
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                  ],
                                )),
                              ]),
                            ],
                          ),
                        );
                      })
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Chat(
                          content:
                              'فى هذه الصفحه يتم عرض او اضافه او حذف او تعديل الاقساط الملتزم بها حاليا'),
                      const SizedBox(height: 30),
                      const Text(
                        'ليس لديك اى قسط بعد',
                        style: TextStyle(
                            color: kPrimaryColor3,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('assets/images/no quest.gif')),
                    ]),
              ),
            ),
    );
  }
}
