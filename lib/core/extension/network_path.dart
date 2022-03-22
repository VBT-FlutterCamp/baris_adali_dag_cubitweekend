enum NetworkPath { comment }

extension NetworkPathExtension on NetworkPath {
  String rawValue() {
    switch (this) {
      case NetworkPath.comment:
        return '/photos';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
