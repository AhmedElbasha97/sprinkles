import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/comment_model.dart';
import 'package:sprinkles/models/response_model.dart';

class ReviewsServices{
  static ApiService api = ApiService();
  Future<ResponseModel?> sendingComment(String orderId,String review,String itemRate,String shopRate) async {
    var data = await api.request(Services.addingCommentEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "order_id":orderId,
      "review":review,
      "item_rate":itemRate,
      "shop_rate":shopRate,
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  Future<List<CommentModel>?> getProductComment(String productId) async {
    List<CommentModel>? commentsList = [];
    var data = await api.request(Services.getCommentEndPoint, "POST",queryParamters: {
      "item_id": productId,
    });
    if (data != null) {
      for (var comment in data){
        commentsList.add(CommentModel.fromJson(comment));
      }
      return commentsList;
    }
    return null;
  }
  Future<List<CommentModel>?> getStoreComment(String storeId) async {
    List<CommentModel>? commentsList = [];
    var data = await api.request(Services.getCommentEndPoint, "POST",queryParamters: {
      "shop_id": storeId,
    });
    if (data != null) {
      for (var comment in data){
        commentsList.add(CommentModel.fromJson(comment));
      }
      return commentsList;
    }
    return null;
  }

}