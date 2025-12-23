import 'package:app_news/cubit/articels_cubit/articel_cubit.dart';
import 'package:app_news/cubit/articels_cubit/articel_state.dart';
import 'package:app_news/cubit/category_cubit/category_cubit.dart';
import 'package:app_news/cubit/category_cubit/category_state.dart';
import 'package:app_news/service/articel_service.dart';
import 'package:app_news/widget/articel_card.dart';
import 'package:app_news/widget/custom_card_category.dart';
import 'package:app_news/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(
          create: (context) => ArticelCubit(ArticelService())..getNewsCubit(category: "general"),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(

          title: CustomText(
            text: "News App",
            color: Colors.orange,
            fontWeight: FontWeight.w500,
            size: 20,
            letterSpacing: 1.5,
          ),
          centerTitle: true,
        ),

        body:SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text cateories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomText(
                  text: "Category",
                  fontWeight: FontWeight.w500,
                  size: 20,
                  letterSpacing: 1.5,
                ),
              ),
              // Category card
              Gap(20),
              BlocListener<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  context.read<ArticelCubit>().getNewsCubit(category: state.selctedCategory);
                },
                child: CustomCardCategory(),
              ),
        
              //
              Gap(20),
              BlocBuilder<ArticelCubit, ArticelState>(
                builder: (context, state) {
                  if (state is ArticelLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ArticelFailuerState) {
                    return Center(child: Text(state.erorr));
                  } else if (state is ArticelSuccesState) {
                    return ListView.builder(
                      
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.articleModel.length,
                      itemBuilder: (context, index) {
                        return ArticalCard(model: state.articleModel[index]);
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
