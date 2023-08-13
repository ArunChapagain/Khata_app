import 'package:flutter/material.dart';
import 'package:khata_app/Provider/expenceprovider.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:khata_app/Screen/add_expense_screen.dart';
import 'package:khata_app/Screen/expense_screen.dart';
import 'package:khata_app/Screen/home_screen.dart';
import 'package:khata_app/Screen/load_fund_screen.dart';
import 'package:khata_app/Screen/loaded_statement_screen.dart';
import 'package:khata_app/widget/theme_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  int index = 0;
  List screen = [];
  @override
  void didChangeDependencies() {
    screen = [
      const HomeScreen(),
      const LoadedStatementScreen(),
      const ExpenseStatementScreen()
    ];
    super.didChangeDependencies();
  }

  void handelingBottomBox() async {
    await showModalBottomSheet(
      showDragHandle: true,
      context: context,
      constraints: const BoxConstraints(maxWidth: 640),
      builder: (context) {
        return SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                Icon(Icons.access_time_outlined),
                Icon(Icons.access_time_outlined),
                Icon(Icons.access_time_outlined),
                Icon(Icons.access_time_outlined),
                Icon(Icons.access_time_outlined),
              ],
            ),
          ),
        );
      },
    );
  }

  ThemeData lightTheme = ThemeData(
    colorSchemeSeed: const Color(0xff6750a4),
  );

  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => LoadedFundProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ExpenseProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Khata',
        themeMode: themeMode,

        // theme: ThemeData(
        //     colorSchemeSeed: const Color(0xff6750a4),
        //     useMaterial3: true,
        //     brightness: Brightness.light),

        theme: lightTheme.copyWith(
          useMaterial3: true,
          brightness: Brightness.light,
          // scaffoldBackgroundColor: lightTheme.secondaryHeaderColor,
        ),

        darkTheme: ThemeData(
            colorSchemeSeed: const Color(0xff6750a4),
            useMaterial3: true,
            brightness: Brightness.dark),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Khata App'),
            actions: [
              BrightnessButton(handleBrightnessChange: handleBrightnessChange),
              IconButton(
                onPressed: () {
                  handelingBottomBox();
                },
                icon: const Icon(Icons.more_vert),
              )
            ],
          ),
          body: screen[index],
          bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) {
              setState(() {
                this.index = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: 'Home',
                selectedIcon: Icon(
                  Icons.home,
                  size: 35,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.receipt_long_outlined,
                  size: 30,
                ),
                label: 'Loaded',
                selectedIcon: Icon(
                  Icons.receipt_long,
                  size: 35,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: 30,
                ),
                label: 'Expense',
                selectedIcon: Icon(
                  Icons.calendar_month_sharp,
                  size: 35,
                ),
              ),
            ],
            // selectedIndex:get,
          ),
        ),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          LoadFundScreen.routeName: (ctx) => LoadFundScreen(),
          AddExpenseScreen.routeName: (ctx) =>  AddExpenseScreen(),
        },

        //  HomeScreen(
        //   handleBrightnessChange: handleBrightnessChange,
        // ),
      ),
    );
  }
}
