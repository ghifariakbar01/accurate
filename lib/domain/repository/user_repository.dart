import 'package:dartz/dartz.dart';

import '../../core/failure.dart';

import '../../data/model/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserModel>>> getUserListRepository();
}