import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop/data/models/product_model.dart';
import 'package:shop/domain/use_cases/fetch_product_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'product_event.dart';
part 'product_state.dart';

/// Duration of time that used for [debounce] process.
const _duration = Duration(milliseconds: 300);

/// [debounce] used to handle event changes with a certain duration.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.fetchProductUseCase})
      : super(ProductInitialState()) {
    on<ProductFetchEvent>(_fetch, transformer: debounce(_duration));
  }

  final FetchProductUseCase fetchProductUseCase;

  /// This method is used as a listener fetch event.
  ///
  /// Return [ProductFetchEvent] with [List<ProductModel>] data.
  /// Throw a [ProductErrorState] along with the error message, if there is an error while retrieving list product data.
  void _fetch(ProductFetchEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      final listProduct = await fetchProductUseCase.call();
      emit(ProductFetchedState(listProduct: listProduct));
    } catch (error) {
      emit(ProductErrorState(message: error.toString()));
    }
  }
}
