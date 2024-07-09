
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/bloc/splash_bloc/splash_bloc.dart';
import 'package:smartpaymobile/bloc/splash_bloc/splash_event.dart';
import 'package:smartpaymobile/bloc/splash_bloc/splash_state.dart';
import 'package:smartpaymobile/screens/auth/pin_login_screen.dart';
import 'package:smartpaymobile/screens/auth/sign_in_screen.dart';
import 'package:smartpaymobile/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SplashBloc(),
        child: const ProviderSplashScreen()
    );
  }

}

class ProviderSplashScreen extends StatefulWidget {
  const ProviderSplashScreen({super.key});

  @override
  State<StatefulWidget> createState()  => _SplashScreen();

}

class _SplashScreen extends State<ProviderSplashScreen> {

  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(CheckAccount());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.surface,
            statusBarIconBrightness: Brightness.dark
        ));
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: BlocConsumer<SplashBloc, SplashState>(
            listener: (context, state) {
              if(state.appState == AppState.onBoarded) {
                navigate('login');
              }
              else if(state.appState == AppState.notOnBoarded) {
                navigate('onboard');
              }
              else if(state.appState == AppState.logged) {
                navigate('pin');
              }
            },
            builder: (context, state) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            'assets/images/smartpay_logo.png',
                            fit: BoxFit.contain,
                            height: 72,
                            width: 72
                        ),
                        const SizedBox(height: 16.0),
                        Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Smart',
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.primary,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32
                                      )
                                  ),
                                  TextSpan(
                                    text: 'Pay.',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                    ),
                                  ),
                                ]
                            )
                        )
                      ]
                  )
              );
            }
        )
    );
  }

  void navigate(String type) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => type == 'login' ? const SignInScreen() :
            type == 'pin' ? const PinLoginScreen() : const OnBoardingScreen())
    );
  }

}