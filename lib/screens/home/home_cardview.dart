import 'package:connectcard/models/Cards.dart';
import 'package:connectcard/models/TheUser.dart';
import 'package:connectcard/screens/home/qrcode_scanner.dart';
import 'package:connectcard/shared/carouselsliderwidget.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

// This class is used to display the cards on the home page in cardview
class HomeCardView extends StatelessWidget {
  final UserData userData;
  final List<Cards> cards;

  HomeCardView({required this.userData, required this.cards});

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Share via')),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: () async {
                              // Add logic for WhatsApp sharing
                            },
                            icon: Image.asset('assets/logo/whatsapp.png'),
                          ),
                        ),
                        Text('WhatsApp'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: () async {
                              // Add logic for Telegram sharing
                            },
                            icon: Image.asset('assets/logo/telegram.png'),
                          ),
                        ),
                        Text('Telegram'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showConnectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(userData.profilePic),
                  backgroundColor: Colors.grey,
                  child: userData.profilePic.isNotEmpty
                      ? null
                      : Icon(
                          Icons.person,
                          size: 40.0,
                          color: Colors.white,
                        ),
                ),
                SizedBox(height: 16.0),
                Text(
                  userData.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: QrImageView(
                    data: userData.uid, // Provide the data here
                    version: QrVersions.auto,
                    size: 150.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QRScanScreen(myData: userData),
                          ),
                        );
                      },
                      child: Text('Scan'),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _showShareDialog(context);
                      },
                      child: Text('Share'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CarouselSliderWidget(
          userData: userData,
          cards: cards,
        ),
        SizedBox(height: 10.0),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: () {
                  _showConnectDialog(context);
                },
                child: Text('Connect'),
              ),
              IconButton(
                onPressed: () {
                  _showShareDialog(context); // Un-commented the method call
                },
                icon: Icon(Icons.share),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
