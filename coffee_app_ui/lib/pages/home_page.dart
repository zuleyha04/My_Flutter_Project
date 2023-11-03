import 'package:coffee_app_ui/util/coffee_tile.dart';
import 'package:coffee_app_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    //[coffee type , isSelected ]
    ['Cappucino ', true],
    ['Latte ', false],
    ['Cappucino', false],
    ['Tea', false],
  ];

  //user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      // this for loop makes every selection false
      for(int i=0; i<coffeeType.length;i++){
        coffeeType[i][1]=false;
      }
      coffeeType[index][1]=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0, //kapladığı mesafe
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              ' Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          //search bar
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), //searc butonunun içindeki ıcon
                  hintText: 'Find your coffee..', //altta soluk gözüken yazı
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  //enableborder aktifken çeeçevenin özelliklerini çizer
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey
                            .shade600), //çerçevenin kenar özelliklerini gösterir
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 25.0,
          ),

          //horizontal listview of coffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length, //listenin kaç öğe içereceğini belirler.
                itemBuilder: (context, index) {//her bir liste öğesinin nasıl oluşturulacağını belirler.
                  return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    },
                  );
                }),
          ),

          //horizontal listview of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(coffeeImagePath: 'images/pexels-yeni.jpg',
                coffeeName: 'Cappucino',
                  coffeePrice: '4.20',
                ),
                CoffeeTile(coffeeImagePath: 'images/pexels-chevanon-photography-312418.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.50',
                ),
                CoffeeTile(coffeeImagePath: 'images/pexels-yeni3.jpg',
                  coffeeName: 'Turkish Coffee',
                  coffeePrice: '5.30',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
