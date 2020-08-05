abstract class BaseService<T> {
  void create(T entidade);
  void update(T entidade);
  T get(int id);
  void delete(T entidade);
}
