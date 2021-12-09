import 'dart:convert';

import 'package:flutter/material.dart';
import '../../models/booking.dart';
import '../../widgets/booking_card.dart';
import 'package:http/http.dart' as http;

Future<BookingJSON> fetchDataBooking() async {
  const url = "https://slowlab-core.herokuapp.com/booking/get-booking";

  final response = await http.get(Uri.parse(url));

  return jsonDecode(response.body);
}

class BookingJSON {
  BookingJSON({
    required this.model,
    required this.pk,
    required this.fields,
  });

  final String model;
  final int pk;
  final List<Booking> fields;

  factory BookingJSON.fromJson(String str) =>
      BookingJSON.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingJSON.fromMap(Map<String, dynamic> json) => BookingJSON(
        model: json['model'],
        pk: json['pk'],
        fields: json['fields'],
      );

  Map<String, dynamic> toMap() => {
        "model": model,
        "pk": pk,
        "fields": List<dynamic>.from(fields.map((x) => x)),
      };
}

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
              FutureBuilder<BookingJSON>(
                  future: fetchDataBooking(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Booking> bookings = snapshot.data!.fields;
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: bookings.length,
                                itemBuilder: (context, index) {
                                  return bookingCard(context, bookings[index]);
                                })
                          ]);
                    }
                    return const Text("a");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
