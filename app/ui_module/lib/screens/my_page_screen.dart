import 'package:flutter/material.dart';
import 'package:ui_module/utils/theme.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page', style: AppTextStyles.h3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24.0),
            _buildBalanceInfo(),
            const SizedBox(height: 24.0),
            _buildSectionHeader('Account'),
            _buildMenuItem(Icons.settings, 'Account Settings'),
            _buildMenuItem(Icons.notifications, 'Notifications'),
            _buildMenuItem(Icons.security, 'Security'),
            const SizedBox(height: 24.0),
            _buildSectionHeader('Support'),
            _buildMenuItem(Icons.help_center, 'Help Center'),
            _buildMenuItem(Icons.contact_support, 'Contact Us'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ethan Carter', style: AppTextStyles.h2),
            const SizedBox(height: 4.0),
            Text('ID: 12345678', style: AppTextStyles.bodyM),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceInfo() {
    return Row(
      children: [
        Expanded(
          child: _buildBalanceCard('Current Balance', '100,000'),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: _buildBalanceCard('Estimated Profit', '50,000'),
        ),
      ],
    );
  }

  Widget _buildBalanceCard(String title, String amount) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: AppColors.inputBackground),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(amount, style: AppTextStyles.h1.copyWith(fontSize: 24)),
            const SizedBox(height: 8.0),
            Text(title, style: AppTextStyles.bodyM),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: AppTextStyles.h2.copyWith(fontSize: 18)),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppColors.textPrimary),
        title: Text(title, style: AppTextStyles.bodyL.copyWith(color: AppColors.textPrimary)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
        onTap: () {},
      ),
    );
  }
}