import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List filteringWithClassItems = [
  'assets/images/1.PNG',
  'assets/images/2.PNG',
  'assets/images/3.PNG',
  'assets/images/4.PNG',
  'assets/images/5.PNG',
];

class FilteringWithClassItemsList extends StatefulWidget {
  static int currentIndex = 0;

  const FilteringWithClassItemsList({super.key});

  @override
  State<FilteringWithClassItemsList> createState() =>
      _FilteringWithClassItemsListState();
}

class _FilteringWithClassItemsListState
    extends State<FilteringWithClassItemsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              FilteringWithClassItemsList.currentIndex = index;
            });
          },
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
                border: FilteringWithClassItemsList.currentIndex == index
                    ? Border.all(
                        color: Colors.blue,
                        width: 2,
                      )
                    : null,
                borderRadius: BorderRadius.circular(10.r)),
            child: Image.asset(filteringWithClassItems[index]),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 20.w,
        ),
        itemCount: filteringWithClassItems.length,
      ),
    );
  }
}
