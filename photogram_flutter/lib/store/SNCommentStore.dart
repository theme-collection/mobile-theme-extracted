import 'package:mobx/mobx.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

part 'SNCommentStore.g.dart';

class SNCommentStore = SNCommentStoreBase with _$SNCommentStore;

abstract class SNCommentStoreBase with Store {
  @observable
  ObservableList<SNCommentModel> commentList = getCommentList();

  @action
  void updateComments(SNCommentModel model) {
    commentList.insert(0, model);
  }

  @action
  void dispose() {
    commentList.clear();
  }
}
