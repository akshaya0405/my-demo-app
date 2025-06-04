import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UIComponentsPage extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const UIComponentsPage({Key? key, required this.onToggleTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Components'),
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
            title: Text('Carousel Slider'),
            onTap: () => _navigateTo(context, CarExample()),
          ),
          ListTile(
            title: Text('Staggered Grid View Example'),
            onTap: () => _navigateTo(context, StaggeredGridExample()),
          ),
          ListTile(
            title: Text('Progress Indicators Example'),
            onTap: () => _navigateTo(context, ProgressIndicatorsExample()),
          ),
          ListTile(
            title: Text('Alert Dialog Example'),
            onTap: () => _navigateTo(context, AlertDialogExample()),
          ),
          ListTile(
            title: Text('Dialogs Example'),
            onTap: () => _navigateTo(context, DialogsExample()),
          ),
          ListTile(
            title: Text('Icon Class Example'),
            onTap: () => _navigateTo(context, IconClassExample()),
          ),
          ListTile(
            title: Text('Expanded Class Example'),
            onTap: () => _navigateTo(context, ExpandedClassExample()),
          ),
          ListTile(
            title: Text('Analog Clock Example'),
            onTap: () => _navigateTo(context, AnalogClockExample()),
          ),
          ListTile(
            title: Text('Video Handling Example'),
            onTap: () => _navigateTo(context, VideoPlayerExample()),
          ),
          ListTile(
            title: Text('Expansion Tile Card Example'),
            onTap: () => _navigateTo(context, ExpansionTileCardExample()),
          ),
          ListTile(
            title: Text('Tabs Example'),
            onTap: () => _navigateTo(context, TabsExample()),
          ),
          ListTile(
            title: Text('Horizontal List Example'),
            onTap: () => _navigateTo(context, HorizontalListExample()),
          ),
          ListTile(
            title: Text('Charts Example'),
            onTap: () => _navigateTo(context, ChartsExample()),
          ),
          ListTile(
            title: Text('Convex Bottom Bar Example'),
            onTap: () => _navigateTo(context, ConvexBottomBarExample()),
          ),
          // ListTile(
          //   title: Text('Slidable Example'),
          //   onTap: () => _navigateTo(context, SlidableExample()),
          // ),
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

class CarExample extends StatelessWidget {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList.map((imageUrl) {
        return Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(imageUrl), // Use NetworkImage for URLs
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(), // Convert List<String> to List<Widget>
      options: CarouselOptions(
        height: 400,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {
          // print(
          //     'Page changed to $index, reason: $reason'); // Define the callback function
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

// Example: Staggered Grid View
class StaggeredGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Staggered Grid View Example')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Center(child: Text('Example 0')),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Center(child: Text('Example 1')),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Center(child: Text('Example 2')),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Center(child: Text('Example 3')),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: Center(child: Text('Example 4')),
            ),
          ],
        ),
      ),
    );
  }
}

// Example: Progress Indicators
class ProgressIndicatorsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Indicators Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

// Example: Alert Dialog
class AlertDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Dialog Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Alert!'),
                  content: Text('This is an alert dialog example.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Show Alert Dialog'),
        ),
      ),
    );
  }
}

// Example: Dialogs
class DialogsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dialogs Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: Text('Simple Dialog'),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Option 1'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Option 2'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Show Simple Dialog'),
        ),
      ),
    );
  }
}

// Example: Icon Class
class IconClassExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icon Class Example')),
      body: Center(
        child: Icon(Icons.star, size: 50, color: Colors.yellow),
      ),
    );
  }
}

// Example: Expanded Class
class ExpandedClassExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded Class Example')),
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.blue, height: 100)),
          Expanded(child: Container(color: Colors.red, height: 100)),
        ],
      ),
    );
  }
}

// Example: Analog Clock
class AnalogClockExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Analog Clock Example')),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Text(
              'Analog Clock',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}

// Example: Video Player
class VideoPlayerExample extends StatefulWidget {
  @override
  _VideoPlayerExampleState createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerExample> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player Example')),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// Example: Expansion Tile Card
class ExpansionTileCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expansion Tile Card Example')),
      body: Center(
        child: ExpansionTile(
          title: Text('Click to Expand'),
          children: [
            ListTile(title: Text('Expanded Content')),
          ],
        ),
      ),
    );
  }
}

// Example: Tabs
class TabsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tabs Example')),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Tab 1 Content')),
                  Center(child: Text('Tab 2 Content')),
                  Center(child: Text('Tab 3 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example: Horizontal List
class HorizontalListExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal List Example')),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(color: Colors.blue, width: 150, height: 100),
          Container(color: Colors.red, width: 150, height: 100),
          Container(color: Colors.green, width: 150, height: 100),
        ],
      ),
    );
  }
}

// Example: Charts (This would need a charting package like charts_flutter)
class ChartsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Charts Example')),
      body: Center(
        child: Text('Charts Example Placeholder'),
      ),
    );
  }
}

// Example: Convex Bottom Bar
class ConvexBottomBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Convex Bottom Bar Example')),
      body: Center(child: Text('Convex Bottom Bar')),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }
}
