import 'package:backend/sinhvien.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final idControler = TextEditingController();
  final nameControler = TextEditingController();
  final gradeControler = TextEditingController();
  final desControler = TextEditingController();

  List<SinhVien> danhSachSV = [
    SinhVien(
        name: 'Tan',
        id: 1,
        grade: 10,
        depiction:
            'day la mot thu suc manh sieu nhien kinh khung khiep dam tom lom'),
    SinhVien(
        id: 2,
        name: 'the',
        grade: 8,
        depiction:
            'day la mot thu suc manh sieu nhien kinh khung khiep dam tom lom'),
    SinhVien(
        id: 3,
        name: 'thoi',
        grade: 9,
        depiction:
            'day la mot thu suc manh sieu nhien kinh khung khiep dam tom lom'),
    SinhVien(
        id: 4,
        name: 'kieu',
        grade: 11,
        depiction:
            'day la mot thu suc manh sieu nhien kinh khung khiep dam tom lom')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quan ly sinh vien'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: const [
                        Expanded(flex: 1, child: Text('ID')),
                        Expanded(flex: 1, child: Text('Name')),
                        Expanded(flex: 1, child: Text('Grade')),
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Depiction',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                        children: danhSachSV.map(
                      (sv) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 1, child: Text('${sv.id}')),
                                Expanded(flex: 1, child: Text('${sv.name}')),
                                Expanded(flex: 1, child: Text('${sv.grade}')),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      '${sv.depiction}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                      deleteElement(danhSachSV.indexOf(sv));
                                    },
                                    child: Icon(Icons.remove))
                              ],
                            )
                          ],
                        );
                      },
                    ).toList()),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'ID'),
                            controller: idControler,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Name'),
                            controller: nameControler,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Grade'),
                            controller: gradeControler,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Depiction'),
                            controller: desControler,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      addInfo(danhSachSV);
                                    });
                                  },
                                  child: Text(
                                    'Add data',
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  void deleteElement(index) {
    setState(() {
      danhSachSV.removeAt(index);
    });
  }

  void addInfo(List<SinhVien> a) {
    SinhVien sv = SinhVien(
        id: int.parse(idControler.text),
        name: nameControler.text,
        grade: double.parse(gradeControler.text),
        depiction: desControler.text);

    bool checkDk() {
      if ((int.parse(idControler.text).runtimeType == int) &&
          double.parse(gradeControler.text).runtimeType == double) {
        return true;
      } else {
        return false;
      }
    }

    bool checkID() {
      return a.any((i) => sv.id == i.id) ? true : false;
    }

    if (checkDk() == true && checkID() == false) {
      danhSachSV.add(sv);
    }
  }
}
