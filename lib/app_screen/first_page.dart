import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import './ezvzjson.dart';

class FirstPage extends StatefulWidget {
  


//  FirstPage.name(this.filter);

  @override
  _FirstPageState createState() => _FirstPageState();

//  FirstPage();
}

class _FirstPageState extends State<FirstPage> {

  List<Datum> widgets = [];
  List<String> items = [];
  String filter;

  @override
  Widget build(BuildContext context) {
    return getFirstView();
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
            padding: EdgeInsets.only(left : 0.0,top:5.0,bottom : 5.0,right : 5.0),
            child: ListTile(
                contentPadding: EdgeInsets.only(left : 15.0),
                subtitle: Text(
                  widgets[position].phone,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                title: Text(
                  widgets[position].name,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: getImage(position)
            )))
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

  _fetchListItem() async {
    String dataURL = "https://ezvz.ofoodesk.com/public/api/getSearchData/a";
    http.Response response = await http.get(dataURL);
    widgets.clear();
    items.clear();
    for (Datum datum in jsonParseFromJson(response.body).data) {
      widgets.add(datum);
      items.add(datum.name);
    }

    return widgets;
  }

  Widget getFirstView(){
    return Container(
        child : FutureBuilder(
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
            })
    );

  }
}
