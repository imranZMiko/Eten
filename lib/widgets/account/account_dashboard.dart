import 'package:eten/providers/themeProvider.dart';
import 'package:eten/providers/userDataProvider.dart';
import 'package:eten/widgets/account/account_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDash extends StatefulWidget {
  const AccountDash({Key? key}) : super(key: key);

  @override
  _AccountDashState createState() => _AccountDashState();
}

class _AccountDashState extends State<AccountDash> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (ctx, userDataSnap, child) {
        return Card(
          margin: EdgeInsets.all(0),
          elevation: 2,
          child: Stack(
            children: [
              Container(height: 270),
              Image.asset(
                Provider.of<ThemeInfo>(context).chosenTheme == ThemeMode.light
                    ? userDataSnap.lightTheme
                    : userDataSnap.darkTheme,
                height: 270,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Center(
                child: ProfileImage(),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Container(
                              width:  MediaQuery.of(context).size.width / 2 - 50,
                              child: Text(
                                userDataSnap.username,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          color: Provider.of<ThemeInfo>(context).chosenTheme ==
                                  ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                          height: 50,
                          width: 1,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 50,
                              child: Text(
                                userDataSnap.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
