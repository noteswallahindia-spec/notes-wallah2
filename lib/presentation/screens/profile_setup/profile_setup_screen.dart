import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../home/home_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  final String studentName;
  const ProfileSetupScreen({Key? key, required this.studentName}) : super(key: key);

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String selectedClass = 'Class 10';

  final List<String> classes = [
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
    'Class 11',
    'Class 12',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Profile Setup')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, ${widget.studentName}! 👋',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Select your class to personalize your study material.',
                style: TextStyle(fontSize: 14, color: AppConstants.textSecondary),
              ),
              const SizedBox(height: 32),
              const Text(
                'Choose Your Class:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.2,
                  ),
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    final itemClass = classes[index];
                    final isSelected = selectedClass == itemClass;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedClass = itemClass;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? AppConstants.primaryColor : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? AppConstants.primaryColor : Colors.grey.shade300,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          itemClass,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : AppConstants.textPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        studentName: widget.studentName,
                        selectedClass: selectedClass,
                      ),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('CONTINUE TO HOME'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
