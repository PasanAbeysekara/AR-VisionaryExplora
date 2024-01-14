import 'package:flutter/material.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';

class AnimatedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/thank_you_image.png', // Replace with your image path
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            'Thanks for buying from us!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
             // primary: Colors.blue, // Change to your desired color
            ),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
