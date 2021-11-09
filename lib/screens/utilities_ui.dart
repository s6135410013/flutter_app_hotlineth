import 'package:flutter/material.dart';
import 'package:flutter_app_hotline/models/hotline_data.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilitiesUI extends StatefulWidget {
  // const UtilitiesUI({Key? key}) : super(key: key);

  @override
  _UtilitiesUIState createState() => _UtilitiesUIState();
}

class _UtilitiesUIState extends State<UtilitiesUI> {
  List<Hotlinedata> hotline_data2 = [
    Hotlinedata(
      name: "การไฟฟ้านครหลวง",
      mobile: "1330",
      image: "b1.png",
    ),
    Hotlinedata(
      name: "การไฟฟ้าส่วนภูมิภาค",
      mobile: "1329",
      image: "b2.jpg",
    ),
    Hotlinedata(
      name: "การประปานครหลวง",
      mobile: "1125",
      image: "b3.jpg",
    ),
    Hotlinedata(
      name: "การประปาส่วนภูมิภาค",
      mobile: "1662",
      image: "b4.jpg",
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
                  "tel:" + hotline_data2[index].mobile,
                );
              },
              leading: Image.asset(
                "assets/images/" + hotline_data2[index].image,
                width: 100,
              ),
              title: Text(
                hotline_data2[index].name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(hotline_data2[index].mobile),
              trailing: InkWell(
                onTap: () {
                  _makePhoneCall(
                    "tel:" + hotline_data2[index].mobile,
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
          itemCount: hotline_data2.length),
    );
  }
}
