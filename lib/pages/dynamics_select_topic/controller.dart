import 'package:PiliPlus/http/loading_state.dart';
import 'package:PiliPlus/http/search.dart';
import 'package:PiliPlus/models_new/dynamic/dyn_topic_pub_search/data.dart';
import 'package:PiliPlus/models_new/dynamic/dyn_topic_top/topic_item.dart';
import 'package:PiliPlus/pages/common/common_list_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SelectTopicController
    extends CommonListController<TopicPubSearchData, TopicItem> {
  final focusNode = FocusNode();
  final controller = TextEditingController();

  final RxBool enableClear = false.obs;

  @override
  void onInit() {
    super.onInit();
    queryData();
  }

  @override
  List<TopicItem>? getDataList(TopicPubSearchData response) {
    return response.topicItems;
  }

  @override
  Future<LoadingState<TopicPubSearchData>> customGetData() =>
      SearchHttp.topicPubSearch(
        keywords: controller.text,
        pageNum: page,
      );

  @override
  void onClose() {
    focusNode.dispose();
    controller.dispose();
    super.onClose();
  }
}
