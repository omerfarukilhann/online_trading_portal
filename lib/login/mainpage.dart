import 'package:flutter/material.dart';
import 'package:online_trading_portal/providers/cart.dart';
import 'package:online_trading_portal/providers/products.dart';
import 'package:online_trading_portal/screens/cart_screen.dart';
import 'package:online_trading_portal/screens/place_order_screen.dart';
import 'package:online_trading_portal/screens/product_detail_screen.dart';
import 'package:online_trading_portal/screens/product_overview_screen.dart';
import 'package:online_trading_portal/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

void main() => runApp(mainpage());

class mainpage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Swapster',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          cardColor: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple,
            elevation: 0,
          ),
        ),
        home: MyHomePage(
          key: UniqueKey(),
          title: 'Swapster',
        ),

        //register all routes here
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          PlaceOrderScreen.routeName: (context) => PlaceOrderScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

enum PopupValue {
  showFavorite,
  showAll,
}

class Badge extends StatelessWidget {
  const Badge({
    required Key key,
    required this.child,
    required this.value,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color != null ? color : Theme.of(context).canvasColor,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Badge(
            key: UniqueKey(),
            value: cart.itemCount.toString(),
            color: Colors.red, // or provide a default value for color parameter
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (_popupValue) {
              if (_popupValue == PopupValue.showFavorite) {
                productContainer.showFavorite();
              } else {
                productContainer.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Only Favorite"),
                value: PopupValue.showFavorite,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: PopupValue.showAll,
              ),
            ],
          ),
        ],
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ProductOverviewScreen(),
      drawer: DrawerMenu(),
    );
  }
}
