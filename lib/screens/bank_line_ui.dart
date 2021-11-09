import 'package:flutter/material.dart';
import 'package:flutter_app_hotline/models/hotline_data.dart';
import 'package:url_launcher/url_launcher.dart';

class BankLineUI extends StatefulWidget {
  // const BankLineUI({Key? key}) : super(key: key);

  @override
  _BankLineUIState createState() => _BankLineUIState();
}

class _BankLineUIState extends State<BankLineUI> {
  List<Hotlinedata> hotline_data4 = [
    Hotlinedata(
      name: "ธนาคารออมสิน",
      mobile: "1115",
      image: "d1.png",
    ),
    Hotlinedata(
      name: "ธนาคารกรุงเทพ",
      mobile: "1333",
      image: "d2.png",
    ),
    Hotlinedata(
      name: "ธนาคารกรุงไทย",
      mobile: "1551",
      image: "d3.png",
    ),
    Hotlinedata(
      name: "ธนาคารกรุงศรีอยุธยา",
      mobile: "1572",
      image: "d4.png",
    ),
    Hotlinedata(
      name: "ธนาคารทหารไทย",
      mobile: "1558",
      image: "d5.png",
    ),
    Hotlinedata(
      name: "ธนาคารซิตี้แบงก์",
      mobile: "1588",
      image: "d6.png",
    ),
    Hotlinedata(
      name: "ธนาคารสแตนดาร์ด ชาร์เตอร์ด",
      mobile: "1595",
      image: "d7.png",
    ),
    Hotlinedata(
      name: "ธนาคารธนชาต",
      mobile: "1770",
      image: "d8.png",
    ),
    Hotlinedata(
      name: "ธนาคารกสิกร",
      mobile: "028888888",
      image: "d9.png",
    ),
    Hotlinedata(
      name: "ธนาคารไอเอ็มบี",
      mobile: "026267777",
      image: "d10.png",
    ),
    Hotlinedata(
      name: "ธนาคารไทยพาณิชย์",
      mobile: "027777777",
      image: "d11.png",
    ),
    Hotlinedata(
      name: "ธนาคารอาคารสงเคราะห์",
      mobile: "026459000",
      image: "d12.png",
    ),
    Hotlinedata(
      name: "ธนาคารยูโอบี จำกัด(มหาชน)",
      mobile: "022851555",
      image: "d13.png",
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
                  "tel:" + hotline_data4[index].mobile,
                );
              },
              leading: Image.asset(
                "assets/images/" + hotline_data4[index].image,
                width: 100,
              ),
              title: Text(
                hotline_data4[index].name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(hotline_data4[index].mobile),
              trailing: InkWell(
                onTap: () {
                  _makePhoneCall(
                    "tel:" + hotline_data4[index].mobile,
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
          itemCount: hotline_data4.length),
    );
  }
}
