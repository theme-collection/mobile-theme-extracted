import 'package:chatapp_flutter/model/CGChatModel.dart';
import 'package:chatapp_flutter/screens/CGPayment/CGPaymentBankDetails.dart';
import 'package:chatapp_flutter/screens/CGPayment/CGPaymentHelpScreen.dart';
import 'package:chatapp_flutter/screens/CGPayment/CGPaymentListBankScreen.dart';
import 'package:chatapp_flutter/screens/CGqrScanScreen.dart';
import 'package:chatapp_flutter/utils/CGColors.dart';
import 'package:chatapp_flutter/utils/CGDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGPaymentScreen extends StatefulWidget {
  @override
  _CGPaymentScreenState createState() => _CGPaymentScreenState();
}

class _CGPaymentScreenState extends State<CGPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              finish(context);
            },
          ),
          backgroundColor: secondaryColor,
          title: Text("Payment", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Column(children: [_buildHoldernamepart(), _buildPaymentHistory(), _buildpaymentMethod(), _buildHelp()]),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              PaymentBank? result = await CGPaymentListBankScreen().launch(context);
              if (result != null) {
                payBankData.add(result);
              }
              setState(() {});
            },
            label: Text("NEW PAYMENT", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green),
      ),
    );
  }

  Widget _buildHoldernamepart() {
    return Container(
        padding: EdgeInsets.only(top: 22, bottom: 22, left: 14, right: 14),
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/86.jpg"), radius: 24),
            12.width,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "John Smith",
                style: boldTextStyle(size: 18),
              ),
              Text("123456789.wa.548@sbi")
            ])
          ]),
          IconButton(
            icon: Icon(Icons.qr_code, color: secondaryColor),
            onPressed: () {
              CGqrScanScreen().launch(context);
            },
          )
        ]));
  }

  Widget _buildPaymentHistory() {
    return Container(
      padding: EdgeInsets.all(14),
      width: context.width(),
      color: Colors.white,
      margin: EdgeInsets.only(top: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Payment history", style: boldTextStyle(color: secondaryColor)),
        18.height,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/91.jpg"), radius: 24),
            12.width,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "John Deo",
                style: boldTextStyle(size: 18),
              ),
              Text("Payment to you")
            ])
          ]),
          Column(
            children: [Text("Rs 1,200/-"), Text("completed", style: TextStyle(color: Colors.green))],
          ),
        ])
      ]),
    );
  }

  Widget _buildpaymentMethod() {
    return Container(
      padding: EdgeInsets.all(14),
      width: context.width(),
      color: Colors.white,
      margin: EdgeInsets.only(top: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text("Payment Method", style: boldTextStyle(color: secondaryColor)),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: payBankData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    PaymentBank? result = await CGPaymentBankDetails(detail: payBankData[index]).launch(context);
                    payBankData.remove(result);
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage("${payBankData[index].bankImage}"), radius: 24),
                      12.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            payBankData[index].bankName! + "..1234 via UPI",
                            style: boldTextStyle(size: 16),
                          ),
                          Text("primary payment method")
                        ],
                      ),
                    ],
                  ).paddingOnly(top: 8, bottom: 8),
                );
              }),
        ),
        Divider(thickness: 1),
        InkWell(
          onTap: () async {
            PaymentBank? result = await CGPaymentListBankScreen().launch(context);
            if (result != null) {
              payBankData.add(result);
            }
            setState(() {});
          },
          child: Container(
            child: Row(
              children: [Icon(Icons.add_circle_outline, color: secondaryColor, size: 28), 32.width, Text("Add payment method", style: TextStyle(fontSize: 18))],
            ),
          ),
        )
      ]),
    );
  }

  _buildHelp() {
    return InkWell(
      onTap: () {
        CGPaymentHelpScreen().launch(context);
      },
      child: Container(
        padding: EdgeInsets.all(14),
        width: context.width(),
        color: Colors.white,
        margin: EdgeInsets.only(top: 8.0, bottom: 72),
        child: Row(
          children: [
            Icon(
              Icons.help_outline,
              color: secondaryColor,
              size: 28,
            ),
            32.width,
            Text("Help", style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }
}
