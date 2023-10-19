import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser!;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 5, 88, 106),
                child: Text('D', style: TextStyle(color: Colors.white)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    user.email!,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:const Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.person_crop_circle_fill,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color.fromARGB(200, 5, 88, 106),
                    ),
                    title: 'Edit your profile',
                  ),
                  SettingsItem(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context,'/clinics');
                      });
                    },
                    icons:
                    //CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                    Icons.health_and_safety_outlined,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color.fromARGB(200, 5, 88, 106),
                    ),
                    title: 'Clinics',
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.fingerprint,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color.fromARGB(200, 5, 88, 106),
                    ),
                    title: 'Contact us',
                  ),
                  SettingsItem(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, '/createPassword');
                      });
                    },
                    icons: Icons.lock_outline_sharp,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color.fromARGB(200, 5, 88, 106),
                    ),
                    title: 'Change password',
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color.fromARGB(200, 5, 88, 106),
                    ),
                    title: 'Dark mode',
                    subtitle: "Automatic",
                    trailing: Switch.adaptive(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Color.fromARGB(200, 5, 88, 106),
                    ),
                    title: 'About',
                    subtitle: "Learn more about SkinScan",
                  ),
                ],
              ),

              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "Account",
                items: [
                  SettingsItem(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                          Navigator.of(context).popUntil((route) => route.settings.name == '/login');

                    },
                    icons: Icons.exit_to_app_rounded,
                    title: "Sign Out",
                  ),
                  
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.delete_solid,
                    title: "Delete account",
                    titleStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

