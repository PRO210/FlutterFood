// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$isAuthenticadedAtom = Atom(name: '_AuthStoreBase.isAuthenticaded');

  @override
  bool get isAuthenticaded {
    _$isAuthenticadedAtom.reportRead();
    return super.isAuthenticaded;
  }

  @override
  set isAuthenticaded(bool value) {
    _$isAuthenticadedAtom.reportWrite(value, super.isAuthenticaded, () {
      super.isAuthenticaded = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AuthStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$authAsyncAction = AsyncAction('_AuthStoreBase.auth');

  @override
  Future<bool> auth(String email, String password) {
    return _$authAsyncAction.run(() => super.auth(email, password));
  }

  final _$registerAsyncAction = AsyncAction('_AuthStoreBase.register');

  @override
  Future<bool> register(String name, String email, String password) {
    return _$registerAsyncAction
        .run(() => super.register(name, email, password));
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void setAuthenticaded(bool value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setAuthenticaded');
    try {
      return super.setAuthenticaded(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAuthenticaded: ${isAuthenticaded},
isLoading: ${isLoading}
    ''';
  }
}
