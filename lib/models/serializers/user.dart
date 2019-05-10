import 'package:mvp/models/pojos/user.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user.jser.dart';

@GenSerializer()
class UserSerializer extends Serializer<User> with _$UserSerializer {}
