
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> Images = [
    'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg',
    'https://i.natgeofe.com/k/ad9b542e-c4a0-4d0b-9147-da17121b4c98/MOmeow1_square.png',
    'https://images.squarespace-cdn.com/content/v1/5ac696982714e5ccacc1f762/baa1a359-ced7-43d5-85ea-d0f33e347d43/Swan.png',
    'https://i2-prod.liverpoolecho.co.uk/incoming/article26829395.ece/ALTERNATES/s1200c/1_County-Cat-Rescue-and-Sanctuary-in-Walton-Photo-by-Colin-Lane.jpg',
    'https://static01.nyt.com/images/2021/09/14/science/07CAT-STRIPES/07CAT-STRIPES-mediumSquareAt3X-v2.jpg',
    'https://img.freepik.com/premium-psd/cat-with-blue-eyes-sits-white-transparent-background_540808-60.jpg?w=2000'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Photo Gallery"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("Well Come To My Photo Gallery!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Search For Photo...",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black45
                    )
                ),
              ),
              SizedBox(height: 10,),

              GridView.builder(
                shrinkWrap: true,
                  itemCount: Images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Center(child: Text("A Cute Cat Image"))),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network('${Images[index]}',width: 90,),
                          Text('Image $index',style: TextStyle(fontWeight: FontWeight.bold,),),

                        ],
                      ),
                    );
                  }),
              SizedBox(height: 5,),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network("https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg",width: 40,)),
                    title: Text("Photo 1"),
                    subtitle: Text("Description For Photo 1"),

                  ),
                  ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network("https://i.natgeofe.com/k/ad9b542e-c4a0-4d0b-9147-da17121b4c98/MOmeow1_square.png",width:40,)),
                    title: Text("Photo 2"),
                    subtitle: Text("Description For Photo 2"),

                  ),
                  ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network("https://images.squarespace-cdn.com/content/v1/5ac696982714e5ccacc1f762/baa1a359-ced7-43d5-85ea-d0f33e347d43/Swan.png",width: 40,)),
                    title: Text("Photo 3"),
                    subtitle: Text("Description For Photo 3"),

                  ),
                ],
              ),

              Center(
                child: CircleAvatar(
                  child: IconButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Center(child: Text("Photos Uploaded Sucessfully!"))),
                        );
                      },
                      icon: Icon(Icons.upload)
                  ),
                ),
              ),
              SizedBox(height: 45,)

            ],
          ),
        ),
      ),
    );
  }
}

