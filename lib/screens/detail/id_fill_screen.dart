
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/bloc/user_fill_bloc/fill_bloc.dart';
import 'package:smartpaymobile/bloc/user_fill_bloc/fill_event.dart';
import 'package:smartpaymobile/bloc/user_fill_bloc/fill_state.dart';
import 'package:smartpaymobile/screens/auth/create_pin_screen.dart';
import 'package:smartpaymobile/utils/app_status.dart';
import 'package:smartpaymobile/utils/constants.dart';
import 'package:smartpaymobile/widgets/custom_single_text_widget.dart';

import '../../widgets/custom_button_widget.dart';

class IdFillScreen extends StatefulWidget {
  final String email;

  const IdFillScreen({super.key, required this.email});

  @override
  State<StatefulWidget> createState() => _IdFillScreen();

}

class _IdFillScreen extends State<IdFillScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  String selectedCountryFlag = '';
  String selectedCountry = '';
  final _countryController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.surface,
            statusBarIconBrightness: Brightness.dark
        ));
    return BlocProvider(
        create: (context) => FillBloc(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: BlocConsumer<FillBloc, FillState>(
              listener: (context, state) {
                if(state.status == Status.failed) {
                  toastMessage(
                      message: state.message,
                      background: Colors.red,
                      textColor: Colors.white,
                      context: context
                  );
                }
                else if(state.status == Status.success) {
                  toastMessage(
                      message: 'User account created.',
                      background: Colors.black38,
                      textColor: Colors.white,
                      context: context
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CreatePinScreen(user: state.user!, token: state.token))
                  );
                }
              },
              builder: (context, state){
                return SafeArea(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: GestureDetector(
                                              onTap: () => Navigator.pop(context),
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12.0),
                                                    border: Border.fromBorderSide(BorderSide(
                                                        color: Theme.of(context).colorScheme.outline,
                                                        width: 1.0
                                                    ))
                                                ),
                                                child: Icon(
                                                    Icons.arrow_back_ios_rounded,
                                                    color: Theme.of(context).colorScheme.primary
                                                ),
                                              )
                                          )
                                      ),
                                      const SizedBox(height: 24.0),
                                      Text.rich(
                                          TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: 'Hey there! tell us a bit about',
                                                    style: TextStyle(
                                                        color: Theme.of(context).colorScheme.primary,
                                                        fontFamily: 'SF Pro Display',
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 24
                                                    )
                                                ),
                                                TextSpan(
                                                  text: 'yourself',
                                                  style: TextStyle(
                                                    color: Theme.of(context).colorScheme.secondary,
                                                    fontFamily: 'SF Pro Display',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                  ),
                                                )
                                              ]
                                          ),
                                          maxLines: 2
                                      ),
                                      const SizedBox(height: 32.0),
                                      TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              hintText: 'Full name',
                                              filled: true,
                                              fillColor: Theme.of(context).colorScheme.surfaceTint,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.surfaceTint,
                                                      width: 0.01
                                                  )
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.surfaceTint,
                                                      width: 0.01
                                                  )
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.outlineVariant,
                                                      width: 1.0
                                                  )
                                              )
                                          ),
                                          validator: (value) => state.isValidNames,
                                          onChanged: (value) => context.read<FillBloc>().add(NameChange(value))
                                      ),
                                      const SizedBox(height: 16.0),
                                      TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              hintText: 'Username',
                                              filled: true,
                                              fillColor: Theme.of(context).colorScheme.surfaceTint,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.surfaceTint,
                                                      width: 0.01
                                                  )
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.surfaceTint,
                                                      width: 0.01
                                                  )
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.outlineVariant,
                                                      width: 1.0
                                                  )
                                              )
                                          ),
                                          validator: (value) => state.isValidUsername,
                                          onChanged: (value) => context.read<FillBloc>().add(UsernameChange(value))
                                      ),
                                      const SizedBox(height: 16.0),
                                      TextFormField(
                                        controller: _countryController,
                                        keyboardType: TextInputType.none,
                                        textInputAction: TextInputAction.none,
                                        decoration: InputDecoration(
                                            hintText: 'Select Country',
                                            filled: true,
                                            suffixIcon: const Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                color: Color(0XFF6B7280)
                                            ),
                                            prefixIcon: selectedCountryFlag.isNotEmpty ?
                                            Image.asset(
                                                selectedCountryFlag,
                                                width: 32
                                            ) : null,
                                            fillColor: Theme.of(context).colorScheme.surfaceTint,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context).colorScheme.surfaceTint,
                                                    width: 0.01
                                                )
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context).colorScheme.surfaceTint,
                                                    width: 0.01
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context).colorScheme.outlineVariant,
                                                    width: 1.0
                                                )
                                            )
                                        ),
                                        validator: (value) => state.isValidCountry,
                                        onTap: () => searchBottomSheet(
                                            context: context,
                                            selectedCountry: state.country,
                                            onSelect: (country, flag, code) {
                                              setState(() {
                                                _countryController.text = country;
                                                selectedCountryFlag = flag;
                                              });
                                              context.read<FillBloc>().add(CountryChange(country, code));
                                              _focusNode.requestFocus();
                                            }
                                        ),
                                      ),
                                      const SizedBox(height: 16.0),
                                      TextFormField(
                                          obscureText: _hidePassword,
                                          focusNode: _focusNode,
                                          keyboardType: TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                              hintText: 'Password',
                                              filled: true,
                                              suffixIcon: GestureDetector(
                                                  child: Icon(
                                                      _hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                                  onTap: () {
                                                    setState(() {
                                                      _hidePassword = !_hidePassword;
                                                    });
                                                  }
                                              ),
                                              fillColor: Theme.of(context).colorScheme.surfaceTint,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.surfaceTint,
                                                      width: 0.01
                                                  )
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.surfaceTint,
                                                      width: 0.01
                                                  )
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context).colorScheme.outlineVariant,
                                                      width: 1.0
                                                  )
                                              )
                                          ),
                                          validator: (value) => state.isValidPassword,
                                          onChanged: (value) => context.read<FillBloc>().add(PasswordChange(value))
                                      ),
                                      const SizedBox(height: 24.0),
                                      customButtonWidget(
                                          label: 'Continue',
                                          isLoading: state.status == Status.loading,
                                          isActive: state.names.isNotEmpty && state.username.isNotEmpty &&
                                              state.country.isNotEmpty && state.password.isNotEmpty,
                                          context: context,
                                          onClick: () {
                                            if(_formKey.currentState?.validate() == true) {
                                              context.read<FillBloc>().add(UpdateProfile(widget.email));
                                            }
                                          }
                                      )
                                    ]
                                )
                            )
                        )
                    )
                );
              })
        )
    );
  }

  void searchBottomSheet({
    required BuildContext context,
    required String selectedCountry,
    required Function(String country, String flag, String code) onSelect
  }) {
    showModalBottomSheet(
        context: context,
        elevation: 3,
        builder: (context) {
          return ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  minChildSize: 0.5,
                  maxChildSize: 0.88,
                  expand: false,
                  builder: (_, controller) {
                    return CountryListWidget(
                        selectedCountry: selectedCountry.isNotEmpty ? selectedCountry : null,
                        controller: controller,
                        onSelect: (country, flag, code) {
                          onSelect(country, flag, code);
                          Navigator.pop(context);
                        }
                    );
                  }
              ));
        },
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0))),
        backgroundColor: Theme.of(context).cardColor);
  }

}

