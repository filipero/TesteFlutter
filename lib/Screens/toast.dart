import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import '../Widgets/toast.dart';

class ToastNotify extends StatefulWidget {
  static const routeName = '/toast';
  static const pageTitle = 'Notificações em tela com OkToast';
  @override
  _ToastNotifyState createState() => _ToastNotifyState();
}

class _ToastNotifyState extends State<ToastNotify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ToastNotify.pageTitle),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 40, right: 20),
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
            backgroundColor: Colors.grey,
            child: Icon(Icons.add),
            onPressed: () {
              showToastWidget(
                  ToastWidget(
                    title: 'Toasty',
                    description: 'Write Better Toast',
                  ),
                  duration: Duration(seconds: 5));
            }),
      ),
    );
  }
}
