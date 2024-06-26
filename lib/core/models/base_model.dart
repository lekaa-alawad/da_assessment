import '../entites/base_entity.dart';

abstract class BaseModel<T extends BaseEntity> {
  T toEntity();
}
