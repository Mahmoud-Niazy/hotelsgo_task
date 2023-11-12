import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/core/components/custom_button.dart';
import 'package:hotelsgo_task/features/home/presentation/view/widgets/price_filtering.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/components/custom_text_button.dart';
import 'filtering_with_class_items_list.dart';
import 'filtering_with_rate_items_list.dart';

class FilteringBottomSheet extends StatelessWidget {
  const FilteringBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.r),
            topLeft: Radius.circular(15.r),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 80.h,
                horizontal: 15.w,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 140.h,
                      child: const PriceSorting(),
                    ),
                    Text(
                      'RATING',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const FilteringWithRateItemsList(),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'HOTEL CLASS ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const FilteringWithClassItemsList(),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'DISTANCE FORM',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        Row(
                          children: [
                            CustomTextButton(
                              onPressed: () {},
                              text: 'City center',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 55.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: Colors.black26,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 5.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      onPressed: () {},
                      text: 'Reset',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400,
                      underline: true,
                      color: Colors.black26,
                      underlineColor: Colors.black26,
                    ),
                    Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomIconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icons.clear,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 80.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(-1, 0),
                        blurRadius: 10,
                        spreadRadius: 2),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 15.h,
                ),
                child: CustomButton(
                  onPressed: () {},
                  label: 'Show results',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
