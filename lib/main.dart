import 'package:flutter/material.dart';

void main() => runApp(const AppMiTabBar());

class AppMiTabBar extends StatelessWidget {
  const AppMiTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejemplo TabBar Aaron Burciaga",
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MiPaginaInicial(),
    );
  }
} //Fin AppMiTabBar

//Stateful
class MiPaginaInicial extends StatefulWidget {
  const MiPaginaInicial({Key? key}) : super(key: key);

  @override
  State<MiPaginaInicial> createState() => _MiPaginaInicialState();
} //MiPaginaInicial

class _MiPaginaInicialState extends State<MiPaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tabbar Pockets"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Platillos",
                icon: Icon(Icons.lunch_dining),
              ),
              Tab(
                text: "Bebidas",
                icon: Icon(Icons.no_drinks),
              ),
              Tab(
                text: "Gerente",
                icon: Icon(Icons.badge),
              ),
              Tab(
                text: "Clientes",
                icon: Icon(Icons.people),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: const <Widget>[
            _StyledImage(
              imageUrl: "assets/burguir.jpg",
            ),
            _StyledImage(
              imageUrl:
                  "https://github.com/BurciagaAA128/Img_IOS/blob/main/cocacola.jpg?raw=true",
            ),
            _StyledImage(
              imageUrl: "assets/gerent.jpg",
            ),
            _StyledImage(
              imageUrl:
                  "https://github.com/BurciagaAA128/Img_IOS/blob/main/persona2.jpg?raw=true",
            ),
          ],
        ),
      ),
    );
  }
}

class _StyledImage extends StatelessWidget {
  final String imageUrl;
  const _StyledImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 500,
            height: 400,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: imageUrl.startsWith('http')
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
