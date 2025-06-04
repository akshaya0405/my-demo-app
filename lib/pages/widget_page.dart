import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

class WidgetPage extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const WidgetPage({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Examples'),
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
            title: Text('Container Example'),
            onTap: () => _navigateTo(context, ContainerExample()),
          ),
          ListTile(
            title: Text('BottomNavigationBar Example'),
            onTap: () => _navigateTo(context, BottomNavExample()),
          ),
          ListTile(
            title: Text('Drawer Example'),
            onTap: () => _navigateTo(context, DrawerExample()),
          ),
          ListTile(
            title: Text('Opacity Example'),
            onTap: () => _navigateTo(context, OpacityExample()),
          ),
          ListTile(
            title: Text(
              'RotatedBox Example',
            ),
            onTap: () => _navigateTo(context, RotatedBoxExample()),
          ),
          ListTile(
            title: Text('RichText Example'),
            onTap: () => _navigateTo(context, RichTextExample()),
          ),
          ListTile(
            title: Text('Floating Action Button Example'),
            onTap: () => _navigateTo(context, FloatingActionButtonExample()),
          ),
          ListTile(
            title: Text('Row & Column Example'),
            onTap: () => _navigateTo(context, RowColumnExample()),
          ),
          ListTile(
            title: Text('ClipReact Example'),
            onTap: () => _navigateTo(context, ClipReactExample()),
          ),
          ListTile(
            title: Text('ClipRRect Example'),
            onTap: () => _navigateTo(context, ClipRRectExample()),
          ),
          ListTile(
            title: Text('OctoImage Example'),
            onTap: () => _navigateTo(context, OctoImageExample()),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class ContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container Example')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.blue,
          child: Text('This is a container!',
              style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 24)),
    Text('Search Page', style: TextStyle(fontSize: 24)),
    Text('Profile Page', style: TextStyle(fontSize: 24)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationBar Example')),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DrawerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer Example')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(child: Text('Swipe from the left to see the drawer!')),
    );
  }
}

class OpacityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opacity Example')),
      body: Center(
        child: Opacity(
          opacity: 0.5,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Center(
              child: Text(
                'Half Transparent',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RotatedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RotatedBox Example')),
      body: Center(
        child: RotatedBox(
          quarterTurns: 1,
          child: Text('Rotated Text', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

class RichTextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RichText Example')),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Rich ',
            style: TextStyle(fontSize: 24, color: Colors.blue),
            children: [
              TextSpan(
                  text: 'Text ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: 'Example', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingActionButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Floating Action Button Example')),
      body: Center(child: Text('Press the button below!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class RowColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row & Column Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 10),
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 10),
              Icon(Icons.star, color: Colors.yellow),
            ],
          ),
          SizedBox(height: 20),
          Text('Row and Column Widget Example'),
        ],
      ),
    );
  }
}

class ClipReact extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;

  ClipReact({required this.child, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: child,
    );
  }
}

class ClipReactExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipReact Example')),
      body: Center(
        child: ClipReact(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: Center(
              child: Text(
                'Custom Clipped Box',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClipRRectExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipRRect Example')),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Clipped Box',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OctoImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OctoImage Example')),
      body: Center(
        child: OctoImage(
          image: AssetImage('assets/dummy_logo.png'),
          placeholderBuilder: (context) => CircularProgressIndicator(),
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
