import 'package:app_news/cubit/category_cubit/category_cubit.dart';
import 'package:app_news/cubit/category_cubit/category_state.dart';
import 'package:app_news/models/list_of_category.dart';
import 'package:app_news/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(ListOfCategory.categories.length, (index) {
              final categoryName = ListOfCategory.categories[index];
                final isSelected =
                  categoryName == state.selctedCategory;



              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<CategoryCubit>().selectCategory(categoryName);
                  },
                  child: Container(
                    width: 190,
                    height: 50,
                    decoration: BoxDecoration(
                      color:isSelected ?  Colors.orange :  Colors.grey.shade300, 
                      borderRadius: BorderRadius.circular(20),
                     
                    ),
                    child: Center(
                      child: CustomText(
                        text: categoryName,
                        color: isSelected ?  Colors.white :  Colors.black ,
                        fontWeight: FontWeight.w500,
                        size: 20,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
