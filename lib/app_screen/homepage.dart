import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/app_screen/first_page.dart';
import './ezvzjson.dart';
import 'package:provider/provider.dart';
import '../model_provider/theme_provider.dart';
import 'fabbutton.dart';
import 'layout.dart';

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> with TickerProviderStateMixin{
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


//  int _lastSelected = 0;

//  void _selectedTab(int index) {
//    setState(() {
//      _lastSelected = index;
//    });
//  }
//
//  void _selectedFab(int index) {
//    setState(() {
//      _lastSelected = index;
//    });
//  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Icon customIcon = Icon(Icons.search);
  Widget cusText = Text("Food Book");
  TextEditingController controller = new TextEditingController();
//  String filter;
  ThemeProvider themeProvider;
  AssetImage assetImg = AssetImage('images/dari.jpg');

  List<Widget> _widgetOptions = <Widget>[
//    getFirstView(),
    new FirstPage(),
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
    Icon(Icons.info),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
//        filter = controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getThemeData,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: getAppBar(),
            bottomNavigationBar: FABBottomAppBar(
              centerItemText: 'Upload',
              color: Colors.grey,
              selectedColor: Colors.blue,
              notchedShape: CircularNotchedRectangle(),
//              currentIndex: _selectedIndex,
              onTabSelected: _onItemTapped,
              items: [
                FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
                FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
                FABBottomAppBarItem(iconData: Icons.person, text: 'Share'),
                FABBottomAppBarItem(iconData: Icons.info_outline, text: 'About Us'),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _buildFab(
                context),
//            drawer: new Drawer(child: getDrawer()),
            body: Center(
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
        ),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
        actions: <Widget>[
          IconButton(
              icon: customIcon,
              onPressed: () {
                setState(() {
                  if (this.customIcon.icon == Icons.search) {
                    this.customIcon = Icon(Icons.cancel);
                    this.cusText = TextField(
                      textInputAction: TextInputAction.go,
                      controller: controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "search in sarasmart"),
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    );
                  } else {
                    this.customIcon = Icon(Icons.search);
                    this.cusText = Text("Food Book");
                  }
                });
              }),
//          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ], title: cusText,
//      bottom: getTabBar(),

    );
  }

  Widget getTabBar() {
    return TabBar(
      tabs: [
        Tab(icon: Icon(Icons.directions_car)),
        Tab(icon: Icon(Icons.directions_transit)),
        Tab(icon: Icon(Icons.directions_bike)),
      ],
    );
  }

//  Widget getTabBarView() {
//
//    return TabBarView(
//      children: [
//        FutureBuilder(
//            future: _fetchListItem(),
//            builder: (context, AsyncSnapshot snapshot) {
//              if (!snapshot.hasData) {
//                return Center(child: CircularProgressIndicator());
//              } else {
//                return Container(
//                    child: ListView.builder(
//                        itemCount: widgets.length,
//                        itemBuilder: (BuildContext context, int position) {
//                          return getRow(position);
//                        }));
//              }
//            }),
//        Icon(Icons.directions_transit),
//        Icon(Icons.directions_bike),
//      ],
//    );
//  }





  Widget getDrawer() {

    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Food Book"),
          accountEmail: Text("info@halfwaiter.com"),
          currentAccountPicture:
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(60, 0, 0, 0),
                        blurRadius: 3.0,
                        offset: Offset(3.0, 3.0))
                  ],
                  image: DecorationImage(fit: BoxFit.cover, image: assetImg)))
        ),
//        getDrawerImg(),
        Container(
          child: Row(
            children: <Widget>[
              Switch(
                value: themeProvider.isLightTheme,
                onChanged: (val) {
                  themeProvider.setThemeData = val;
                },
              ),
            ],
          ),
        ),
        new ListTile(
          title: Align(
    child : Text('Home'),
    alignment: Alignment(-1.2, 0),
    ),

          leading: Icon(Icons.home),
          onTap: () {},
        ),
        new ListTile(
          title: Align(
            child : Text('Contact'),
            alignment: Alignment(-1.2, 0),
          ),
          leading: Icon(Icons.phone),
          onTap: () {},
        ),
        new Divider(
          color: Colors.grey,
        ),
        new ListTile(
          title: Align(
            child : Text('About'),
            alignment: Alignment(-1.2, 0),
          ),
          leading: Icon(Icons.info),
          onTap: () {},
        ),
      ],
    );
//    );
  }



  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
//          child: FabWithIcons(
//            icons: icons,
//            onIconTapped: _selectedFab,
//          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {
          print("Clicked");
        },
        tooltip: 'Upload',
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[500],
        elevation: 2.0,
      ),
    );
  }
}
