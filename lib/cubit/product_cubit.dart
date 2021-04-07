import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/models/FoodProducts.dart';
import 'package:food/services/fetchFoodProducts.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final FoodProductRepository foodProductRepository;
  ProductCubit(this.foodProductRepository) : super(ProductInitial());
  Future<void> getFoodProducts() async {
    try {
      emit(ProductLoading());
      final foodProducts = await foodProductRepository.fetchProducts();
      emit(ProductLoaded(foodProducts));
    } on NetworkException {
      emit(ProductError("Paisa nahi hai kya internet k liye.."));
    }
  }
}
