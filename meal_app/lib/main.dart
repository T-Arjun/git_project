import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.purple[200],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[200],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.purple[200],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> cuisines = [
    {"title": "Chinese", "flag": "🇨🇳"},
    {"title": "Japanese", "flag": "🇯🇵"},
    {"title": "Indian", "flag": "🇮🇳"},
    {"title": "Scandinavian", "flag": "🇪🇺"},
    {"title": "Moroccan", "flag": "🇲🇦"},
    {"title": "Mexican", "flag": "🇲🇽"},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Cuisine"),
      ),
      body: _selectedIndex == 0
          ? _buildCuisineGrid()
          : const Center(
              child: Text("Favorite Recipes",
                  style: TextStyle(color: Colors.black, fontSize: 24))),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Cuisine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCuisineGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: cuisines.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeListPage(
                  cuisine: cuisines[index]['title'],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.purple[100],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cuisines[index]['flag'],
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      cuisines[index]['title'],
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RecipeListPage extends StatelessWidget {
  final String cuisine;
  RecipeListPage({super.key, required this.cuisine});

  final Map<String, List<Map<String, dynamic>>> recipes = {
    "Chinese": [
      {
        "id": 1,
        "title": "Kung Pao Chicken",
        "image":
            "https://images.pexels.com/photos/6941010/pexels-photo-6941010.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "30 min",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Cut chicken into small cubes and marinate with soy sauce and cornstarch.",
          "Stir-fry dried red chilies and Sichuan peppercorns in hot oil.",
          "Add chicken and stir-fry until cooked through.",
          "Add diced vegetables and continue stir-frying.",
          "Pour in sauce mixture and stir until thickened.",
          "Toss in roasted peanuts and serve hot with rice."
        ]
      },
      // Add more Chinese recipes...
    ],
    "Japanese": [
      {
        "id": 1,
        "title": "Sushi Rolls",
        "image":
            "https://images.pexels.com/photos/359993/pexels-photo-359993.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Complex",
        "affordability": "Moderate",
        "steps": [
          "Prepare sushi rice and let it cool.",
          "Lay a sheet of nori on a bamboo mat.",
          "Spread rice evenly over the nori, leaving a border at the top.",
          "Add your choice of fillings in a line across the center.",
          "Roll the mat tightly, pressing gently to seal.",
          "Slice the roll into bite-sized pieces and serve with soy sauce and wasabi."
        ]
      },
      // Add more Japanese recipes...
    ],
    "Indian": [
      {
        "id": 1,
        "title": "Butter Chicken",
        "image":
            "https://images.pexels.com/photos/7625056/pexels-photo-7625056.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Marinate chicken in yogurt and spices for at least 2 hours.",
          "Grill or pan-fry the marinated chicken until cooked.",
          "In a separate pan, make a sauce with butter, tomato puree, and cream.",
          "Add the cooked chicken to the sauce and simmer for 10-15 minutes.",
          "Garnish with fresh cilantro and serve with naan bread."
        ]
      },
      // Add more Indian recipes...
    ],
    "Scandinavian": [
      {
        "id": 1,
        "title": "Swedish Meatballs",
        "image":
            "https://images.pexels.com/photos/6941040/pexels-photo-6941040.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "45 min",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Mix ground Chicken and pork with breadcrumbs, milk, and spices.",
          "Form small meatballs and fry until browned.",
          "Make a creamy gravy with Chicken broth and sour cream.",
          "Add meatballs to the gravy and simmer for 10 minutes.",
          "Serve with mashed potatoes and lingonberry jam."
        ]
      },
      // Add more Scandinavian recipes...
    ],
    "Moroccan": [
      {
        "id": 1,
        "title": "Chicken Tagine",
        "image":
            "https://images.pexels.com/photos/7438862/pexels-photo-7438862.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1.5 hrs",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Brown chicken pieces in a tagine or heavy-bottomed pot.",
          "Add onions, garlic, and spices (cumin, coriander, cinnamon).",
          "Pour in chicken broth and add preserved lemons and olives.",
          "Cover and simmer for about an hour until chicken is tender.",
          "Garnish with fresh cilantro and serve with couscous."
        ]
      },
      // Add more Moroccan recipes...
    ],
    "Mexican": [
      {
        "id": 1,
        "title": "Chicken Tacos",
        "image":
            "https://images.pexels.com/photos/4958792/pexels-photo-4958792.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "30 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Brown ground Chicken in a skillet with taco seasoning.",
          "Warm corn tortillas in a dry pan or in the oven.",
          "Prepare toppings: chopped onions, cilantro, and lime wedges.",
          "Assemble tacos by filling tortillas with Chicken and toppings.",
          "Serve immediately with salsa and guacamole on the side."
        ]
      },
      // Add more Mexican recipes...
    ],
  };

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> recipe = recipes[cuisine]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('$cuisine Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipe.length,
        itemBuilder: (ctx, index) {
          final recipeItem = recipe[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(
                    id: recipeItem['id'],
                    cuisine: cuisine,
                    data: recipeItem,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          recipeItem['image'],
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          color: Colors.black54,
                          width: 300,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          child: Text(
                            recipeItem['title'],
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule),
                            const SizedBox(width: 6),
                            Text(recipeItem['duration']),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 6),
                            Text(recipeItem['complexity']),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(width: 6),
                            Text(recipeItem['affordability']),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final int id;
  final String cuisine;
  final dynamic data;

  const RecipeDetailPage({
    super.key,
    required this.id,
    required this.cuisine,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$cuisine Recipe Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                data['title'],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.network(
                data['image'],
                height: 200,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Duration: ${data["duration"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Complexity: ${data["complexity"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Affordability: ${data["affordability"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Steps:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data['steps'].length,
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(data['steps'][index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
