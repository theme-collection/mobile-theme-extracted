import 'package:event_flutter/model/EAForYouModel.dart';
import 'package:event_flutter/screens/PurchaseMoreScreen.dart';
import 'package:event_flutter/utils/EADataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EAExplorerScreen extends StatefulWidget {
  @override
  EAExplorerScreenState createState() => EAExplorerScreenState();
}

class EAExplorerScreenState extends State<EAExplorerScreen> {
  List<EAForYouModel> explorerList = getMayKnowData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return const PurchaseMoreScreen();
  }
}
