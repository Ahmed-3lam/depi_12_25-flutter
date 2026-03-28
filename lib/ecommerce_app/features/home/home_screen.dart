import 'package:carousel_slider/carousel_slider.dart';
import 'package:depi_five/const.dart';
import 'package:depi_five/ecommerce_app/features/home/cubit/cubit/home_cubit.dart';
import 'package:depi_five/ecommerce_app/features/home/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 33.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30.h,
            children: [
              _banner(),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text("Products"),
                  Text("View All", style: TextStyle(color: Colors.green)),
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final products = context
                      .read<HomeCubit>()
                      .itemModel
                      .data
                      ?.products;
                  if (state is HomeItemLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(
                    height: 190.h,
                    child: ListView.builder(
                      itemCount: products?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) => Container(
                        width: 180.w,
                        margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Row(
                              mainAxisAlignment: .center,
                              children: [
                                Container(
                                  height: 84.r,
                                  width: 84.r,
                                  child: Image.network(
                                    products?[i].image ?? "",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Text(products?[i].name ?? ""),
                            Container(
                              width: 180,
                              child: Text(
                                products?[i].description ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ ${products?[i].price}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "\$50",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final bannerModel = context.read<HomeCubit>().bannerModel;
        if (state is HomeBannerLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return CarouselSlider(
          items: List.generate(
            bannerModel.data?.length ?? 0,
            (index) => Container(
              height: 150.h,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                bannerModel.data?[index].image ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: Icon(Icons.menu),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.pin_drop),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Text(
                    "Current Location",
                    style: TextStyle(fontSize: 14, color: Color(0xFF16162E)),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.green),
                ],
              ),
              Text(
                "Shebin Elkom",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(padding: const EdgeInsets.all(12.0), child: Icon(Icons.search)),
      ],
    );
  }
}
