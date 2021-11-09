import 'package:flutter/material.dart';
import 'package:flutter_app_hotline/models/hotline_data.dart';
import 'package:url_launcher/url_launcher.dart';

class InternetProviderUI extends StatefulWidget {
  // const InternetProviderUI({Key? key}) : super(key: key);

  @override
  _InternetProviderUIState createState() => _InternetProviderUIState();
}

class _InternetProviderUIState extends State<InternetProviderUI> {
  List<Hotlinedata> hotline_data5 = [
    Hotlinedata(
      name: "DTAC",
      mobile: "1678",
      image: "e1.png",
    ),
    Hotlinedata(
      name: "AIS",
      mobile: "1175",
      image: "e2.png",
    ),
    Hotlinedata(
      name: "TRUE",
      mobile: "1331",
      image: "e3.png",
    ),
    Hotlinedata(
      name: "TOT",
      mobile: "1100",
      image: "e4.png",
    ),
    Hotlinedata(
      name: "3BB",
      mobile: "1530",
      image: "e5.png",
    ),
    Hotlinedata(
      name: "CAT",
      mobile: "1322",
      image: "e6.png",
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
                  "tel:" + hotline_data5[index].mobile,
                );
              },
              leading: Image.asset(
                "assets/images/" + hotline_data5[index].image,
                width: 100,
              ),
              title: Text(
                hotline_data5[index].name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(hotline_data5[index].mobile),
              trailing: InkWell(
                onTap: () {
                  _makePhoneCall(
                    "tel:" + hotline_data5[index].mobile,
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
          itemCount: hotline_data5.length),
    );
  }
}
