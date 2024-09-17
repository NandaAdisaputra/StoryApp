import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/data/consts/constants.dart';
import 'package:storyappsdicoding/ui/auth/auth_provider.dart';
import 'package:storyappsdicoding/ui/profile/components/sliver_delegate.dart';
import 'package:storyappsdicoding/ui/profile/profile_provider.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:storyappsdicoding/utils/resource_helpers/colors.dart';
import 'package:storyappsdicoding/utils/resource_helpers/fonts.dart';
import 'package:storyappsdicoding/utils/resource_helpers/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final logoutProvider = context.watch<AuthProvider>();
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(AppLocalizations.of(context)!.profileScreen),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
         GoRouter.of(context).pop();
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(
            minHeight: 50,
            maxHeight: 50,
            child: Container(
              color: CustomColors.darkOrange,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(
                  AppLocalizations.of(context)!.detailProfile,
                  style: TextStyle(
                    color: CustomColors.whiteColor,
                    fontFamily: AppLocalizations.of(context)!.helvetica,
                    fontSize: displayWidth(context) * FontSize.s005,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Image.asset(
              'assets/images/profile.png',
              width: 150,
              height: 150,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.nameProfile,
              style: const TextStyle(
                color: CustomColors.orangePeel,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppLocalizations.of(context)!.descriptionProfile,
              maxLines: 10,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: CustomColors.orangePeel),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: 40,
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? CustomColors.jetColor
                    : CustomColors.darkOrange,
              ),
              onPressed: () {
                _launchUrlStart(context, url: Constants.urlLinkedin);
              },
              child: Text(
                AppLocalizations.of(context)!.visitLinkedin,
                style: TextStyle(
                  color: CustomColors.whiteColor,
                  fontFamily: AppLocalizations.of(context)!.helvetica,
                  fontSize: displayWidth(context) * FontSize.s005,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrlStart(BuildContext context, {required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
