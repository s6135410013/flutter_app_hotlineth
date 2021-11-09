import 'package:flutter/material.dart';
import 'package:flutter_app_hotline/models/hotline_data.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilitiesETCUI extends StatefulWidget {
  // const UtilitiesETCUI({Key? key}) : super(key: key);

  @override
  _UtilitiesETCUIState createState() => _UtilitiesETCUIState();
}

class _UtilitiesETCUIState extends State<UtilitiesETCUI> {
  List<Hotlinedata> hotline_data3 = [
    Hotlinedata(
      name: "ไปรษณีย์ไทย",
      mobile: "1545",
      image: "c1.png",
    ),
    Hotlinedata(
      name: "ศูนย์รับแจ้งการเงินนอกระบบ",
      mobile: "1359",
      image: "c2.png",
    ),
    Hotlinedata(
      name: "สายด่วน บขส.",
      mobile: "1490",
      image: "c3.jpg",
    ),
    Hotlinedata(
      name: "สายด่วนประกันสังคม",
      mobile: "1506",
      image: "c4.jpg",
    ),
    Hotlinedata(
      name: "รถไฟฟ้า BTS",
      mobile: "026176000",
      image: "c5.png",
    ),
    Hotlinedata(
      name: "รถไฟฟ้าใต้ดิน MRT",
      mobile: "026245200",
      image: "c6.png",
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
                  "tel:" + hotline_data3[index].mobile,
                );
              },
              leading: Image.asset(
                "assets/images/" + hotline_data3[index].image,
                width: 100,
              ),
              title: Text(
                hotline_data3[index].name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(hotline_data3[index].mobile),
              trailing: InkWell(
                onTap: () {
                  _makePhoneCall(
                    "tel:" + hotline_data3[index].mobile,
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
          itemCount: hotline_data3.length),
    );
  }
}
