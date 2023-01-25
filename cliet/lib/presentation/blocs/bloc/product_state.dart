part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

/// The state where [ProductState] has fetched [List<ProductModel>].
class ProductFetchedState extends ProductState {
  const ProductFetchedState({required this.listProduct});

  final List<ProductModel> listProduct;

  @override
  List<Object?> get props => [listProduct];
}

/// The state where [ProductState] is initializing the state.
class ProductInitialState extends ProductState {}

/// The state where [ProductState] is loading data.
class ProductLoadingState extends ProductState {}

/// The state where [ProductState] has loaded [ProductModel].
class ProductLoadedState extends ProductState {
  const ProductLoadedState({this.product});

  final ProductModel? product;

  @override
  List<Object> get props => [product!];
}

/// The state where [ProductState] has an error including and error message.
class ProductErrorState extends ProductState {
  const ProductErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
