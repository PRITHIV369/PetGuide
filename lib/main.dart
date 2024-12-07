import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Guide App',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black87, fontSize: 16),
          bodyText2: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to AboutPage after 4 seconds
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => AboutPage())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.greenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.pets, color: Colors.white, size: 80),
              SizedBox(height: 20),
              Text(
                "Pet Guide",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.greenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Icon and Title with Shadow
              Icon(
                Icons.pets,
                color: Colors.white,
                size: 120,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              SizedBox(height: 40),
              // Animated Text Title
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(seconds: 2),
                child: Text(
                  "Welcome to Pet Guide",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(2, 2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              // Description Card with Border Radius and Shadow
              Card(
                color: Colors.white.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Pet Guide helps you find detailed information about various pets, "
                        "from common household animals to exotic species. Get all the tips and tricks "
                        "to take care of your pets with ease.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Animated "Next" Button with Glow Effect
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 15,
                      offset: Offset(0, 4),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.teal],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PetHomePage()),
                          (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0, // Remove default elevation
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PetHomePage extends StatefulWidget {
  @override
  _PetHomePageState createState() => _PetHomePageState();
}

class _PetHomePageState extends State<PetHomePage> {
  final List<Map<String, dynamic>> pets = [
    {
      'name': 'Hamster',
      'image': 'https://smallpetselect.com/wp-content/uploads/2020/10/shutterstock_102645029.jpg',
      'medications': 'Hamsters rarely need medicine; for breathing issues, see a vet for antibiotics.',
      'food': 'Feed a mix of seeds, grains, and veggies; avoid sugary fruits.',
      'bathing': 'Hamsters groom themselves but enjoy sand baths.',
      'details': 'Small, nocturnal pets best kept alone. Need a spacious cage with tunnels.',
      'lifespan': '2-3 years',
      'veterinarian type': 'Exotic pet vet',
      'environment suitable': 'Indoor, in a ventilated cage with bedding.',
      'activity level': 'High during the night, low during the day',
      'habitat': 'Cage with bedding, tunnels, and a wheel for exercise',
      'care level': 'Beginner',
      'common health issues': 'Respiratory infections, dental issues'
    },
    {
      'name': 'Rabbit',
      'image': 'https://st.depositphotos.com/1821481/2830/i/950/depositphotos_28301569-stock-photo-grey-rabbit-on-a-white.jpg',
      'medications': 'Rabbits may need deworming and antibiotics for infections.',
      'food': 'Mainly hay, with leafy greens and a few pellets; avoid iceberg lettuce.',
      'bathing': 'Rabbits rarely need baths; spot clean with a damp cloth.',
      'details': 'Social animals; enjoy company and need space with chew toys.',
      'lifespan': '8-12 years',
      'veterinarian type': 'Exotic pet vet',
      'environment suitable': 'Indoor or outdoor, with a safe area for exercise.',
      'activity level': 'High',
      'habitat': 'Large enclosure or hutch with soft bedding and toys',
      'care level': 'Intermediate',
      'common health issues': 'Dental problems, gastrointestinal stasis'
    },
    {
      'name': 'Macaw',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvUC-J923CqsOdLl6pXONDoVMkE2WC03SXWg&s',
      'medications': 'May need calcium supplements and regular vet visits.',
      'food': 'Seeds, nuts, fruits, and veggies; avoid chocolate and avocado.',
      'bathing': 'Enjoy mist baths or a shallow dish for bathing.',
      'details': 'Smart birds with bright feathers; need daily interaction and mental stimulation.',
      'lifespan': '50-60 years',
      'veterinarian type': 'Avian vet',
      'environment suitable': 'Indoor in a large cage with toys and interaction.',
      'activity level': 'Very high; needs mental stimulation',
      'habitat': 'Large cage or aviary with plenty of space to move and play',
      'care level': 'Advanced',
      'common health issues': 'Vitamin deficiency, feather plucking'
    },
    {
      'name': 'Python',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH-jFXCsaoxlHNnuAddxQBC9q3GfYGfQVRow&s',
      'medications': 'May need treatment for mites or worms.',
      'food': 'Eats small mammals like mice; size depends on age.',
      'bathing': 'Can soak in shallow water to help shed skin.',
      'details': 'Non-venomous snake; needs a heated, secure cage and should not be overfed.',
      'lifespan': '20-30 years',
      'veterinarian type': 'Reptile vet',
      'environment suitable': 'Indoor, in a warm, secure cage with hiding spots.',
      'activity level': 'Low to moderate',
      'habitat': 'Terrarium with heat source and hiding spots',
      'care level': 'Intermediate',
      'common health issues': 'Respiratory infections, shedding issues'
    },
    {
      'name': 'Ferret',
      'image': 'https://thumbs.dreamstime.com/b/ferret-standing-hind-legs-isolated-white-background-cute-ferret-standing-its-hind-legs-isolated-white-background-337608537.jpg',
      'medications': 'May need vaccines and monthly flea prevention.',
      'food': 'High-protein food, like raw meat or special ferret food.',
      'bathing': 'Bath every few months; too much bathing causes dry skin.',
      'details': 'Playful pets needing lots of interaction and supervised play.',
      'lifespan': '5-10 years',
      'veterinarian type': 'Exotic pet vet',
      'environment suitable': 'Indoor, in a ventilated cage with playtime outside.',
      'activity level': 'High',
      'habitat': 'Large cage with bedding and toys, and time outside the cage',
      'care level': 'Intermediate',
      'common health issues': 'Adrenal gland disease, dental issues'
    },
    {
      'name': 'Goldfish',
      'image': 'https://static5.depositphotos.com/1000633/415/i/950/depositphotos_4157656-stock-photo-goldfish.jpg',
      'medications': 'May need water treatments for infections.',
      'food': 'Eat flakes, pellets, and some veggies; avoid overfeeding.',
      'bathing': 'Keep water clean and filtered in the tank.',
      'details': 'Hardy fish that need a spacious, filtered aquarium.',
      'lifespan': '10-15 years',
      'veterinarian type': 'Aquatic vet',
      'environment suitable': 'Indoor aquarium with good filtration.',
      'activity level': 'Low to moderate',
      'habitat': 'Large, filtered aquarium with room to swim',
      'care level': 'Beginner',
      'common health issues': 'Swim bladder issues, fin rot'
    },
    {
      'name': 'Pigeon',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeN-MJPWbzLjc974O6Q14t1Fneeqklcp_FjoouItKTcCXiFHr2RpmsFlKsF4UzztZenC0&usqp=CAU',
      'medications': 'May need antibiotics for respiratory issues.',
      'food': 'Seeds, grains, and veggies; avoid salty foods.',
      'bathing': 'Provide a shallow bowl for bathing.',
      'details': 'Social birds that thrive in groups with space to fly.',
      'lifespan': '5-15 years',
      'veterinarian type': 'Avian vet',
      'environment suitable': 'Indoor or outdoor aviary with room to fly.',
      'activity level': 'High',
      'habitat': 'Large aviary with room for flying and perching',
      'care level': 'Intermediate',
      'common health issues': 'Respiratory infections, mites'
    },
    {
      'name': 'Mink',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF7F4OPovPKISurlD_IdSnUe6o_bvRfQm0B8WjTBcrGHv10nGFiIybmaKccg9qtCbcHKA&usqp=CAU',
      'medications': 'May need vaccinations and vet check-ups.',
      'food': 'High-protein diet of raw meat, fish, and eggs.',
      'bathing': 'Don’t need baths but enjoy swimming.',
      'details': 'Energetic and need a large enclosure with climbing spots.',
      'lifespan': '10-12 years',
      'veterinarian type': 'Exotic pet vet',
      'environment suitable': 'Indoor or outdoor with water and climbing space.',
      'activity level': 'Very high',
      'habitat': 'Large enclosure with water for swimming and areas for climbing',
      'care level': 'Advanced',
      'common health issues': 'Respiratory issues, parasites'
    },
    {
      'name': 'Degus',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZD4LQFK5V_oextaoWFEkCL_J97Vi8vLHffA&s',
      'medications': 'May need dental care due to continuous tooth growth.',
      'food': 'High-fiber diet with hay and degu pellets; avoid sugary foods.',
      'bathing': 'Enjoy dust baths to keep fur healthy.',
      'details': 'Social rodents that need space and chewable toys.',
      'lifespan': '6-8 years',
      'veterinarian type': 'Exotic pet vet',
      'environment suitable': 'Indoor, in a large cage with companions and toys.',
      'activity level': 'High',
      'habitat': 'Large cage with chew toys and tunnels',
      'care level': 'Intermediate',
      'common health issues': 'Dental issues, diabetes'
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet Guide',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: PetSearchDelegate(pets));
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.greenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          WelcomeBanner(),
          Expanded(
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return PetCard(
                  pet['name']!,
                  pet['image']!,
                  pet['details']!,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetInfoPage(pet: pet),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.greenAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Pet Guide!',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Discover information about your favorite pets!',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String details;
  final VoidCallback onTap;
  final double height;

  PetCard(this.name, this.imageUrl, this.details, this.onTap, {this.height = 100});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: height,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0), // Optional padding around the image
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    width: 50, // Reduced width for smaller image size
                    height: 50, // Reduced height for smaller image size
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        details,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),),
    );
  }
}


class PetInfoPage extends StatelessWidget {
  final Map<String, dynamic> pet;

  PetInfoPage({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage(pet['image']),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    pet['name'],
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black26,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Everything you need to know about ${pet['name']}!',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Divider(color: Colors.white54, thickness: 1),
                  SizedBox(height: 10),
                  _buildInfoCard(
                    icon: Icons.medical_services,
                    title: 'Medications',
                    subtitle: pet['medications'],
                  ),
                  _buildInfoCard(
                    icon: Icons.fastfood,
                    title: 'Food',
                    subtitle: pet['food'],
                  ),
                  _buildInfoCard(
                    icon: Icons.bathtub,
                    title: 'Bathing Instructions',
                    subtitle: pet['bathing'],
                  ),
                  _buildInfoCard(
                    icon: Icons.accessibility,
                    title: 'Lifespan',
                    subtitle: pet['lifespan'],
                  ),
                  _buildInfoCard(
                    icon: Icons.local_hospital,
                    title: 'Veterinarian Type',
                    subtitle: pet['veterinarian type'],
                  ),
                  _buildInfoCard(
                    icon: Icons.location_on,
                    title: 'Environment Suitable',
                    subtitle: pet['environment suitable'],
                  ),
                  // New info cards added
                  _buildInfoCard(
                    icon: Icons.access_alarm,
                    title: 'Activity Level',
                    subtitle: pet['activity level'],
                  ),
                  _buildInfoCard(
                    icon: Icons.home,
                    title: 'Habitat',
                    subtitle: pet['habitat'],
                  ),
                  _buildInfoCard(
                    icon: Icons.settings,
                    title: 'Care Level',
                    subtitle: pet['care level'],
                  ),
                  _buildInfoCard(
                    icon: Icons.health_and_safety,
                    title: 'Common Health Issues',
                    subtitle: pet['common health issues'],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String subtitle}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 90, // Fixed height for each card
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50, // Fixed width for icon container
              height: 50, // Fixed height for icon container
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.blueAccent),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class PetSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> pets;

  PetSearchDelegate(this.pets);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = pets.where((pet) => pet['name'].toLowerCase().contains(query.toLowerCase())).toList();
    return _buildPetList(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = pets.where((pet) => pet['name'].toLowerCase().contains(query.toLowerCase())).toList();
    return _buildPetList(context, suggestions);
  }

  Widget _buildPetList(BuildContext context, List<Map<String, dynamic>> petList) {
    if (petList.isEmpty) {
      return Center(
        child: Text(
          'No pets found',
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: petList.length,
      itemBuilder: (context, index) {
        final pet = petList[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(pet['image']),
          ),
          title: Text(
            pet['name'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            pet['details'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[600]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetInfoPage(pet: pet),
              ),
            );
          },
        );
      },
    );
  }
}
