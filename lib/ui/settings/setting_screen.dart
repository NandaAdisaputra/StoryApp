import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:storyappsdicoding/ui/auth/auth_provider.dart';
import 'package:storyappsdicoding/ui/settings/setting_provider.dart';
import 'package:storyappsdicoding/utils/result_state.dart';
import 'package:storyappsdicoding/widget/custom_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final AuthProvider _authProvider;

  @override
  void initState() {
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
    _authProvider.addListener(logoutStateListener);
    super.initState();
  }

  logoutStateListener() {
    if (mounted) {
      final authProvider = context.read<AuthProvider>();
      if (authProvider.state == ResultState.loading) {
        showLoadingDialog(context);
      } else if (authProvider.state == ResultState.error) {
        GoRouter.of(context).pop();
        showErrorDialog(context, authProvider.message);
      } else if (authProvider.state == ResultState.success) {
        GoRouter.of(context).pop();
        GoRouter.of(context).go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( AppLocalizations.of(context)!.settings),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: Text( AppLocalizations.of(context)!.pageSettingsTitle),
            onTap: () {
              showLanguageDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text( AppLocalizations.of(context)!.logoutStory),
            onTap: () {
              showConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.selectLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageDropdown(context),
            ],
          ),
        );
      },
    );
  }
  Widget _buildLanguageDropdown(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, localeModel, child) {
        var selectedLocale = Localizations
            .localeOf(context)
            .languageCode;
        return DropdownButtonFormField<String>(
          value: selectedLocale,
          items: [
            DropdownMenuItem(
              value: "id",
              child: Text(
                AppLocalizations.of(context)!.pageSettingsInputLanguage("id"),
              ),
            ),
            DropdownMenuItem(
              value: "en",
              child: Text(
                AppLocalizations.of(context)!.pageSettingsInputLanguage("en"),
              ),
            ),
            DropdownMenuItem(
              value: "ar",
              child: Text(
                AppLocalizations.of(context)!.pageSettingsInputLanguage("ar"),
              ),
            ),
          ],
          onChanged: (String? value) {
            if (value != null) {
              final newLocale = Locale(value);
              localeModel.set(newLocale, context);
            }
          },
        );
      },
    );
  }
  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return buildAlertDialog(
          title: AppLocalizations.of(context)!.logoutStory,
          content: AppLocalizations.of(context)!.areYouSureYouWantToLogOut,
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.cancelled),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
                _authProvider.logout();
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      },
    );
  }

  Widget buildAlertDialog({
    required String title,
    required String content,
    required List<Widget> actions,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: actions,
    );
  }
}