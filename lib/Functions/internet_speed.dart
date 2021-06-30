import 'package:flutter/material.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:internet_speed_test/callbacks_enum.dart';

// ignore: camel_case_types
class interSpeed extends StatefulWidget {
  @override
  _interSpeedState createState() => _interSpeedState();
}

// ignore: camel_case_types
class _interSpeedState extends State<interSpeed> {
  final internetSpeedTest = InternetSpeedTest();

  double downloadRate = 0;
  double uploadRate = 0;
  String downloadProgress = '0';
  String uploadProgress = '0';

  String unitText = 'Mb/s';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet speed'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Progress $downloadProgress%'),
                Text('Download rate  $downloadRate $unitText'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Progress $uploadProgress%'),
                Text('Upload rate  $uploadRate Kb/s'),
              ],
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('start testing'),
              onPressed: () {
                internetSpeedTest.startDownloadTesting(
                  onDone: (double transferRate, SpeedUnit unit) {
                    print('the transfer rate $transferRate');
                    setState(() {
                      downloadRate = transferRate;
                      unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                      downloadProgress = '100';
                    });
                  },
                  onProgress:
                      (double percent, double transferRate, SpeedUnit unit) {
                    print(
                        'the transfer rate $transferRate, the percent $percent');
                    setState(() {
                      downloadRate = transferRate;
                      unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                      downloadProgress = percent.toStringAsFixed(2);
                    });
                  },
                  onError: (String errorMessage, String speedTestError) {
                    print(
                        'the errorMessage $errorMessage, the speedTestError $speedTestError');
                  },
                  testServer:
                      'https://idgtechmedia.speedtestcustom.com/result/77cb22c0-1451-11eb-bf67-7d25ceff81f6R',
                  fileSize: 20000000,
                );
                internetSpeedTest.startUploadTesting(
                  onDone: (double transferRate, SpeedUnit unit) {
                    print('the transfer rate $transferRate');
                    setState(() {
                      uploadRate = transferRate;
                      unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                      uploadProgress = '100';
                    });
                  },
                  onProgress:
                      (double percent, double transferRate, SpeedUnit unit) {
                    print(
                        'the transfer rate $transferRate, the percent $percent');
                    setState(() {
                      uploadRate = transferRate;
                      unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                      uploadProgress = percent.toStringAsFixed(2);
                    });
                  },
                  onError: (String errorMessage, String speedTestError) {
                    print(
                        'the errorMessage $errorMessage, the speedTestError $speedTestError');
                  },
                  testServer:
                      'https://speedtest.takamol.sy.prod.hosts.ooklaserver.net:8080/upload?nocache=a3fd0f07-a5f0-434c-900c-7aa5fd102858&guid=ea24b1a6-eab7-4316-99d1-1971305e05d8',
                  fileSize: 20000000,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
