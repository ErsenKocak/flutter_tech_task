import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/functions/date/app_date_functions.dart';
import 'package:flutter_tech_task/common/widgets/app_svg/app_svg_widget.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/enums/date/date_format_types.dart';
import 'package:flutter_tech_task/core/utils/theme/text_theme/text_theme.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/common/widgets/book_card/view/book_card_widget.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';

class BookDetailCardWidget extends StatelessWidget {
  const BookDetailCardWidget({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader,
          20.sbxh,
          _buildNotes,
          20.sbxh,
          _buildVillains,
          20.sbxh,
          _buildPublisher,
          20.sbxh,
          _buildISBN,
          20.sbxh,
          _buildCreatedDate,
        ],
      ),
    );
  }

  Widget get _buildCardHeader {
    return BookCardWidget(
      book: book,
    );
  }

  Widget get _buildPrefixWidget {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppLightColors.purple,
      ),
      child: AppSvgWidget(
        path: Assets.icons.general.icBook.path,
        color: AppLightColors.purple60,
      ),
    );
  }

  Widget get _buildSuffixWidget {
    return AppSvgWidget(
      path: Assets.icons.general.iconLike.path,
      color:
          AppThemes.currentTheme.bottomNavigationBarTheme.unselectedItemColor!,
    );
  }

  Widget get _buildCardBody {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBookTitle,
          _buildBookSubTitle,
        ],
      ),
    );
  }

  Widget get _buildBookTitle {
    return Text(
      book.title ?? '',
      style: Application.applicationContext.textTheme.body.smallSemibold,
    );
  }

  Widget get _buildBookSubTitle {
    return Row(
      children: [
        Text(
          book.year.toString(),
          style: Application.applicationContext.textTheme.xSmall.medium
              .copyWith(color: AppLightColors.dark500),
        ),
        Text(
          ' - ${book.pages} Sayfa',
          style: Application.applicationContext.textTheme.xSmall.regular
              .copyWith(color: AppLightColors.dark400),
        ),
      ],
    );
  }

  Widget get _buildNotes {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInformationTitle('Notes'),
        4.sbxh,
        _buildNotesBody,
      ],
    );
  }

  Widget get _buildNotesBody {
    return ListView.builder(
      itemCount: book.notes?.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => Text(
        '- ${book.notes?[index]}',
        style: Application.applicationContext.textTheme.xSmall.medium
            .copyWith(color: AppLightColors.dark500),
      ),
    );
  }

  Widget get _buildVillains {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInformationTitle('Villains'),
        4.sbxh,
        _buildVillainsBody,
      ],
    );
  }

  Widget get _buildVillainsBody {
    return ListView.builder(
      itemCount: book.villains?.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => Text(
        '- ${book.villains?[index].name}',
        style: Application.applicationContext.textTheme.xSmall.medium
            .copyWith(color: AppLightColors.dark500),
      ),
    );
  }

  Widget get _buildISBN {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInformationTitle('ISBN'),
        4.sbxh,
        Text(
          '- ${book.isbn}',
          style: Application.applicationContext.textTheme.xSmall.medium
              .copyWith(color: AppLightColors.dark500),
        )
      ],
    );
  }

  Widget get _buildPublisher {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInformationTitle('Publisher'),
        4.sbxh,
        Text(
          '- ${book.publisher}',
          style: Application.applicationContext.textTheme.xSmall.medium
              .copyWith(color: AppLightColors.dark500),
        )
      ],
    );
  }

  Widget get _buildCreatedDate {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInformationTitle('Created Date'),
        4.sbxh,
        Text(
          '- ${_getDateLabel(book.createdAt)}',
          style: Application.applicationContext.textTheme.xSmall.medium
              .copyWith(color: AppLightColors.dark500),
        )
      ],
    );
  }

  String? _getDateLabel(String? date) {
    if (date.isNullOrEmpty) return '';

    DateTime dateTime =
        AppDateFunctions.stringToDateTime(stringDate: book.createdAt!);

    String? formattedDate = AppDateFunctions.dateFormat(
        dateTime: dateTime, dateFormat: DateFormatTypes.ddMMyyyy);

    return formattedDate;
  }

  Widget _buildInformationTitle(String title) {
    return Text(
      title,
      style: Application.applicationContext.textTheme.body.smallSemibold,
    );
  }
}
