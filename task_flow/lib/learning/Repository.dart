class Repository<T> {
  List<T> _repositoryList = [];
  List<T> get repositoryList => List.unmodifiable(_repositoryList);
  int get count => _repositoryList.length;

  void add(T item) {
    _repositoryList.add(item);
  }
}
