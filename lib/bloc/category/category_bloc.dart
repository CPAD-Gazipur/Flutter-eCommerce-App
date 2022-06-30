import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/model.dart';
import '../../repositories/repositories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _streamCategorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(event, Emitter<CategoryState> emit) {
    _streamCategorySubscription?.cancel();
    _streamCategorySubscription =
        _categoryRepository.getAllCategories().listen((categories) {
      return add(UpdateCategories(categories));
    });
  }

  void _onUpdateCategories(event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
