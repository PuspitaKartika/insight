import 'package:al_quran_digital/repositories/al_quran_repo.dart';
import 'package:al_quran_digital/theme.dart';
import 'package:al_quran_digital/view/surah/surah_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text & gambar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 120,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Al-Quran\nDigital",
                  style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),

            //button
            Padding(
              padding: const EdgeInsets.only(bottom: 15, top: 60),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 40)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SurahScreen()));
                  },
                  child: Text(
                    "Al-Quran",
                    style: TextStyle(color: primaryTextColor),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 40)),
                  onPressed: () {},
                  child: Text(
                    "Doa",
                    style: TextStyle(color: primaryTextColor),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 40)),
                  onPressed: () {},
                  child: Text(
                    "Tafsir",
                    style: TextStyle(color: primaryTextColor),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 40)),
                  onPressed: () {},
                  child: Text(
                    "Jadwal Sholat ",
                    style: TextStyle(color: primaryTextColor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
