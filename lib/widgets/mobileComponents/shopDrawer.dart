import 'package:flutter/material.dart';
import 'package:flutterweb/Values/StringApp.dart';
import 'package:flutterweb/values/responsive.dart';

class ShopDrawer extends StatefulWidget {
  // const ShopDrawer({
  //   required Key key,
  // }) : super(key: key);

  @override
  _ShopDrawerState createState() => _ShopDrawerState();
}

class _ShopDrawerState extends State<ShopDrawer> {
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    return SizedBox(
      width:responsiveApp.drawerWidth,
      child: Drawer(
        child:Container(
            color: Theme.of(context).backgroundColor,
            child:  Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(nameStr,style:Theme.of(context).textTheme.headline6),
                  accountEmail: Text(emailDefaultStr),
                  decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
                  currentAccountPicture: const CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png')),
                ),
                getItem(
                  onTap: () {},
                  title: aboutUsStr,
                  icon: Icons.article_outlined,
                ),
                getItem(
                  onTap: () {},
                  title:locationStr,
                  icon:Icons.location_on_outlined,
                ),
                getItem(
                  onTap: () {},
                  title: loginStr,
                  icon: Icons.lock_outline,
                ),
                Expanded(
                    child: Padding(padding:responsiveApp.edgeInsetsApp.allMediumEdgeInsets,child:Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        copyrightStr,
                        style:Theme.of(context).accentTextTheme.bodyText2,
                      ),
                    ),
                    ))
              ],
            )),
      ),
    );
  }

  getItem({String? title, IconData? icon, onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
          title!,
          style:Theme.of(context).textTheme.bodyText2
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}