import 'package:cryptobook/services/functions/launch_url.dart';
import 'package:flutter/material.dart';

Widget GitHub({required String username}) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () => launchInBrowser('https://www.github.com/$username'),
    child: Container(
      margin: EdgeInsets.all(5),
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'GitHub',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget Twitter({required String username}) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () => launchInBrowser("https://www.twitter.com/$username"),
    child: Container(
      margin: EdgeInsets.all(5),
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'Twitter',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget Linkedin({required String username}) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () => launchInBrowser('https://www.linkedin.com/in/$username'),
    child: Container(
      width: 100,
      height: 40,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'Linkedln',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget Email({required String address}) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () => launchInBrowser('mailto://$address'),
    child: Container(
      margin: EdgeInsets.all(5),
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'Email',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
