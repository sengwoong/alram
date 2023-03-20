import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyInfo(),
    );
  }
}

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  // 바텀 네비의 상태를 관리할 변수
  int bottomNavIndex = 0;
  bool Switchvalue = false;

  @override
  Widget build(BuildContext context) {
    // 화면의 기반(Scaffold)
    return Scaffold(
      appBar: _buildCustomAppBar(),
      // 폰의 노치나 노티바 등을 제외한 화면 영역(SafeArea)
      body: SafeArea(
        // 컨텐츠가 화면보다 클 경우를 가정(ListView)
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // 리스트뷰는 자식이 여러개 들어갈 수 있다.
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30), // 위쪽 여백
              // 아이콘과 텍스트가 가로로 나열되어야 하므로 Row

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 기본 프로필 아이콘

                  // 아이콘과 텍스트 사이 여백
                  const SizedBox(
                    width: 5,
                  ),
                  // 텍스트가 세로로 나열되어야 하므로 Column
                  Column(
                    // 텍스트를 왼쪽 정렬 (Column 방향의 cross는 가로)
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      // 이름

                      Text("16시간 37분후 알람이 울립니다.",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,

                          )),
                      // 카드
                      Text(
                        "3월 14일 화요일",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),

                      ),
                      // 텍스트들을 약간 위쪽으로 올리기 위한 SizedBox
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 프로필과 정보 사이 여백
            const SizedBox(
              height: 30,
            ),
            // 정보 테두리를 디자인 하기 위한 컨테이너
            Container(

              // 컨테이너의 너비는 전체 화면
              width: double.infinity,
              // 테두리를 디자인하기 위한 BoxDecoration
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                color: const Color.fromRGBO(178, 204, 255, 0.7),
                width: 3,
              )),
              // 테두리 안쪽에 여백을 주기 위한 Padding
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                // 정보를 세로로 나열해야 하므로 Column
                child: Column(
                  children: [
                    // 정보 모양이 비슷하므로 메소드로 분리 (_buildInfoItem)
                    _buildInfoItem(
                      memo: "강의",
                      isAfternoon: "오전",
                      Time: '3:40',
                      dayoftheWeek: "월화수목금토일",
                      Switchvalue: Switchvalue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // 바텀 네비





      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '알람',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '시계',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '스톱워치',
          ),
          BottomNavigationBarItem(
            icon:SizedBox.shrink(),
            label: '타이머',
          ),
        ],
      ),



    );
  }

  Padding _buildDiv() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Divider(),
    );
  }

  PreferredSizeWidget _buildCustomAppBar() {
    // 커스텀 앱바
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      leading: const Padding(
        padding: EdgeInsets.only(left: 30.0),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
          size: 35.0,
        ),
      ),
      title: const Center(
        child: Text(
          "나의정보",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 25.0,
          ),
        ),
      ),
      actions: [
        const Icon(
          Icons.search,
          color: Colors.black87,
          size: 35.0,
        ),
        const SizedBox(
          width: 5,
        ),
        Row(
          children: const [
            Icon(
              Icons.menu,
              color: Colors.black87,
              size: 40.0,
            ),
            Text(
              "메뉴",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            )
          ],
        )
      ],
      // 앱바 아래 빈 공간
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 20.0),
        child: Container(),
      ),
    );
  }






  Widget _buildInfoItem({
    required String memo,
    required String isAfternoon,
    required String dayoftheWeek,
    required String Time,
    required bool Switchvalue,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                memo,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Text(
                    // 내용이 없으면 빈값 주입
                    isAfternoon ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 50, 50, 0.6),
                    ),
                  ),
                  Text(
                    Time,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(0, 130, 153, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  dayoftheWeek,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 130, 153, 1),
                  ),
                ),
                Switch(
                  value: Switchvalue,
                  onChanged: (bool newValue) {
                    setState(() {
                      Switchvalue = newValue;
                    });
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
