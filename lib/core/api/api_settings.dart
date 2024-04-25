
import 'package:intl/intl.dart';

class ApiSettings {
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String baseToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYmY1MzVhYTc0ZTRiMzZlOTYwMTE3MjhmYTVmNmYwMSIsInN1YiI6IjY0ZjEwYzkzY2FhNTA4MDEwYWU2Yzc4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xrB53QgO4DQNlxIl1QKIHpdXXP9Jr_6wLssDPp87l8w';
  static String apiKey =
      'c033030a6a2c8c21f4db8286fddae551'; // dbf535aa74e4b36e96011728fa5f6f01 - benim orijinal
  static String imagePath185(String path) =>
      'https://image.tmdb.org/t/p/w185$path';

  static String imagePathOriginal(String path) =>
      'https://image.tmdb.org/t/p/w500$path';

  static String imagePath500(String path) =>
      'https://image.tmdb.org/t/p/w500$path';

  static String formatMonthAndYear(String date) {
    // Verilen tarihi 'yyyy-MM-dd' formatından ayrıştırma
    DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(date);

    // Tarih bilgisinden ayı ve yılı alarak biçimlendirme
    String formattedMonthAndYear =
        DateFormat('MMMM dd, y', 'tr-TR').format(parsedDate);

    return formattedMonthAndYear;
  }

  static String compareDates(String inputDate) {
    DateTime suAn = DateTime.now();
    DateTime tarih = DateFormat('yyyy-MM-dd', 'tr-TR').parse(inputDate);

    if (tarih.isBefore(suAn)) {
      return DateFormat('MMMM dd, yyyy', 'tr-TR')
          .format(tarih); // Örnek: Temmuz, 2023
    } else {
      return DateFormat('dd MMMM', 'tr-TR').format(tarih); // Örnek: 15 Ekim
    }
  }

  static String getGenreName(int id) {
    switch (id) {
      case 28:
        return "Aksiyon";
      case 12:
        return "Macera";
      case 16:
        return "Animasyon";
      case 35:
        return "Komedi";
      case 80:
        return "Suç";
      case 99:
        return "Belgesel";
      case 18:
        return "Dram";
      case 10751:
        return "Aile";
      case 14:
        return "Fantastik";
      case 36:
        return "Tarih";
      case 27:
        return "Korku";
      case 10402:
        return "Müzik";
      case 9648:
        return "Gizem";
      case 10749:
        return "Romantik";
      case 878:
        return "Bilim-Kurgu";
      case 10770:
        return "TV film";
      case 53:
        return "Gerilim";
      case 10752:
        return "Savaş";
      case 37:
        return "Vahşi Batı";
      default:
        return "Bilinmeyen"; // Belirtilmemiş bir id gelirse varsayılan olarak "Bilinmeyen" dönecek
    }
  }

  static String getGenreTVName(int id) {
    switch (id) {
      case 10759:
        return "Aksiyon & Macera";
      case 16:
        return "Animasyon";
      case 35:
        return "Komedi";
      case 80:
        return "Suç";
      case 99:
        return "Belgesel";
      case 18:
        return "Dram";
      case 10751:
        return "Aile";
      case 10762:
        return "Çocuklar";
      case 9648:
        return "Gizem";
      case 10763:
        return "Haber";
      case 10764:
        return "Gerçeklik";
      case 10765:
        return "Bilim Kurgu & Fantazi";
      case 10766:
        return "Pembe Dizi";
      case 10767:
        return "Talk";
      case 10768:
        return "Savaş & Politik";
      case 37:
        return "Vahşi Batı";
      default:
        return "Bilinmeyen"; // Belirtilmemiş bir id gelirse varsayılan olarak "Bilinmeyen" dönecek
    }
  }
}
