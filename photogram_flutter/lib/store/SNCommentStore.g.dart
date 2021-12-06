// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SNCommentStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SNCommentStore on SNCommentStoreBase, Store {
  final _$commentListAtom = Atom(name: 'SNCommentStoreBase.commentList');

  @override
  ObservableList<SNCommentModel> get commentList {
    _$commentListAtom.reportRead();
    return super.commentList;
  }

  @override
  set commentList(ObservableList<SNCommentModel> value) {
    _$commentListAtom.reportWrite(value, super.commentList, () {
      super.commentList = value;
    });
  }

  final _$SNCommentStoreBaseActionController =
      ActionController(name: 'SNCommentStoreBase');

  @override
  void updateComments(SNCommentModel model) {
    final _$actionInfo = _$SNCommentStoreBaseActionController.startAction(
        name: 'SNCommentStoreBase.updateComments');
    try {
      return super.updateComments(model);
    } finally {
      _$SNCommentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$SNCommentStoreBaseActionController.startAction(
        name: 'SNCommentStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$SNCommentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
commentList: ${commentList}
    ''';
  }
}
