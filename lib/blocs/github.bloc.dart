import 'package:flutter_github/models/github.model.dart';
import 'package:flutter_github/repositories/github.service.dart';
import 'package:rxdart/rxdart.dart';

class GithubBloc {
  GithubService _service = GithubService();

  final BehaviorSubject<String> _controller = BehaviorSubject<String>();
  Observable<String> get searchOutput => _controller.stream;
  Sink get searchInput => _controller.sink;

  Observable<GithubModel> githubData;

  GithubBloc() {
    githubData = searchOutput
        .distinct()
        .where((value) => value.length > 2)
        .debounce((v) => TimerStream(v, const Duration(seconds: 1)))
        .switchMap((s) => Observable.just(s))
        .asyncMap(_service.getRepositories);
  }

  void dispose() {
    _controller.close();
  }
}
