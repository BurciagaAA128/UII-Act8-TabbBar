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
}

//Stateful
class MiPaginaInicial extends StatefulWidget {
  const MiPaginaInicial({Key? key}) : super(key: key);

  @override
  State<MiPaginaInicial> createState() => _MiPaginaInicialState();
}

class _MiPaginaInicialState extends State<MiPaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffaff0ff),
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
          children: <Widget>[
            _StyledImage(
              imageUrl: "assets/burguir.jpg",
              borderRadius: 15.0,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(1),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              size: 200,
            ),
            _StyledImage(
              imageUrl:
                  "https://github.com/BurciagaAA128/Img_IOS/blob/main/cocacola.jpg?raw=true",
              borderRadius: 80,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
              size: 250,
            ),
            _StyledImage(
              imageUrl: "assets/gerent.jpg",
              borderRadius: 200,
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              size: 350,
            ),
            _StyledImage(
              imageUrl:
                  "https://github.com/BurciagaAA128/Img_IOS/blob/main/persona2.jpg?raw=true",
              borderRadius: 20.0,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
              size: 280,
            ),
          ],
        ),
      ),
    );
  }
}

class _StyledImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final List<BoxShadow> boxShadow;
  final double size;

  const _StyledImage({
    required this.imageUrl,
    required this.borderRadius,
    required this.boxShadow,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size,
            height: size,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
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
