import 'package:dio/dio.dart';

import 'package:fpdart/fpdart.dart';

import '../../core/failure.dart';
import '../../domain/repository/user_repository.dart';
import '../datasource/user/user_data_source.dart';
import '../model/user_model.dart';

class UserDataRepositoryImpl implements UserRepository {
  final UserDataSource _remoteDataSource;

  UserDataRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<UserModel>>> getUserListRepository() async {
    try {
      final result = await _remoteDataSource.getUserList();
      return Right(result);
    } on DioException catch (dioError) {
      return Left(DioFailure(dioError));
    } catch (error) {
      return Left(OtherFailure(error.toString()));
    }
  }
}
