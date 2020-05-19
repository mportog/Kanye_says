import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kanye_rest/controller/connection_store.dart';
import 'package:kanye_rest/controller/quote_store.dart';
import 'package:kanye_rest/shared/connectivity.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription _connectionChangeStream;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ConnectionStore _connectionStore;
  QuoteStore _quoteStore;
  @override
  void initState() {
    super.initState();
    _connectionStore = ConnectionStore();
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
    connectionStatus.checkConnection();
    _quoteStore = QuoteStore();
    _quoteStore.getQuote();
  }

  void connectionChanged(dynamic hasConnection) {
    print('hasConnection: $hasConnection');
    _connectionStore.hasConnection = hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('What Kanye would say ?'),
        elevation: 5,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share('As Kanye would say: "${_quoteStore.quote.quote}"');
              })
        ],
      ),
      body: Observer(
          builder: (_) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: _quoteStore.img, fit: BoxFit.cover)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.format_quote,
                      color: Colors.white,
                      size: 30,
                    ),
                    Container(
                      width: width * 0.8,
                      height: height,
                      child: Center(
                        child: Text(
                          _quoteStore.quote.quote,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.format_quote,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              )),
      floatingActionButton: Observer(
        builder: (_) => FloatingActionButton.extended(
          isExtended: true,
          onPressed: _quoteStore.loading
              ? null
              : _connectionStore.hasConnection
                  ? () => _quoteStore.getQuote()
                  : () => snackBarNotify(
                      'Device is offline, check your connection', _scaffoldKey),
          label: Text('Quote'),
          icon: Icon(Icons.refresh),
        ),
      ),
    );
  }

  snackBarNotify(String txt, GlobalKey<ScaffoldState> scaffoldKey) {
    final snack = SnackBar(
      content: Text(txt),
      duration: Duration(seconds: 2),
    );
    scaffoldKey.currentState.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(snack);
  }
}
