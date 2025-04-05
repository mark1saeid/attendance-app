import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presensi_pintar_ta/utils/theme.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Container(
          padding: paddingAll,
          margin: const EdgeInsets.symmetric(vertical: 100),
          child: Column(children: [
            SvgPicture.asset(
              'assets/empty-data.svg',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(height: 25),
            Text(
              "No data yet",
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              "Pull the screen down to update data",
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
          ]),
        ),
      ),
    );
  }
}
