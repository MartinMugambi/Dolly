import 'package:flutter/material.dart';
import 'package:qwetu/models/option_model.dart';


class MenuOptionsScreen extends StatefulWidget {
  static final String id = "menu_option";
  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Navigation Drawer', style:TextStyle(color: Colors.white,),),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Text(
              'HELP',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => print('HELP'),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Martin Mwenda', style: TextStyle(color: Colors.white),),
                accountEmail: Text('martinmwenda026@gmail.com', style: TextStyle(color: Colors.white),),
                currentAccountPicture: CircleAvatar(
                  child: Text('M'),
                  backgroundColor: Colors.white,

                ),
                ),
                SizedBox(
                height: 10.0,
                ),
                ListTile(
               leading: Icon(Icons.shopping_cart),
               title: Text('My Orders', style: TextStyle(),),
            ),
             SizedBox(
                height: 10.0,
                ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment', style: TextStyle(),),
              onTap: (){
                 
              },
            ),
             SizedBox(
                height: 10.0,
                ),
            ListTile(
             leading: Icon(Icons.share),
             title: Text('Invite Friends'),
            ),
             SizedBox(
                height: 10.0,
                ),
             Divider(),
              SizedBox(
                height: 10.0,
                ),
            ListTile(
             leading: Icon(Icons.card_membership),
             title: Text('Become Helper'),
            ),
               SizedBox(
                height: 10.0,
                ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: (){
                 
              },
            ),
             SizedBox(
                height: 10.0,
                ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: (){
                
                
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: options.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(height: 15.0);
          } else if (index == options.length + 1) {
            return SizedBox(height: 100.0);
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: _selectedOption == index - 1
                  ? Border.all(color: Colors.black26)
                  : null,
            ),
            child: ListTile( 
              leading: options[index - 1].icon,
              title: Text(
                options[index - 1].title,
                style: TextStyle(
                  color: _selectedOption == index - 1
                      ? Colors.black
                      : Colors.grey[600],
                       fontFamily: 'Nunito',
                ),
              ),
              subtitle: Text(
                options[index - 1].subtitle,
                style: TextStyle(
                  color:
                      _selectedOption == index - 1 ? Colors.black : Colors.grey,
                       fontFamily: 'Nunito',
                ),
              ),
              selected: _selectedOption == index - 1,
              
              onTap: () {
                setState(() {
                   
                  
                });
              },
              
            ),
          );
        },
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80.0,
        color: Color(0xFFF3F3F3),
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'SAVE & CONTINUE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                   fontFamily: 'Nunito',
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
