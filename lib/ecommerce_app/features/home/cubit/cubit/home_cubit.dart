import 'package:bloc/bloc.dart';
import 'package:depi_five/ecommerce_app/core/network/dio_helper.dart';
import 'package:depi_five/ecommerce_app/core/network/k_apis.dart';
import 'package:depi_five/ecommerce_app/features/home/models/item_model.dart';
import 'package:meta/meta.dart';

import '../../models/banner_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  BannerModel bannerModel = BannerModel();
  ItemModel itemModel = ItemModel();
  void getBanners() async {
    emit(HomeBannerLoading());
    try {
      final result = await DioHelper.getData(KApis.banners);
      bannerModel = BannerModel.fromJson(result.data);
      if (bannerModel.statusCode == 200) {
        emit(HomeBannerSuccess());
      } else {
        emit(HomeBannerError());
      }
    } catch (e) {
      emit(HomeBannerError());
    }
  }

   void getItems() async {
    emit(HomeItemLoading());
    try {
      final result = await DioHelper.getData(KApis.products);
      itemModel = ItemModel.fromJson(result.data);
      if (itemModel.statusCode == 200) {
        emit(HomeItemSuccess());
      } else {
        emit(HomeItemError());
      }
    } catch (e) {
      emit(HomeItemError());
    }
  }
}
