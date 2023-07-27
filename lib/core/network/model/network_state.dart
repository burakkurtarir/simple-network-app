sealed class NetworkState {
  const NetworkState();
}

final class InitialState extends NetworkState {
  const InitialState();
}

final class LoadingState extends NetworkState {
  const LoadingState();
}

final class SuccessState extends NetworkState {
  const SuccessState();
}

final class ErrorState extends NetworkState {
  const ErrorState(this._message);

  final String? _message;

  String get message => _message ?? "The request connection error unknown.";
}
