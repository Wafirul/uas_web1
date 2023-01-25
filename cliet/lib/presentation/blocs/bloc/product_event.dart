part of 'product_bloc.dart';

/// Abstract class to accommodate Product event conditions.
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

/// Event when [ProductEvent] detects a change in city name.
class ProductFetchEvent extends ProductEvent {
  const ProductFetchEvent();

  @override
  List<Object> get props => [];
}
