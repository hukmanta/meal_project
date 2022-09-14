import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:meal_project/domain/i_meal_repository.dart';
import 'package:meal_project/infrastructure/local_db/database.dart';
import 'package:meal_project/simple_bloc_delegate.dart';

part 'meal_event.dart';
part 'meal_state.dart';
part 'meal_bloc.freezed.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final IMealRepository _repository;

  MealBloc(this._repository) : super(MealState.initial()) {
    on<_Start>(_startLogic);
    on<_CategorySelected>(_categorySelected);
    on<_MealDetail>(_mealDetail);
  }

  FutureOr<void> _startLogic(_Start event, Emitter<MealState> emit) async{
    emit(state.copyWith(isLoading: true));
    try{
      List<TableCategory> cat =[];
      var x =await _repository.getCategoriesFromDb();
      if ( x.isEmpty){
        await _repository.getCategoriesFromService();
        cat = await _repository.getCategoriesFromDb();
      } else {
        cat = x;
      }
      emit(state.copyWith(categories: cat));
    } catch (e){
      Modular.get<SimpleBlocObserver>().logger.e(e.toString());
    } finally{
      emit(state.copyWith(isLoading: false));
    }

  }

  FutureOr<void> _categorySelected(_CategorySelected event, Emitter<MealState> emit)
  async{
    emit(state.copyWith(isLoading: true));
    try{
      List<TableMealDetailData> cat =[];
      await _repository.getMealByCategoryFromService(event.category.strCategory);
      var x =await _repository.getItemMealByCategoriesFromDb(event.category.strCategory);
      if ( x.isNotEmpty){
        cat = x;
      }
      emit(state.copyWith(selectedCategory: event.category, mealDetail: cat));
    } catch (e){
      Modular.get<SimpleBlocObserver>().logger.e(e.toString());
    } finally{
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _mealDetail(_MealDetail event, Emitter<MealState> emit) async {
    emit(state.copyWith(isLoading: true));
    try{
      TableMealDetailData? cat;
      await _repository.getMealDetailByIdFromService(event.detail.mealId.toString());
      var x =await _repository.getItemMealDetailFromDb(event.detail.mealId);
      if ( x.isNotEmpty){
        cat = x.last;
        emit(state.copyWith(selectedDetail: cat));
      }
    } catch (e){
      Modular.get<SimpleBlocObserver>().logger.e(e.toString());
    } finally{
      emit(state.copyWith(isLoading: false));
    }
  }
}