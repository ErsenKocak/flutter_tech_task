import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/cubit/book_detail_cubit.dart';
import 'package:flutter_tech_task/features/book_detail/presentation/view/book_detail_view.dart';

mixin BookDetailMixin on State<BookDetailView> {
  late BookDetailCubit bookDetailCubit;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initializeMixin() async {
    bookDetailCubit = context.read<BookDetailCubit>();
    await initializeServices();
  }

  Future<void> initializeServices() async {}

  Future<void> getBookDetail(int id) async {
    await bookDetailCubit.getBookDetail(id);
  }
}
