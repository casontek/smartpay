
import 'package:flutter/material.dart';
import 'package:smartpaymobile/models/user.dart';
import 'package:smartpaymobile/widgets/custom_button_widget.dart';

import '../../services/sqlite_service.dart';
import '../../widgets/custom_single_text_widget.dart';
import '../auth/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  final String token;

  const HomeScreen({super.key, required this.user, required this.token});

  @override
  State<StatefulWidget> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen> {
  final sqlService = SQLiteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 94.0),
                      Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.contain,
                        width: 120,
                      ),
                      const SizedBox(height: 16.0),
                      customMultiLineTextWidget(
                          label: widget.user.name,
                          size: 24,
                          weight: FontWeight.w600,
                          textColor: Theme.of(context).colorScheme.primary
                      ),
                      customMultiLineTextWidget(
                          label: widget.user.email,
                          size: 16,
                          textAlign: TextAlign.center,
                          weight: FontWeight.w400,
                          textColor: Theme.of(context).colorScheme.onSurface
                      ),
                      customMultiLineTextWidget(
                          label: 'USER TOKEN\n${widget.token}',
                          size: 16,
                          textAlign: TextAlign.center,
                          weight: FontWeight.w400,
                          textColor: Theme.of(context).colorScheme.onSurface
                      ),
                      const SizedBox(height: 32.0),
                      customButtonWidget(
                          label: 'Logout',
                          onClick: () async {
                            await sqlService.clearData();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => const SignInScreen()),
                                    (Route<dynamic> route) => false
                            );
                          },
                          context: context
                      )
                    ]
                )
              )
          )
      ),
    );
  }

}