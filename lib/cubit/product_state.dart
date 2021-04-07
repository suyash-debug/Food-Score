part of 'product_cubit.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<FoodProduct> foodProducts;
  const ProductLoaded(this.foodProducts);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProductLoaded && o.foodProducts == foodProducts;
  }

  @override
  int get hashCode => foodProducts.hashCode;
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProductError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
