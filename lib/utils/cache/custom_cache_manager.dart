import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static const _imageCacheKey = 'imageCacheKey';
  static const _contentCacheKey = 'contentCacheKey';
  static CacheManager imageInstance = CacheManager(
    Config(
      _imageCacheKey,
      stalePeriod: const Duration(days: 20),
      maxNrOfCacheObjects: 100,
      repo: CacheObjectProvider(databaseName: _imageCacheKey),
      fileService: HttpFileService(),
    ),
  );

  static CacheManager contentInstance = CacheManager(
    Config(
      _contentCacheKey,
      stalePeriod: const Duration(days: 1),
      maxNrOfCacheObjects: 100,
      repo: CacheObjectProvider(databaseName: _contentCacheKey),
      fileService: HttpFileService(),
    ),
  );
}
