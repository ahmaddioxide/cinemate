import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemate/models/home_response_model.dart';
import 'package:cinemate/repositories/home_screen_repo.dart';

final homeScreenRepoProvider = Provider<HomeScreenRepo>((ref) {
  return HttpHomeScreenResponse();
});

final homeScreenProvider = FutureProvider.autoDispose<HomeScreenResponse>((ref) async {
  final homeScreenRepo = ref.watch(homeScreenRepoProvider);
  return homeScreenRepo.getHomeScreenResponse();
});
