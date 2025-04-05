import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:presensi_pintar_ta/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatelessWidget {
  Information({super.key});

  final List<Map<String, String>> informationItems = [
    {
      "title": "Eid Holiday Announcement",
      "description":
          "Joint leave for Eid 2025 will be effective from April 19, 2025 and will end on April 25, 2025. Thus, people will be able to start working on April 26, 2025.",
      "link":
          "https://www.cnbcindonesia.com/news/20230424174229-4-432047/jangan-sampai-bablas-cuti-bersama-lebaran-usai-tanggal-ini",
      "date": "Rabu, 26 Apr 2025"
    },
    {
      "title":
          "West Java Police monitor smooth flow of homecoming and return trips except Puncak",
      "description":
          "The West Java Regional Police (Polda Jabar) monitored the overall flow of homecoming and return traffic until D+4 of Eid 2025, there was no significant congestion.",
      "link":
          "https://www.antaranews.com/berita/3507363/polda-jabar-pantau-arus-mudik-dan-balik-lebaran-lancar-kecuali-puncak",
      "date": "Rabu, 27 Apr 2025"
    },
    {
      "title": "Trans Java Toll Road One-Way Schedule for 2025 Eid Homecoming Flow",
      "description":
          "Travelers need to know the one-way schedule for the Trans Java Toll Road for the 2025 Eid homecoming flow. This is because the scheme applies at certain times.",
      "link":
          "https://www.cnnindonesia.com/nasional/20230417170824-25-938918/jadwal-satu-arah-jalan-tol-trans-jawa-arus-balik-lebaran-2023",
      "date": "Rabu, 26 Apr 2025"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: paddingAll,
          child: Text(
            "Information",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Padding(
          padding: paddingHorizontal,
          child: Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: informationItems.map((item) {
                return InkWell(
                  onTap: () async {
                    final url = Uri.parse(item['link']!);
                    try {
                      await launchUrl(url);
                    } catch (e) {
                      Fluttertoast.showToast(msg: 'Link error');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: paddingAll,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'] ?? '',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['description'] ?? '',
                          textAlign: TextAlign.justify,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: blackTextStyle.copyWith(
                              fontSize: 14, color: Colors.grey.shade800),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 14,
                              color: Colors.grey.shade500,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              item['date'] ?? '',
                              style: blackTextStyle.copyWith(
                                  color: Colors.grey.shade500, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
