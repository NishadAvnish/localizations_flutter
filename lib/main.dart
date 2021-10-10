import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/all_locales.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'locale_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),

            supportedLocales: AllLocales.all,
            locale: Provider.of<LocaleProvider>(context)
                .locale, // if its null it will equal to first locale of supportedLocales
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).language),
        actions: [
          PopupMenuButton<Locale>(
            onSelected: (value) {
              Provider.of<LocaleProvider>(context, listen: false)
                  .setLocale(value);
            },
            itemBuilder: (BuildContext context) {
              return AllLocales.all.map((Locale choice) {
                return PopupMenuItem<Locale>(
                  value: choice,
                  child: Text(choice.countryCode),
                );
              }).toList();
            },
            child: Icon(Icons.language),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).frieghtInRs + "50",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              AppLocalizations.of(context).gst("5") + "10",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "${AppLocalizations.of(context).total}: 60",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
