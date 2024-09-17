import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/repository/auth_repository.dart';
import 'package:storyappsdicoding/ui/auth/auth_provider.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:storyappsdicoding/utils/styles.dart';
import 'package:storyappsdicoding/utils/validasi/validasi_input.dart';
import 'package:http/http.dart' as http;
import '../../../utils/resource_helpers/index.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.registerAccountStory),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(
              authRepository: AuthRepositoryImpl(client: http.Client()),
            ),
          )
        ],
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                const SizedBox(height: 30),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const _RegisterForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildLogo() {
  return Image.asset(
    ImageAssets.imageLogo,
    width: 150,
    height: 150,
  );
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm>
    with SingleTickerProviderStateMixin {
  late final AuthProvider authProvider;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPressed = false;
  bool _obscureText = true;
  bool _showUsernameField = false;
  bool _showEmailField = false;
  bool _showRegisterButton = false;
  bool _showPasswordField = false;
  late final AnimationController _controller;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;
  late Animation<double> _animation;

  final CustomValidateHelper _validator = CustomValidateHelper();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _animation = Tween<double>(begin: -10, end: 10).animate(_controller);
    _startAnimation();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _showUsernameField = true;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _showEmailField = true;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _showPasswordField = true;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _showRegisterButton = true;
    });
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitle(context),
            const SizedBox(height: 12),
            _buildUserNameField(context),
            const SizedBox(height: 8),
            _buildEmailField(context),
            const SizedBox(height: 8),
            _buildPasswordField(context),
            const SizedBox(height: 20),
            _buildRegisterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.registerAccountStory,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _buildUserNameField(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showUsernameField ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: TextFormField(
        controller: userNameController,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.usernameStory,
          focusedBorder: _inputBorder(),
          enabledBorder: _inputBorder(),
          disabledBorder: _inputBorder(),
          errorBorder: _inputErrorBorder(),
          focusedErrorBorder: _inputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.enterRegisterUsernameStory;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showEmailField ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.emailStory,
          focusedBorder: _inputBorder(),
          enabledBorder: _inputBorder(),
          disabledBorder: _inputBorder(),
          errorBorder: _inputErrorBorder(),
          focusedErrorBorder: _inputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
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
        controller: passwordController,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.passwordStory,
          focusedBorder: _inputBorder(),
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
          if (value.length < 8) {
            return AppLocalizations.of(context)!
                .validationRegisterPasswordStory;
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

  Widget _buildRegisterButton(BuildContext context) {
    return Opacity(
      opacity: _showRegisterButton ? 1.0 : 0.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: isPressed ? Colors.orangeAccent : Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () async {
          setState(() {
            isPressed = !isPressed;
          });
          Timer(const Duration(seconds: 1), () {
            setState(() {
              isPressed = false;
            });
          });
          if (_formKey.currentState!.validate()) {
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            try {
              final authRead = context.read<AuthProvider>();
              _validator.validateRegistrationInputs(
                userNameController.text,
                emailController.text,
                passwordController.text,
              );
              await authRead.register(userNameController.text,
                  emailController.text, passwordController.text, context);
              GoRouter.of(context).pushNamed('login');
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  backgroundColor: success,
                  content: Text(
                    AppLocalizations.of(context)!.successRegisterStory,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } catch (e) {
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    'Failed to register: ${e.toString()}',
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
        },
        child: context.watch<AuthProvider>().isLoading
            ? const Center(
                child: CircularProgressIndicator(backgroundColor: purple),
              )
            : Text(
                AppLocalizations.of(context)!.registerStory.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }
}
