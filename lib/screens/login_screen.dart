import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/design_system.dart';
import '../widgets/custom_input.dart';
import '../widgets/pill_toggle.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLive = true;
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool remember = false;

  @override
  void dispose() {
    userCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final cardWidth = width > 900 ? 520.0 : (width * 0.9);

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Container(
                  width: cardWidth,
                  decoration: BoxDecoration(
                    color: AppColors.cardBg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                    ),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 34,
                      vertical: 26,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ---- App Title ----
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'CB Alpha Trader',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // ---- Centered Pill Toggle ----
                        PillToggle(
                          left: 'Live',
                          right: 'Demo',
                          isLeftSelected: isLive,
                          onChanged: (v) => setState(() => isLive = v),
                        ),
                        const SizedBox(height: 26),

                        // ---- Section Heading ----
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'ENTER DETAILS',
                                style: AppTextStyles.sectionTitle,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Enter the below information to proceed',
                                style: AppTextStyles.smallMuted,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // ---- Input Fields ----
                        CustomInput(
                          label: 'User ID',
                          hint: 'User ID',
                          controller: userCtrl,
                        ),
                        const SizedBox(height: 16),
                        CustomInput(
                          label: 'Password',
                          hint: 'Password',
                          obscure: true,
                          controller: passCtrl,
                        ),
                        const SizedBox(height: 12),

                        // ---- Remember & Reset ----
                        Row(
                          children: [
                            Checkbox(
                              value: remember,
                              onChanged: (v) =>
                                  setState(() => remember = v ?? false),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Remember user ID',
                              style: AppTextStyles.body,
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Reset password',
                                style: TextStyle(color: AppColors.link),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),

                        // ---- Centered Login Button ----
                        Center(
                          child: PrimaryButton(
                            label: 'hello'.tr(),
                            onPressed: () {
                              final newLocale =
                                  context.locale.languageCode == 'en'
                                  ? Locale('ar')
                                  : Locale('en');
                              context.setLocale(newLocale);
                            },
                            width: 150,
                          ),
                        ),
                        const SizedBox(height: 24),

                        const Divider(),
                        const SizedBox(height: 14),

                        // ---- Footer ----
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextStyles.smallMuted,
                            children: [
                              const TextSpan(
                                text:
                                    'By accessing CB Alpha Trader, I agree that I have read & understood the ',
                              ),
                              TextSpan(
                                text: 'Terms of Use',
                                style: const TextStyle(
                                  color: AppColors.link,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _launchUrl(
                                    'https://www.cbq.qa/EN/Personal-Banking/Pages/terms-of-use.aspx',
                                  ),
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: const TextStyle(
                                  color: AppColors.link,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _launchUrl(
                                    'https://www.cbq.qa/EN/Personal-Banking/Pages/terms-and-conditions.aspx',
                                  ),
                              ),
                              const TextSpan(
                                text: ' of The Commercial Bank of Qatar.',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
