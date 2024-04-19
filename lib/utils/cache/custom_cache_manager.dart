import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static const _imageCacheKey = 'imageCacheKey';
  static const _svgCacheKey = 'svgCacheKey';
  static const _contentCacheKey = 'contentCacheKey';
  static const _personsCacheKey = 'personsCacheKey';
  static CacheManager imageInstance = CacheManager(
    Config(
      _imageCacheKey,
      stalePeriod: const Duration(days: 20),
      maxNrOfCacheObjects: 1000,
      repo: CacheObjectProvider(databaseName: _imageCacheKey),
      fileService: HttpFileService(),
    ),
  );

  static CacheManager contentInstance = CacheManager(
    Config(
      _contentCacheKey,
      stalePeriod: const Duration(days: 1),
      maxNrOfCacheObjects: 500,
      repo: CacheObjectProvider(databaseName: _contentCacheKey),
      fileService: HttpFileService(),
    ),
  );

  static CacheManager personsInstance = CacheManager(Config(
    _personsCacheKey,
    stalePeriod: const Duration(days: 20),
    maxNrOfCacheObjects: 500,
    repo: CacheObjectProvider(databaseName: _personsCacheKey),
    fileService: HttpFileService(),
  ));

  static CacheManager svgInstance = CacheManager(Config(_svgCacheKey,
      stalePeriod: const Duration(days: 20),
      maxNrOfCacheObjects: 500,
      repo: CacheObjectProvider(databaseName: _svgCacheKey),
      fileService: HttpFileService()));
}
