import 'package:flutter/material.dart';
import '../../models/booking.dart';

Widget bookingCard(BuildContext context, Booking booking) {
  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(booking.namaLengkap),
          Text(booking.email),
          Text(booking.lokasi),
        ],
      ),
    ),
  );
}
