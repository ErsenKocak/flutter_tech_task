import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/common/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_tech_task/common/widgets/app_bar/leading/arrow_back/app_bar_arrow_back_leading.dart';
import 'package:flutter_tech_task/common/widgets/empty/app_empty_widget.dart';
import 'package:flutter_tech_task/common/widgets/publisher_card/publisher_card_widget.dart';
import 'package:flutter_tech_task/core/enums/app_padding/app_padding.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/cubit/book_detail_cubit.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/mixin/book_detail_mixin.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/widgets/book_detail_card_widget.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/widgets/book_detail_shimmer_widget.dart';

class BookDetailView extends StatefulWidget {
  const BookDetailView({super.key, required this.bookId});
  final String bookId;
  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> with BookDetailMixin {
  @override
  void initState() {
    super.initState();
    initializeMixin();
    getBookDetail(int.parse(widget.bookId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBarWidget(
      leading: AppBarArrowBackLeading(),
      titleText: 'Kitap Detayı',
    );
  }

  Widget get _buildBody {
    return BlocBuilder<BookDetailCubit, BookDetailState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => _buildShimmer,
        success: (bookDetail) =>
            _buildPublisherCard(bookDetail.publisher ?? ''),
        orElse: () => _buildEmptyWidget(),
      ),
    );
  }

  Widget _buildPublisherCard(String publisher) {
    return Padding(
      padding: context.paddingHorizontalHigh,
      child: PublisherCardWidget(publisher: publisher, content: _buildBookCard),
    );
  }

  Widget get _buildBookCard {
    return BookDetailCardWidget(
      book: bookDetailCubit.bookDetailEntity!,
    );
  }

  Widget get _buildShimmer {
    return BookDetailShimmerWidget();
  }

  Widget _buildEmptyWidget({String? errorMessage}) {
    return AppEmptyWidget(
      buttonText: 'Yenile',
      title: errorMessage,
      onPress: () async => await getBookDetail(int.parse(widget.bookId)),
    );
  }
}
