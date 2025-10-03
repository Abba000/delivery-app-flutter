// ignore_for_file: file_names

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(transform ?? (e) => e).where((e) => e != null).cast();
}
