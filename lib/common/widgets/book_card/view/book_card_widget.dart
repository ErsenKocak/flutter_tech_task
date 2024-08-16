import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/app_svg/app_svg_widget.dart';
import 'package:flutter_tech_task/common/widgets/book_card/mixin/book_card_mixin.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/utils/theme/text_theme/text_theme.dart';
import 'package:flutter_tech_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';

class BookCardWidget extends StatefulWidget {
  const BookCardWidget({super.key, required this.book});

  final BookEntity book;

  @override
  State<BookCardWidget> createState() => _BookCardWidgetState();
}

class _BookCardWidgetState extends State<BookCardWidget> with BookCardMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildPrefixWidget,
          8.sbxw,
          _buildCardBody,
          Spacer(),
          _buildSuffixWidget
        ],
      ),
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
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return AppSvgWidget(
          path: checkBookIsFavorite(widget.book)
              ? Assets.icons.general.iconLikeFill.path
              : Assets.icons.general.iconLike.path,
          color: checkBookIsFavorite(widget.book)
              ? AppLightColors.primaryPink
              : AppThemes
                  .currentTheme.bottomNavigationBarTheme.unselectedItemColor!,
          onTap: () => onTapFavorite(widget.book),
        );
      },
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
      widget.book.title ?? '',
      style: Application.applicationContext.textTheme.body.smallSemibold,
    );
  }

  Widget get _buildBookSubTitle {
    return Row(
      children: [
        Text(
          widget.book.year.toString(),
          style: Application.applicationContext.textTheme.xSmall.medium
              .copyWith(color: AppLightColors.dark500),
        ),
        Text(
          ' - ${widget.book.pages} Sayfa',
          style: Application.applicationContext.textTheme.xSmall.regular
              .copyWith(color: AppLightColors.dark400),
        ),
      ],
    );
  }
}
