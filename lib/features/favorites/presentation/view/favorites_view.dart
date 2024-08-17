import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_tech_task/common/widgets/book_card/view/book_card_widget.dart';
import 'package:flutter_tech_task/common/widgets/empty/app_empty_widget.dart';
import 'package:flutter_tech_task/common/widgets/publisher_card/publisher_card_widget.dart';
import 'package:flutter_tech_task/core/enums/app_padding/app_padding.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/core/router/app_routes.dart';
import 'package:flutter_tech_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/features/favorites/presentation/mixin/favorites_mixin.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/home/presentation/widgets/home_shimmer_widget.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> with FavoritesMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildScaffoldBody,
    );
  }

  get _buildAppBar {
    return AppBarWidget(
      titleText: LocaleKeys.Favorites_MyFavoriteBooks.tr(),
    );
  }

  Widget get _buildScaffoldBody {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) => state.maybeWhen(
              loading: () => const SizedBox(),
              success: (bookList) => _buildViewBody,
              failure: (errorMessage) =>
                  _buildEmptyWidget(errorMessage: errorMessage),
              orElse: () => _buildEmptyWidget(),
            ));
  }

  Widget get _buildViewBody {
    return Padding(
      padding: context.paddingHorizontalHigh,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          12.sbxh,
          _buildPublisherList,
        ],
      ),
    );
  }

  Widget get _buildPublisherList {
    return Expanded(
      child: ListView.builder(
        itemCount: favoritesCubit.publishers.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            _buildPublisherCard(favoritesCubit.publishers[index]),
      ),
    );
  }

  Widget _buildPublisherCard(String publisher) {
    return PublisherCardWidget(
        publisher: publisher,
        content: _buildBookList(getBookByPublisher(publisher)));
  }

  Widget _buildBookList(List<BookEntity> bookList) {
    return ListView.builder(
      itemCount: bookList.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _buildBookCard(bookList[index]),
    );
  }

  Widget _buildBookCard(BookEntity book) {
    return GestureDetector(
      onTap: () async => await AppRouter.navigatePushNamed(
          AppRoutes.BookDetail.path,
          pathParameters: {'id': book.id.toString()}),
      child: BookCardWidget(
        book: book,
      ),
    );
  }

  Widget get _buildShimmer {
    return HomeShimmerWidget();
  }

  Widget _buildEmptyWidget({String? errorMessage}) {
    return AppEmptyWidget(
      title: errorMessage,
    );
  }
}
