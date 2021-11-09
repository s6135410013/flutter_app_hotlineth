import 'package:flutter/material.dart';
import 'package:flutter_app_hotline/models/hotline_data.dart';

import 'package:url_launcher/url_launcher.dart';

class EmergencyUI extends StatefulWidget {
  // const EmergencyUI({Key? key}) : super(key: key);

  @override
  _EmergencyUIState createState() => _EmergencyUIState();
}

class _EmergencyUIState extends State<EmergencyUI> {
  List<Hotlinedata> hotline_data = [
    Hotlinedata(
      name: "เหตุด่วน เหตุร้าย",
      mobile: "191",
      image: "a1.jpg",
    ),
    Hotlinedata(
      name: "ดับเพลิง สัตว์ร้ายเข้าบ้าน",
      mobile: "199",
      image: "a2.jpg",
    ),
    Hotlinedata(
      name: "กู้ชีพ วชิรพยาบาล",
      mobile: "1154",
      image: "a3.jpg",
    ),
    Hotlinedata(
      name: "จส.100",
      mobile: "1137",
      image: "a4.png",
    ),
    Hotlinedata(
      name: "ตำรวจท่องเที่ยว",
      mobile: "1155",
      image: "a5.png",
    ),
    Hotlinedata(
      name: "กรมทางหลวง",
      mobile: "1586",
      image: "a6.png",
    ),
    Hotlinedata(
      name: "กองปราบปราม",
      mobile: "1195",
      image: "a7.jpg",
    ),
    Hotlinedata(
      name: "แจ้งรถหาย",
      mobile: "1192",
      image: "a8.jpg",
    ),
    Hotlinedata(
      name: "ตำรวจทางหลวง",
      mobile: "1193",
      image: "a9.jpg",
    ),
    Hotlinedata(
      name: "กรมควบคุมมลพิษ",
      mobile: "1650",
      image: "a10.png",
    ),
    Hotlinedata(
      name: "หน่วยแพทย์ฉุกเฉินทั่วประเทศ",
      mobile: "1669",
      image: "a11.png",
    ),
    Hotlinedata(
      name: "หน่วยแพทย์ฉุกเฉินทั่วกทม.",
      mobile: "1646",
      image: "a12.jpg",
    ),
    Hotlinedata(
      name: "กรมป้องกันและบรรเทาสาธารณภัย",
      mobile: "1784",
      image: "a13.jpg",
    ),
    Hotlinedata(
      name: "เหตุทางน้ำ กรมเจ้าท่า",
      mobile: "1784",
      image: "a14.png",
    ),
    Hotlinedata(
      name: "ศูนย์เตือนภัยพิบัติแห่งชาติ",
      mobile: "191",
      image: "a15.png",
    ),
    Hotlinedata(
      name: "การทางพิเศษแห่งประเทศไทย",
      mobile: "1543",
      image: "a16.png",
    ),
    Hotlinedata(
      name: "โรงพยาบตำรวจ",
      mobile: "1691",
      image: "a17.jpg",
    ),
  ];
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "เบอร์โทร",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                _makePhoneCall(
                  "tel:" + hotline_data[index].mobile,
                );
              },
              leading: Image.asset(
                "assets/images/" + hotline_data[index].image,
                width: 100,
              ),
              title: Text(
                hotline_data[index].name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(hotline_data[index].mobile),
              trailing: InkWell(
                onTap: () {
                  _makePhoneCall(
                    "tel:" + hotline_data[index].mobile,
                  );
                },
                child: Icon(
                  Icons.phone,
                  size: 40,
                  color: Colors.tealAccent[700],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 10,
              color: Colors.black,
            );
          },
          itemCount: hotline_data.length),
    );
  }
}
