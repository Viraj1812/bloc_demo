import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/wishlist_items.dart';
import 'package:bloc_demo/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveFromWishListEvent>(wishListRemoveFromCartEvent);
  }

  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishListRemoveFromCartEvent(WishListRemoveFromWishListEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
// emit()
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
