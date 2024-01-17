import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          'Displacing Animation',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: pepole.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailsPage(person: pepole[index]);
                },
              ));
            },
            isThreeLine: true,
            leading: Text(
              pepole[index].emoji,
              style: const TextStyle(fontSize: 30),
            ),
            title: Text(
              pepole[index].name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              '${pepole[index].age}  years old',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({required this.name, required this.age, required this.emoji});
}

const pepole = [
  Person(name: 'Sajad', age: 22, emoji: '🤷‍♂️'),
  Person(name: 'Mahdi', age: 18, emoji: '😂'),
  Person(name: 'Eli', age: 19, emoji: '😎'),
];

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.person});
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text(
          person.emoji,
          style: const TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Text(
              person.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${person.age}  years old',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
