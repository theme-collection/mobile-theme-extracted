import 'package:flutter/material.dart';

class EmailSMSComponent extends StatefulWidget {
  static String tag = '/EmailSMSComponent';

  @override
  EmailSMSComponentState createState() => EmailSMSComponentState();
}

class EmailSMSComponentState extends State<EmailSMSComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [],
      ),
    );
  }
}
