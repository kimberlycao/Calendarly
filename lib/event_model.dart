import 'package:flutter/material.dart';

class Event {
  String title;
  DateTime date;
  TimeOfDay time;
  String notes;

  Event(this.title, this.date, this.time, this.notes);

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'time': time,
        'notes': notes,
      };
}
