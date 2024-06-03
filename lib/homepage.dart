import 'package:flutter/material.dart';
import 'modelclassfile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int likecolor = -1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "The Devil Works",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Talents',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Explore Opportunities',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 3,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.black,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: cardlist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.645,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  cardlist[index].imagePath,
                                  fit: BoxFit.cover,
                                  height: 222,
                                  width: 194,
                                ),
                                const Positioned(
                                    top: 8,
                                    right: 80,
                                    child: Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                    )),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                      onPressed: () {
                                        if (likecolor == index) {
                                          likecolor = -1;
                                        } else {
                                          likecolor = index;
                                        }
                                        setState(() {});
                                      },
                                      icon: (likecolor == index)
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                          : const Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.white,
                                            )),
                                ),
                                Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/profile.png",
                                          height: 33,
                                          width: 33,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cardlist[index].name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              cardlist[index].role,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.badge),
                                const SizedBox(width: 8),
                                Text(
                                  cardlist[index].company1,
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.circle,
                                  size: 7,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  cardlist[index].company2,
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.school),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  cardlist[index].education,
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 12,
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(245, 78, 68, 1)),
                      onPressed: () {},
                      child: const Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Designers",
                        style: TextStyle(color: Colors.black),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Stylists",
                        style: TextStyle(color: Colors.black),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Models",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chrome_reader_mode_rounded,
              color: Colors.grey,
            ),
            label: 'Read',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.share,
              color: Colors.grey,
            ),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        onTap: _onItemTapped,
      ),
    );
  }
}
