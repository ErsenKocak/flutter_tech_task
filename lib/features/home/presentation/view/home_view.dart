import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';

import 'package:flutter_tech_task/common/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_tech_task/common/widgets/empty/app_empty_widget.dart';
import 'package:flutter_tech_task/common/widgets/publisher_card/publisher_card_widget.dart';
import 'package:flutter_tech_task/common/widgets/search_bar/app_search_bar.dart';
import 'package:flutter_tech_task/core/enums/app_padding/app_padding.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/core/router/app_routes.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_tech_task/features/home/presentation/mixin/home_mixin.dart';
import 'package:flutter_tech_task/common/widgets/book_card/view/book_card_widget.dart';
import 'package:flutter_tech_task/features/home/presentation/widgets/home_shimmer_widget.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppbar,
      body: _buildScaffoldBody,
    );
  }

  get _buildAppbar {
    return AppBarWidget(
      titleText: LocaleKeys.Home_Books.tr(),
    );
  }

  Widget get _buildScaffoldBody {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => state.maybeWhen(
              loading: () => _buildShimmer,
              listSuccess: (bookList) => _buildViewBody,
              failure: (exception) =>
                  _buildEmptyWidget(errorMessage: exception.message),
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
          _buildSearchInput,
          12.sbxh,
          _buildPublisherList,
        ],
      ),
    );
  }

  Widget get _buildSearchInput {
    return AppSearchInput(
      hintText: LocaleKeys.Home_BookName.tr(),
      controller: searchInputController,
    );
  }

  Widget get _buildPublisherList {
    return Expanded(
      child: ListView.builder(
        itemCount: homeCubit.publishers?.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            _buildPublisherCard(homeCubit.publishers![index]),
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

  /// Mobil veya Backend tarafında handle edilmiş anlamlı mesaj bulunan bir hata yakalanma durumu olursa,
  /// Aynı zamanda da hata mesajını UI'a taşımak istersek State üzerinden parametre vererek taşıyoruz
  Widget _buildEmptyWidget({String? errorMessage}) {
    return AppEmptyWidget(
      buttonText: LocaleKeys.Global_Refresh.tr(),
      title: errorMessage,
      onPress: () async => await getBooks(),
    );
  }
}