class CountryListWidget extends StatefulWidget {
  final ScrollController controller;
  final Function(String country, String flag, String code) onSelect;
  String? selectedCountry;

  CountryListWidget({
    super.key,
    this.selectedCountry,
    required this.controller,
    required this.onSelect
  });

  @override
  State<StatefulWidget> createState() => _CountryListWidget();

}

class _CountryListWidget extends State<CountryListWidget> {
  List<String> countries = ['United States', 'United Kingdom', 'Singapore', 'China', 'Netherland', 'Indonesia'];
  List<String> flags = ['assets/images/flag_us.png', 'assets/images/flag_gb.png', 'assets/images/flag_sg.png',
    'assets/images/flag_cn.png', 'assets/images/flag_nl.png', 'assets/images/flagid.png'];
  List<String> codes = ['US', 'GB', 'SG', 'CN', 'NL', 'ID'];
  List<String> filteredCountries = [];
  List<String> filteredFlags = [];
  List<String> filteredCodes = [];
  String selectedCountry = '';

  @override
  void initState() {
    super.initState();
    if(widget.selectedCountry != null) {
      selectedCountry = widget.selectedCountry!;
    }
    filteredCountries = List.from(countries);
    filteredFlags = List.from(flags);
    filteredCodes = List.from(codes);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                child: Row(
                children: [
                  Expanded(
                      child: CupertinoSearchTextField(
                        placeholder: "Search",
                        placeholderStyle: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.surfaceTint,
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (keyword) {
                        },
                        onSubmitted: (keyword) {

                        },
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        padding: const EdgeInsets.all(16),
                        prefixIcon: const Icon(CupertinoIcons.search, color: Colors.black45)
                      )
                  ),
                  const SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: customSingleTextWidget(
                        label: 'Cancel',
                        size: 16,
                        weight: FontWeight.w700,
                        textColor: Theme.of(context).colorScheme.primary
                    ),
                  )
                ],
              )
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView(
                  controller: widget.controller,
                  children: [
                    ...countries.mapIndexed((index, country) =>
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCountry = country;
                                  });
                                  widget.onSelect(country, flags[index], codes[index]);
                                },
                                child: Row(children: [
                                  Image.asset(
                                    flags[index],
                                    width: 32,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 16.0),
                                  customSingleTextWidget(
                                      label: codes[index],
                                      size: 16,
                                      weight: FontWeight.w500,
                                      textColor: Theme.of(context).colorScheme.onSurface
                                  ),
                                  const SizedBox(width: 16.0),
                                  customSingleTextWidget(
                                      label: country,
                                      size: 16,
                                      weight: FontWeight.w500,
                                      textColor: Theme.of(context).colorScheme.primary
                                  ),
                                  const Spacer(),
                                  if(selectedCountry == country)
                                    const Icon(
                                        Icons.done,
                                        color: Color(0XFF2FA2B9),
                                        size: 24.0
                                    )
                                ])
                            )
                        )
                    )
                  ],
                ))
          ],
        )
    );
  }

}