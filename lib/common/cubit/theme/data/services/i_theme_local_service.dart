import 'package:flutter_tech_task/common/cubit/theme/theme_state_model.dart';
import 'package:flutter_tech_task/core/cache/hive_cache_manager.dart';

abstract class IThemeLocalService extends HiveCacheManager<ThemeStateModel> {}
