import 'package:afarinick_forms/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../harvest/harvest_homepage.dart';
import '../nursery/nursery_homepage.dart';
import '../propagation/Propagation_homepage.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final String title;
  final Function onPressed;

  const RoundedButton(
      {super.key,
      required this.title,
      required this.colour,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(12.0),
        child: MaterialButton(
          onPressed: onPressed(),
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

Drawer buildDrawer(BuildContext context) {
  IconData themeIcon = Icons.man;
  return Drawer(
    child: Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(0.0),
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.grey.shade500, width: .2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Staff Name',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 200),
                    curve: Curves.linear,
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 20,
                        child: Icon(
                          themeIcon,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const NurseryHomePage()));
                },
                child: const Row(
                  children: [
                    Icon(Icons.fire_truck),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Nursery',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'ProductSans'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const PropagationHomepage()));
                },
                child: const Row(
                  children: [
                    Icon(Icons.forest_rounded),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Propagation',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'ProductSans'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HarvestingHomePage()));
                },
                child: const Row(
                  children: [
                    Icon(Icons.fire_truck),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Harvesting',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'ProductSans'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove('email');
                  pref.remove('password');
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'ProductSans'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class Appbar extends StatelessWidget {
  final VoidCallback onPressed;

  const Appbar({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.onPressed,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Icon(
                  Icons.menu,
                  color: Colors.green,
                ),
              ),
              onTap: () => _scaffoldKey.currentState!.openDrawer(),
            ),
            const Spacer(),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: TextButton.icon(
                  onPressed: onPressed,
                  icon: const Icon(Icons.upload_rounded),
                  label: const Text('UPLOAD'),
                )),
          ],
        ),
      ),
    );
  }
}
