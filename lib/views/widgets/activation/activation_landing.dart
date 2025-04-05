import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:presensi_pintar_ta/provider/store_provider.dart';
import 'package:presensi_pintar_ta/provider/stream/auth_stream.dart';
import 'package:presensi_pintar_ta/services/locator/navigation_service.dart';
import 'package:presensi_pintar_ta/services/locator/locator.dart';
import 'package:presensi_pintar_ta/utils/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presensi_pintar_ta/views/widgets/activation/activation.dart';
import 'package:presensi_pintar_ta/views/widgets/components/button.dart';
import 'package:presensi_pintar_ta/views/widgets/components/appbarsliver.dart';
import 'package:provider/provider.dart';

class ActivationLanding extends StatefulWidget {
  const ActivationLanding({super.key});

  @override
  State<ActivationLanding> createState() => _ActivationLandingState();
}

class _ActivationLandingState extends State<ActivationLanding> {
  final navigator = locator<NavigationService>().navigator!;
  final authService = locator<AuthStream>();

  bool _isProcessLogout = false;

  final stepLists = [
    "Make sure you are in a bright, well-lit place.",
    "Click the \"Start Activation\" button below.",
    "You will be directed to the front camera of your smartphone.",
    "Follow the on-screen instructions to take 3 selfies in sequence.",
    "Make sure your face is clearly visible in each photo.",
    "Once completed, our system will process and verify your face.",
    "If verification is successful, your account will be activated and you can start using our app.",
  ];

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<UserStore>();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            AppBarSliver(
              title: 'Account Activation',
              bottomChild: Text(
                'Account Activation',
                style: blackTextStyle.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: paddingAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: SvgPicture.asset(
                              'assets/activation.svg',
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Hello, ${profile.profile?.name}',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Activate your account by taking a selfie to detect and identify facial features.",
                        style: blackTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Here are the steps to activate your account:',
                        style: blackTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 15),
                      stepListsWidget(),
                      const SizedBox(height: 15),
                      Text(
                        'Remember, be sure to follow the instructions carefully and make sure the selfie you take is of good quality. This will help ensure the accuracy and security of facial identification.',
                        style: blackTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 15),
                      Button(
                        label: 'Start Activation',
                        onPressed: () {
                          navigator.push(
                            MaterialPageRoute(
                              builder: (context) => const Activation(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      Button(
                        isLoading: _isProcessLogout,
                        label: 'Logout',
                        type: ButtonType.link,
                        onPressed: () {
                          setState(() {
                            _isProcessLogout = true;
                          });
                          authService.logout().then((value) {
                            navigator.pushNamedAndRemoveUntil(
                                '/login', (route) => false);
                            setState(() {
                              _isProcessLogout = false;
                            });
                          }).catchError((err) {
                            Fluttertoast.showToast(msg: 'Failed to logout');
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepListsWidget() {
    return Column(
      children: stepLists.asMap().entries.map(
        (e) {
          return Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '${e.key + 1}.',
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: Text(
                    e.value,
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
