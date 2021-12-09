import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class FormBookingPage extends StatefulWidget {
  const FormBookingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FormBookingPage> createState() => _FormBookingPageState();
}

class _FormBookingPageState extends State<FormBookingPage> {
  String valLokasi = 'PCR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Email'),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Nama Lengkap'),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Nomor Whatsapp'),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Lokasi Tes'),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Tanggal Tes'),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Jenis Test'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {},
                child: const Text('Reservasi'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AdminFormBookingPage(title: 'Admin Page')));
                },
                child: const Text('Admin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AdminFormBookingPage extends StatefulWidget {
  const AdminFormBookingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AdminFormBookingPage> createState() => _AdminFormBookingPageState();
}

class _AdminFormBookingPageState extends State<AdminFormBookingPage> {
  Widget _bookingRow = Row();

  // _AdminFormBookingPageState() {
  //   fetchDataBooking().then((val) => setState(() {
  //         _bookingRow = val;
  //       }));
  // }

  Future<void> fetchDataBooking() async {
    const url = 'https://slowlab-core.herokuapp.com/booking/get-booking/';
    try {
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> extractedData = jsonDecode(response.body);
      extractedData.forEach((key, val) {});
      _bookingRow = Row(
        children: const [
          Text('Booking'),
        ],
      );
    } catch (error) {
      // return Row();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  fetchDataBooking();
                },
                child: const Text('Refresh'),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: const SizedBox(
                    width: 300,
                    height: 100,
                    child: Text('A card that can be tapped'),
                  ),
                ),
              ),
              _bookingRow,
            ],
          ),
        ),
      ),
    );
  }
}
