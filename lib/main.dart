import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> steps = [
  'A',
  'Flutter',
  'C',
  'C++',
  'l',
  'happy'
];
List<String> ingredients = [
  'Java',
  'Flutter',
  'C',
  'C++'
];
void main() => runApp(Homepage());

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'menu_app',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const OneMeal(),
    );
  }
}

class OneMeal extends StatelessWidget {
  const OneMeal();

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 320,
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('spaghetti'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                'https://th.bing.com/th/id/R.a53d487d99e076bd5e250b52e9b4fd96?rik=jPl0elHEmuIKow&pid=ImgRaw&r=0',
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredients'),
            _createSectionContainer(
              ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(ingredients[index]),
                      ),
                      color: Colors.white10 //Theme.of(context).accentColor,
                      );
                },
              ),
            ),
            _createSectionTitle(context, 'Steps'),
            _createSectionContainer(
              ListView.builder(
                itemCount: steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(steps[index]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.yellow,
        hoverColor: Colors.red,
      ),
    );
  }
}
