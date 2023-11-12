import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceSorting extends StatefulWidget{
  static double price =20 ;

  const PriceSorting({super.key});
  @override
  State<PriceSorting> createState() => _PriceSortingState();
}

class _PriceSortingState extends State<PriceSorting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            Text(
              'PRICE PER NIGHT',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight:
                  FontWeight.w600,
                  color: Colors.black87),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 3.w,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius:
                BorderRadius.circular(
                    5.r),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${PriceSorting.price.round()}',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors
                              .black),
                    ),
                    TextSpan(
                      text: '+ \$',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color:
                        Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Slider(
          activeColor: Colors.blue,
          value: PriceSorting.price,
          onChanged: (value){
            setState(() {
              PriceSorting.price = value;
            });
          },
          min: 20,
          max: 540,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$20',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.grey,
              ),
            ),
            Text(
              '\$540',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}