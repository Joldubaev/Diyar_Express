import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary[100],
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                context.router.maybePop();
              }),
          title: TextButton.icon(
              label: Text(context.l10n.contact, style: theme.textTheme.titleSmall!.copyWith(color: AppColors.primary)),
              icon: const Icon(FontAwesomeIcons.headset, color: AppColors.black1, size: 40),
              onPressed: () {})),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                      title: Text(context.l10n.adress,
                          style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.primary)),
                      subtitle: Text(context.l10n.adressD,
                          style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.black1))),
                  ListTile(
                      title: Text(context.l10n.timeToWork,
                          style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.primary)),
                      subtitle: Text(context.l10n.time,
                          style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.black1))),
                ],
              ),
            ),
            const Expanded(child: ContactBody()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      AppLaunch.launchURL(AppConst.instagram,
                          context: context, snackBarText: context.l10n.someThingIsWrong);
                    },
                    icon: const Icon(FontAwesomeIcons.instagram, color: AppColors.black1, size: 40)),
                const SizedBox(width: 40),
                IconButton(
                    onPressed: () {
                      AppLaunch.sendEmail(AppConst.email,
                          context: context, snackBarText: context.l10n.someThingIsWrong);
                    },
                    icon: const Icon(Icons.mail, color: AppColors.black1, size: 40)),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class ContactBody extends StatefulWidget {
  const ContactBody({super.key});
  @override
  State<ContactBody> createState() => _ContactBodyState();
}

class _ContactBodyState extends State<ContactBody> {
  bool _hasCallSupport = false;

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ContactType.values.length,
      itemBuilder: (context, index) {
        final contactType = ContactType.values[index];
        return ContactCardWidget(
            subtitle: contactType.getTitle(context),
            imagePath: contactType.getAsset,
            title: contactType.getNumber(),
            onPressed: _hasCallSupport ? () => _makePhoneCall(contactType.getNumber()) : () {});
      },
    );
  }
}
