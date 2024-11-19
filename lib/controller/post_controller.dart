import 'package:get/get.dart';
import '../api_service_bola.dart';
import '../model/model_bola.dart';
import '../model/post_model.dart';
import 'favorite_controller.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <PostModel>[].obs;
  var favorites = <ModelBola>[].obs;

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiServiceBola().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }

  void addTaskToFavorites(PostModel post) {
    ModelBola favoriteBola = ModelBola(
      strTeam: post.strTeam,
      strStadium: post.strStadium,
      strBadge: post.strBadge,
      strDescriptionEN: post.strDescriptionEN,
    );
    favorites.add(favoriteBola);
    favoriteController.addTask(favoriteBola);
  }
}
