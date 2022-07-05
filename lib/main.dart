import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/simple_bloc_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/model.dart';
import 'repositories/repositories.dart';
import 'bloc/blocs.dart';
import 'config/config.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) =>
                WishlistBloc(localStorageRepository: LocalStorageRepository())
                  ..add(LoadWishList()),
          ),
          BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
          BlocProvider(create: (_) => PaymentBloc()..add(LoadPaymentMethod())),
          BlocProvider(
            create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              paymentBloc: context.read<PaymentBloc>(),
              checkoutRepository: CheckoutRepository(),
            ),
          ),
          BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories()),
          ),
          BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProducts()),
          ),
        ],
        child: MaterialApp(
          title: 'eEcommerce App',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoute.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
