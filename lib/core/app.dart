import 'package:ecommerce/app/domain/repositories/auth_repository.dart';
import 'package:ecommerce/app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/app/presentation/blocs/cart_bloc/cart_bloc_bloc.dart';
import 'package:ecommerce/app/presentation/blocs/get_product_list_bloc/get_product_list_bloc.dart';
import 'package:ecommerce/app/presentation/ui/views/auth/login_page.dart';
import 'package:ecommerce/app/presentation/ui/views/auth/register_page.dart';
import 'package:ecommerce/app/presentation/ui/views/cart_page.dart';
import 'package:ecommerce/app/presentation/ui/views/product_details_page.dart';
import 'package:ecommerce/app/presentation/ui/views/user_page.dart';
import 'package:ecommerce/core/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../app/presentation/ui/views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductListBloc>(
          create: (context) => GetIt.I.get<GetProductListBloc>()
            ..add(const FetchProductListBySearchBarEvent()),
        ),
        BlocProvider<AuthBloc>(create: (context) => GetIt.I.get<AuthBloc>()),
        BlocProvider<CartBloc>(create: (context) => GetIt.I.get<CartBloc>()),
      ],
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.theme(),
        routes: {
          '/home': (context) => const HomePage(),
          '/product_details': (context) => const ProductDetailsPage(),
          '/usr': (context) => const UserMainPage(),
          '/cart': (context) => const CartPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
        home: GetIt.I.get<AuthRepository>().getLandingPage(context),
      ),
    );
  }
}

//
