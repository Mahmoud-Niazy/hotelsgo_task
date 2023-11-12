import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/features/home/presentation/view/widgets/hotel%20item.dart';

List<String> filteringWithRateItems = [
  '0',
  '7',
  '7.5',
  '8',
  '8.5',
];
class FilteringWithRateItemsList extends StatefulWidget {
  static int selectedIndex = 0;
  const FilteringWithRateItemsList({super.key});

  @override
  State<FilteringWithRateItemsList> createState() => _FilteringWithRateItemsListState();
}

class _FilteringWithRateItemsListState extends State<FilteringWithRateItemsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) => GestureDetector(
          onTap: (){
            setState(() {
              FilteringWithRateItemsList.selectedIndex = index;
            });
          },
          child: Container(
            width: 50.w,
            decoration: BoxDecoration(
              color: getRateColor(num.parse(filteringWithRateItems[index])),
              borderRadius: BorderRadius.circular(15.r),
              border: index == FilteringWithRateItemsList.selectedIndex? Border.all(
                color: Colors.blue,
                width: 2.5,
              ) : null,
            ),
            child: Center(
              child: Text(
                '${filteringWithRateItems[index]}+',
                style:  TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context,index)=> SizedBox(
          width: 20.w,
        ),
        itemCount: filteringWithRateItems.length,
      ),
    );
  }
}
