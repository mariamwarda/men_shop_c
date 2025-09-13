import 'package:flutter/material.dart';
import 'package:menshop/helpers/logout.dart';
import 'package:flutter/material.dart';
import '../../helpers/colors.dart';
import '../../helpers/text_style.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffoldBackGroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text("Account", style: AppTextStyles.kHeadTextStyle32),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _AccountItem(icon: Icons.inventory_2_outlined, title: "My Orders"),
                _AccountItem(icon: Icons.person_outline, title: "My Details"),
                _AccountItem(icon: Icons.location_on_outlined, title: "Address Book"),
                _AccountItem(icon: Icons.help_outline, title: "FAQs"),
                _AccountItem(icon: Icons.headset_mic_outlined, title: "Help Center"),
              ],
            ),
          ),

          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                // TODO: add logout action
              },
              child: Row(
                children: [
                  Icon(Icons.logout_sharp, color: AppColors.red),
                  const SizedBox(width: 8),
                  const Text("Logout", style: AppTextStyles.logout),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountItem(String iconPath, String title) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(iconPath, width: 24, height: 24, color: AppColors.black),
          title: Text(title, style: AppTextStyles.kTextStyle16MediumBlack),
          trailing: const Icon(Icons.chevron_right, color: AppColors.greyColor),
          onTap: () {
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}
class _AccountItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _AccountItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.black),
          title: Text(title, style: AppTextStyles.kTextStyle16MediumBlack),
          trailing: const Icon(Icons.chevron_right, color: AppColors.greyColor),
          onTap: () {
            // TODO: handle navigation
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}