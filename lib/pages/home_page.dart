import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const HomePage({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: onToggleTheme, // Call toggle function
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Widgets'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.widgetsPage),
          ),
          ListTile(
            title: Text('UI Components'),
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.uiComponentsPage),
          ),
          ListTile(
            title: Text('Users'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.userPageList),
          ),
          ListTile(
            title: Text('CRUD Example'),
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.crudExamplePage),
          ),
        ],
      ),
    );
  }
}
