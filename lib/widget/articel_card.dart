import 'package:app_news/models/articel_model.dart';
import 'package:app_news/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ArticalCard extends StatelessWidget {
  const ArticalCard({super.key, required this.model});
  final ArticelModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
          
              if (model.urlImage.isNotEmpty)
                Image.network(model.urlImage)
              else
                Container(
                  height: 200,
                  color: Colors.grey.shade300,
                  child: Center(child: Icon(Icons.image)),
                ),
              Gap(10),
              //title
              CustomText(text: model.title,
              size: 18,
              fontWeight: FontWeight.w500,
              ),
              Gap(10),
              // desc
              CustomText(text: model.desc,
              size: 15,
              color: Colors.grey.shade600,
              ),
              Gap(10),

            ],
          ),
        ),
      ),
    );
  }
}