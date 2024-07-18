import 'package:clothes_store_mobile_app/app/cubits/language/language_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/language/language_state.dart';
import 'package:clothes_store_mobile_app/app/cubits/product_by_category/product_by_category_cubit.dart';
import 'package:clothes_store_mobile_app/app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/cubits/home/home_cubit.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (_) => ProductByCategoryCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              locale: state.locale,
              initialRoute: AppRoutes.SPASH,
              routes: AppPages.routes,
              supportedLocales: L10n.all,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
              ],
            );
          },
        );
      },
    );
  }
}
