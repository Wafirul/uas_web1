import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/presentation/blocs/bloc/product_bloc.dart';
import 'package:shop/presentation/pages/main_page.dart';

import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Inject all dependecies injector and wait for it is done
  await di.init();
  runApp(const Shop());
}

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ProductBloc>()
            ..add(
              const ProductFetchEvent(),
            ),
        ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
