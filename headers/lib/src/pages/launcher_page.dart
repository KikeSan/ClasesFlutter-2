import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/routes/routes.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return ListView.separated(
      physics: BouncingScrollPhysics(),
        separatorBuilder: (context, i)=>Divider(
          color: Colors.blue,
        ),
        itemCount: pageRoutes.length,
        itemBuilder: (context,i)=>ListTile(
          leading: FaIcon(pageRoutes[i].icon, color: Colors.blue,),
          title: Text(pageRoutes[i].titulo),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>pageRoutes[i].page));
          },
        ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('KS', style: TextStyle(fontSize: 50)),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),

            ListTile(
              tileColor: Colors.grey[200],
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: Colors.blue,
                onChanged: (value) => appTheme.darkTheme = value
              ),
            ),

            SafeArea(
              bottom: true,
              top: false, left: false, right: false,
              child: ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(Icons.add_to_home_screen, color: Colors.blue,),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) => appTheme.customTheme = value
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}