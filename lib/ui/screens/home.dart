import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:scan_code/global.dart';
import 'package:scan_code/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _active,
        onItemSelected: (index) => setState(() {
          _active = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.flight_takeoff,
            ),
            title: Text("Passagens"),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text("Perfil"),
          ),
        ],
      ),
      backgroundColor: Color(0xffd8f5f6),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            MyHeader(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Próximas Viagens",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .apply(fontWeightDelta: 2),
                      ),
                      FlatButton.icon(
                        label: Text("All",
                            style: TextStyle(
                                color: Theme.of(context).accentColor)),
                        onPressed: () {},
                        icon: Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).accentColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 9.0),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detalhes'),
                                      child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 21.0, vertical: 31.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 11,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          FlightDetailColumn(
                              textColor: Theme.of(context).accentColor),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.airplanemode_active,
                                    color: Theme.of(context).accentColor),
                                Text(
                                  "7h55min",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle
                                      .apply(
                                          color: Theme.of(context).accentColor),
                                )
                              ],
                            ),
                          ),
                          FlightDetailColumn(
                              textColor: Theme.of(context).accentColor),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Locais Desejados",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .apply(fontWeightDelta: 2),
                  ),
                  SizedBox(height: 9.0),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularList.length,
                      itemBuilder: (ctx, i) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(context, 'details'),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                            padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("${popularList[i]['img']}"),
                              ),
                            ),
                            child: Text(
                              "${popularList[i]['title']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
