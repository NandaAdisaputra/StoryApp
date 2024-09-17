import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/ui/auth/auth_provider.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storyappsdicoding/utils/resource_helpers/assets.dart';
import 'package:storyappsdicoding/utils/resource_helpers/colors.dart';
import 'package:storyappsdicoding/utils/result_state.dart';
import 'package:storyappsdicoding/utils/styles.dart';
import 'package:storyappsdicoding/widget/fade_in_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLogo(),
              const SizedBox(height: 20),
              _buildTitle(context),
              const SizedBox(height: 20),
              const FadeInWidget(
                duration: Duration(milliseconds: 100),
                child: _LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      ImageAssets.imageLogo,
      width: 150,
      height: 150,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.titleLogin,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: CustomColors.darkOrange, fontSize:28, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late Animation<double> _animation;
  bool _obscureText = true;
  bool _isPressed = false;
  bool _showEmailField = false;
  bool _showPasswordField = false;
  bool _showForgotPasswordText = false;
  bool _showLoginButton = false;
  bool _showRegisterLink = false;
  bool _showOrDivider = false;
  bool _showSocialLoginButtons = false;
  bool _showDivider = false;
  bool _showTermsAndConditionsText = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _animation = Tween<double>(begin: -10, end: 10).animate(_controller);
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showEmailField = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showPasswordField = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showForgotPasswordText = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showLoginButton = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showRegisterLink = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showOrDivider = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showSocialLoginButtons = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showDivider = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _showTermsAndConditionsText = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value + 10.0, 0),
          child: child,
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            if (_showEmailField) _buildEmailField(context),
            if (_showPasswordField) const SizedBox(height: 12),
            if (_showPasswordField) _buildPasswordField(context),
            if (_showForgotPasswordText) const SizedBox(height: 10),
            if (_showForgotPasswordText) _buildForgotPasswordText(context),
            if (_showLoginButton) const SizedBox(height: 10),
            if (_showLoginButton) _buildLoginButton(context),
            if (_showRegisterLink) const SizedBox(height: 10),
            if (_showRegisterLink) _buildRegisterLink(context),
            if (_showOrDivider) const SizedBox(height: 10),
            if (_showOrDivider) _buildOrDivider(context),
            if (_showSocialLoginButtons) const SizedBox(height: 10),
            if (_showSocialLoginButtons) _buildSocialLoginButtons(context),
            if (_showDivider) const SizedBox(height: 10),
            if (_showDivider) _buildDivider(context),
            if (_showTermsAndConditionsText) const SizedBox(height: 10),
            if (_showTermsAndConditionsText)
              _buildTermsAndConditionsText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showEmailField ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        cursorColor: purple,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.emailStory,
          focusedBorder: const OutlineInputBorder(),
          border: const OutlineInputBorder(),
          enabledBorder: _inputBorder(),
          disabledBorder: _inputBorder(),
          errorBorder: _inputErrorBorder(),
          focusedErrorBorder: _inputBorder(),
          isDense: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.enterYourEmailStory;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showPasswordField ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: TextFormField(
        obscureText: _obscureText,
        controller: _passwordController,
        cursorColor: purple,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.passwordStory,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          enabledBorder: _inputBorder(),
          disabledBorder: _inputBorder(),
          errorBorder: _inputErrorBorder(),
          focusedErrorBorder: _inputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _togglePasswordVisibility,
          ),
          isDense: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.enterYourPasswordStory;
          }
          if (value.length < 6) {
            return AppLocalizations.of(context)!.validationPasswordStory;
          }
          return null;
        },
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1.0),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  OutlineInputBorder _inputErrorBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  Widget _buildForgotPasswordText(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showForgotPasswordText ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed('reset'),
          child: Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: Text(
              AppLocalizations.of(context)!.forgotPassword,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showLoginButton ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: context.watch<AuthProvider>().isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: purple,
                ),
              )
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor:
                        _isPressed ? Colors.orangeAccent : Colors.deepOrange,
                  ),
                  onPressed: () async {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                    Timer(const Duration(seconds: 1), () {
                      setState(() {
                        _isPressed = false;
                      });
                    });
                    _onLoginButtonPressed(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.loginStory.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void _onLoginButtonPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final authRead = context.read<AuthProvider>();

      await authRead.login(
        _emailController.text,
        _passwordController.text,
        context,
      );

      if (mounted) {
        final loginState = authRead.state;
        scaffoldMessenger.removeCurrentSnackBar();
        if (loginState == ResultState.success) {
          await _saveLoginSession();
          GoRouter.of(context).pushNamed('login');
          scaffoldMessenger.showSnackBar(
            SnackBar(
              backgroundColor: success,
              content: Text(
                AppLocalizations.of(context)!.successLoginStory.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        } else if (loginState == ResultState.error) {
          final errorMessage = authRead.message;
          if (errorMessage.isNotEmpty) {
            scaffoldMessenger.showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  errorMessage.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else {
            scaffoldMessenger.showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  AppLocalizations.of(context)!
                      .errorOccurredDuringLogin
                      .toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
        }
      }
    }
  }

  bool isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    return RegExp(r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<void> _saveLoginSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppLocalizations.of(context)!.loginDataKeyStory, true);
  }

  Widget _buildRegisterLink(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).pushNamed('register'),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: AppLocalizations.of(context)!.notHaveAccount,
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.registerStory,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 18
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(
            color: Colors.black,
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              color: Colors.white,
              child: Text(
                AppLocalizations.of(context)!.orLogin,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLoginButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: () {
            _loginWithGoogle(context);
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
          ),
          icon: const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.grey,
          ),
          label: Text(
            AppLocalizations.of(context)!.loginWithGoogle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
          ),
          icon: const FaIcon(
            FontAwesomeIcons.facebook,
            color: Colors.blue,
          ),
          label: Text(
            AppLocalizations.of(context)!.loginWithFacebook,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Divider(
          color: Colors.black,
        ));
  }

  Widget _buildTermsAndConditionsText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: AppLocalizations.of(context)!.approveLogin,
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.termsAndConditions,
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Future<void> _loginWithGoogle(BuildContext context) async {}
}
