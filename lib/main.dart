// Import Flutter's material design widget library
import 'package:flutter/material.dart';

// The starting point of your entire Flutter app
void main() {
  runApp(const MyApp());
}

// MyApp: The root widget that sets up the app theme and structure
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true, // Shows the small "DEBUG" banner at top right
      home: ProfilePage(),             // Sets the default starting screen
    );
  }
}

// ProfilePage: The main screen displaying the profile content
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The background color of the entire screen
      backgroundColor: const Color.fromARGB(255, 209, 249, 246),

      // Top app bar section
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 145, 250),
        elevation: 0, // Removes the drop shadow below the app bar
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87), // Hamburger menu icon
          onPressed: () {},                                    // Action when button is tapped
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // SingleChildScrollView allows the page to scroll if content overflows on smaller screens
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30), // Empty space from the top app bar

            // --- 1. PROFILE PICTURE ---
            const CircleAvatar(
              radius: 90,                                         // Controls the circle's size
              backgroundColor: Color.fromARGB(255, 231, 255, 229), // Fallback color while loading
              backgroundImage: AssetImage('assets/son.jpg'),      // Image loaded from local assets
            ),

            const SizedBox(height: 16), // Space between picture and username

            // --- 2. USERNAME TEXT ---
            const Text(
              'Chris is the Goat',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 10), // Space between username and badge

            // --- 3. STUDENT BADGE ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // Inner padding
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20), // Rounds the edges like a pill
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Hugs only the content width
                children: [
                  Text('🎓', style: TextStyle(fontSize: 14)), // Emoji icon
                  SizedBox(width: 6),                         // Gap between emoji and text
                  Text(
                    'Student',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40), // Space before the cards row

            // --- 4. HORIZONTAL ROW OF STAT CARDS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding on left and right screen edges
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centers cards horizontally
                children: [
                  // Yellow Card
                  _buildStatCard(
                    color: const Color(0xFFEFE83B),
                    percentage: '1000%',
                    title: 'Miguel',
                    imagePath: 'assets/miguel.jpg',
                  ),
                  const SizedBox(width: 40), // Horizontal space between card 1 and 2

                  // Cyan Card
                  _buildStatCard(
                    color: const Color(0xFF53D3F1),
                    percentage: '2121%',
                    title: 'Burger King',
                    imagePath: 'assets/burger.jpg',
                  ),
                  const SizedBox(width: 40), // Horizontal space between card 2 and 3

                  // Pink Card
                  _buildStatCard(
                    color: const Color(0xFFF05D75),
                    percentage: '6767%',
                    title: 'Tuff',
                    imagePath: 'assets/tuff.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- REUSABLE HELPER WIDGET FOR CARDS ---
  // Generates a card container given a color, percentage, label, and asset path
  Widget _buildStatCard({
    required Color color,
    required String percentage,
    required String title,
    required String imagePath,
  }) {
    return Container(
      width: 120,  // Fixed width of the card
      height: 150, // Fixed height of the card
      padding: const EdgeInsets.all(10), // Inner spacing around content
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4), // Slightly rounded box corners
        boxShadow: [
          // Soft subtle shadow beneath each card
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,       // Aligns items to the middle
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes top image and bottom text apart
        children: [
          // Thumbnail picture inside the card
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: AssetImage(imagePath), // Loads the passed asset image
                fit: BoxFit.cover,            // Crops/fills the square container neatly
              ),
            ),
          ),

          // Percentage & Title text column
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                percentage,
                textAlign: TextAlign.center, // Centers the percentage text
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2), // Tiny gap between percentage and title
              Text(
                title,
                textAlign: TextAlign.center, // Centers the title text
                maxLines: 1,                          // Keeps text on one line
                overflow: TextOverflow.ellipsis,      // Adds "..." if text is too long
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}










/*import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

*/