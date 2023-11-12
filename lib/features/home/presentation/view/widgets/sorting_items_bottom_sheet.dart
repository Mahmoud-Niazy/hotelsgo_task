import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/features/home/presentation/view/widgets/sorting_items_list.dart';

import '../../../../../core/components/custom_icon_button.dart';

class SortingItemsBottomSheet extends StatelessWidget{
  const SortingItemsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(
          top: MediaQuery.of(context).size.height*.1
      ),
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
            const SortingItemsList(),
            Positioned(
              right: 0,
              left: 0,
              top: 0,
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
                padding:
                const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .4,
                      ),
                      child: const Text(
                        'Sort by',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width *.3
                      ),
                      child: CustomIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icons.clear,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}