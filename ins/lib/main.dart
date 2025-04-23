import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final stories = ['Your story', 'Yu Ting', 'Ivlyn', 'Xin Hui', 'Siew Zhen', 'Abu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          color: Colors.white,
          height: 32,
        ),
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
          Image.asset(
            'assets/messenger.png',
            height: 24,
            width: 24,
            color: Colors.white,
          ),
          SizedBox(width: 16),
        ],
      ),

      body: ListView(
        children: [
          // Stories
          Container(
            height: 150, // Height for the stories section
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 90, // Adjust width for consistent size
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/border.png',
                            width: 100, 
                            height: 100, 
                            fit: BoxFit.cover,
                          ),
                          CircleAvatar(
                            radius: 35, // Fixed radius for the circle avatar
                            backgroundImage: AssetImage('assets/user_placeholder.png'),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        stories[index],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: index == 0 ? Colors.grey : Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),

          // Suggested
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Suggested for you', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Older posts', style: TextStyle(color: const Color.fromARGB(255, 91, 57, 240), fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Post Card
          PostCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: ''),
          BottomNavigationBarItem(icon: CircleAvatar(radius: 12, backgroundImage: AssetImage('assets/user_placeholder.png')), label: ''),
        ],
      ),
    );
  }
}


class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage('assets/user_placeholder.png')),
          title: Text('yunxi', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Mount Kinabalu'),
          trailing: Icon(Icons.more_vert),
        ),
        Image.asset('assets/post_placeholder.png', fit: BoxFit.cover),
        Padding(
  padding: const EdgeInsets.all(12.0),
  child: Row(
    children: [
      Row(
        children: [
          Icon(Icons.favorite_border),
          SizedBox(width: 4),
          Text('123', style: TextStyle(fontSize: 14)),
        ],
      ),
      SizedBox(width: 12),
      Row(
        children: [
          Icon(Icons.comment),
          SizedBox(width: 4),
          Text('1', style: TextStyle(fontSize: 14)),
        ],
      ),
      SizedBox(width: 12),
      Row(
        children: [
          Icon(Icons.send),
          SizedBox(width: 4),
          Text('2', style: TextStyle(fontSize: 14)),
        ],
      ),
      Spacer(),
      Icon(Icons.bookmark_border),
    ],
  ),
)

      ],
    );
  }
}
