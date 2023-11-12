import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/core/components/custom_text_button.dart';
import 'package:hotelsgo_task/features/home/presentation/view/widgets/rate.dart';
import '../../../data/models/hotel_model.dart';

class HotelItem extends StatelessWidget {
  final HotelModel hotel;

  const HotelItem({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                hotel.image,
                height: 150.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Rate(
                          rate: hotel.starts,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Hotel',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      hotel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: getRateColor(hotel.reviewScore),
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 2.h,
                              ),
                              child: Text(
                                '${hotel.reviewScore}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              hotel.review,
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 13,
                                color: Colors.black54,
                              ),
                              Expanded(
                                child: Text(
                                  hotel.address,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              'Our lowest price',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      color: const Color(0xFF028000),
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '${hotel.price}',
                                  style: TextStyle(
                                      color: const Color(0xFF028000),
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Renaissance',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomTextButton(
                            onPressed: () {},
                            text: 'View Deal',
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5
                ),
                child: CustomTextButton(
                  text: 'More prices',
                  color: Colors.black.withOpacity(.3),
                  underlineColor: Colors.black.withOpacity(.3),
                  underline: true,
                  fontSize: 16.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

getRateColor(num rate) {
  if (rate >= 8.5) {
    return const Color(0xFF005F00);
  }
  if (rate >= 8 && rate < 8.5) {
    return const Color(0xFF028000);
  }
  if (rate >= 7.5 && rate < 8) {
    return const Color(0xFF62A30F);
  }
  if (rate >= 7 && rate < 7.5) {
    return const Color(0xFFFC9E15);
  } else {
    return Colors.red;
  }
}
