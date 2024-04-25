import 'dart:convert';

import 'package:flutter/services.dart';

enum SearchType {MOVIE, TV, PERSON, NOSELECT}

class AppSettings {
  static String youtubeVideoConvertor(String id) {
    return 'http://img.youtube.com/vi/$id/hqdefault.jpg';
  }

  static String voteAverageString(double value) {
    double truncatedValue = double.parse(value.toStringAsFixed(1));
    // log((truncatedValue / 2).toString());
    return (truncatedValue).toString();
  }

  static String convertToRuntime(int minutes) {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    String hourString = hours.toString().padLeft(2, '0');
    String minuteString = remainingMinutes.toString().padLeft(2, '0');

    return '${hourString}s ${minuteString}dk';
  }

  static Future<String?> getJobTranslation(
      String department, String job) async {
    try {
      // JSON dosyasını oku
      String jsonString = await rootBundle.loadString('assets/job/jobs.json');
      List<dynamic> data = jsonDecode(jsonString);

      // Departmanı bul
      var departmentData = data.firstWhere(
        (element) => element['department_org'] == department,
        orElse: () => null,
      );

      if (departmentData != null) {
        // İş tanımını bul
        var jobTranslation = departmentData['jobs'][job];
        if (jobTranslation != null) {
          return jobTranslation;
        } else {
          return 'İş tanımı bulunamadı.';
        }
      } else {
        return 'Departman bulunamadı.';
      }
    } catch (e) {
      //  print('Hata: $e');
      return null;
    }
  }
}
