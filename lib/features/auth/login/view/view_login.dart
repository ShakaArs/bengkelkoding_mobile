// lib/features/auth/login/view/view_login.dart
import 'package:bengkel_koding_mobile/helper/app_button.dart';
import 'package:bengkel_koding_mobile/helper/app_text_field_form.dart';
import 'package:bengkel_koding_mobile/routers/router.dart';
import 'package:bengkel_koding_mobile/utils/app_colors_palette.dart';
import 'package:bengkel_koding_mobile/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../controller/controller_login.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var authState = ref.watch(authProvider);
    final authController = ref.read(authProvider.notifier);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 111,
                height: 123,
                child: SvgPicture.asset("assets/icon/logo_bengkod.svg"),
              ),
              Text(
                "Bengkel Koding",
                style: AppTextStyle.textStyle(
                  color: AppColor.secondPrimaryColor,
                  size: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 42),
              AppTextFieldForm(
                _emailController,
                func: (value) {},
                hintText: "Masukan Email",
                obscureText: false,
                text: "Email",
                icon: "assets/icon/icon_user.svg",
              ),
              const SizedBox(height: 10),
              AppTextFieldForm(
                _passwordController,
                func: (value) {},
                hintText: "Masukan Password",
                obscureText: obscureText,
                text: "Password",
                icon: "assets/icon/icon_password.svg",
                suffixIcon: obscureText == false
                    ? "assets/icon/icon_eye_open.svg"
                    : "assets/icon/icon_eye_close.svg",
                iconFunc: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              const SizedBox(height: 13),
              GestureDetector(
                onTap: () => context.push('/login/forgotPassword'),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lupa kata sandi?",
                    style: AppTextStyle.textStyle(
                      color: AppColor.secondPrimaryColor,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  await authController.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                  setState(() {
                    authState = ref.watch(authProvider);
                  });
                  if (authState.user != null) {
                    router.go("/home");
                  } else {
                    String errorMessage =
                        authState.errorMessage ?? "An unknown error occurred.";
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorMessage)),
                    );
                  }
                },
                child: AppButton(
                  color: AppColor.primaryColor,
                  content: authState.isLoading
                      ? CircularProgressIndicator(
                          color: AppColor.whiteColor,
                        )
                      : Text(
                          "Masuk",
                          style: AppTextStyle.textStyle(
                            size: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                          ),
                        ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                      color: AppColor.blackColor.withOpacity(0.25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
