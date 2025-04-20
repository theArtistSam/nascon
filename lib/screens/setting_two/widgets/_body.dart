part of '../setting_two.dart';

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(title: 'Settings', isBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 80),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tap tp upload new image',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const Text(
                'name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              AppTextfield(
                hintText: 'Tien Tom',
                controller: TextEditingController(),
              ),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              AppTextfield(
                hintText: 'TienTom@gmail.com',
                controller: TextEditingController(),
              ),
              const Text(
                'Phone number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              AppTextfield(
                hintText: '0300-000000',
                controller: TextEditingController(),
              ),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              AppTextfield(
                hintText: 'Change Password',
                controller: TextEditingController(),
              ),
              TextButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
