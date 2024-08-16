import 'package:flutter_tech_task/core/cache/hive_cache_manager.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';

abstract class IFavoritesLocalService extends HiveCacheManager<List> {}
