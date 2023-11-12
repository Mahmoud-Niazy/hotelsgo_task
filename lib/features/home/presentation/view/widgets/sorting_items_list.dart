import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<String> sortingItems = [
  'Our recommendation',
  'Rating & Recommended',
  'Price & Recommended',
  'Distance & Recommended',
  'Rating only',
  'Price only',
  'Distance only',
];
class SortingItemsList extends StatefulWidget{
  static int currentIndex = 0;
  const SortingItemsList({super.key});

  @override
  State<SortingItemsList> createState() => _SortingItemsListState();
}

class _SortingItemsListState extends State<SortingItemsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20,
            top: 80,
          right: 20
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index)=> GestureDetector(
            onTap: (){
              setState(() {
                SortingItemsList.currentIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10
              ),
              child: Row(
                children: [
                  Text(
                    sortingItems[index],
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  if(SortingItemsList.currentIndex == index)
                    const Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),

                ],
              ),
            ),
          ),
          separatorBuilder: (context,index) => const Divider(),
          itemCount: sortingItems.length,
        ),
      ),
    );
  }
}