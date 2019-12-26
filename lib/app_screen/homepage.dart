import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './ezvzjson.dart';
import 'package:provider/provider.dart';
import '../model_provider/theme_provider.dart';

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  Set<Datum> widgets1 = Set<Datum>();
  Set<String> items1 = Set<String>();
  List<Datum> widgets = [];
  List<String> items = [];
  Icon customIcon = Icon(Icons.search);
  Widget cusText = Text("Sample App");
  TextEditingController controller = new TextEditingController();
  String filter;
  ThemeProvider themeProvider;
  AssetImage assetImg = AssetImage('images/dari.jpg');

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
//    Image img = Image(image: assetImg);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getThemeData,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: getAppBar(),
            drawer: new Drawer(child: getDrawer()),
            body: getTabBarView()),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
//            leading: IconButton(
//                  icon: Icon(Icons.menu), onPressed: (){}
//              ),

        actions: <Widget>[
//                InkWell(
//                  onTap: (){
//                    print("Clicked");
//                  },
//                  child: SizedBox(
//                    child: Icon(Icons.search),
//                  ),
//                ),
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
                    this.cusText = Text("Sample App");
                  }
                });
              }),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ], title: cusText, bottom: getTabBar());
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

  Widget getTabBarView() {
    return TabBarView(
      children: [
        FutureBuilder(
            future: _fetchListItem(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: widgets.length,
                        itemBuilder: (BuildContext context, int position) {
                          return getRow(position);
                        }));
              }
            }),
        Icon(Icons.directions_transit),
        Icon(Icons.directions_bike),
      ],
    );
  }

  Widget getRow(int position) {
    return filter == null || filter == ""
        ? new Card(
            elevation: 5.0,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(15.0)),
            child: new Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                  title: Text(
                    items[position],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: getImage(position)),
            ))
        : items[position].contains(filter)
            ? new Card(
                elevation: 5.0,
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(15.0)),
                child: new Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    items[position],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
            : new Container();
  }

  Widget getImage(int i) {
    return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(60, 0, 0, 0),
                      blurRadius: 3.0,
                      offset: Offset(3.0, 3.0))
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${widgets[i].image}')))));
  }

  Widget getDrawerImg() {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Header',
              textAlign: TextAlign.right,
            ),
          ),
          Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(60, 0, 0, 0),
                        blurRadius: 3.0,
                        offset: Offset(3.0, 3.0))
                  ],
                  image: DecorationImage(fit: BoxFit.cover, image: assetImg)))
        ],
      ),
//                ),
    );
  }

  Widget getDrawer() {
    return ListView(
      children: <Widget>[
        getDrawerImg(),
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
          title: new Text('Home'),
          leading: Icon(Icons.home),
          onTap: () {},
        ),
        new ListTile(
          title: new Text('Contact'),
          leading: Icon(Icons.phone),
          onTap: () {},
        ),
        new Divider(
          color: Colors.grey,
        ),
        new ListTile(
          title: new Text('About'),
          leading: Icon(Icons.info),
          onTap: () {},
        ),
      ],
    );
//    );
  }

//  loadData() async {
//    String dataURL = "https://ezvz.ofoodesk.com/public/api/getSearchData/a";
//    http.Response response = await http.get(dataURL);
//    setState(() {
//      for (Datum datum in jsonParseFromJson(response.body).data) {
//        widgets.add(datum);
//        items.add(datum.name);
//      }
//
//      controller.addListener(() {
//        setState(() {
//          filter = controller.text;
//        });
//      });
//    });
//  }

  _fetchListItem() async {
    String dataURL = "https://ezvz.ofoodesk.com/public/api/getSearchData/a";
    http.Response response = await http.get(dataURL);
    widgets.clear();
    items.clear();
    for (Datum datum in jsonParseFromJson(response.body).data) {
      widgets.add(datum);
      items.add(datum.name);
    }
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    return widgets;
  }
}
