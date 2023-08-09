/// data_repository
/// @author: steadyuan
/// @date: 2023/8/8
class DataRepository {
  static provideItems() => [
        {
          "title": "Layout",
          "route": "/layout",
        },
        {
          "title": "Network",
          "route": "/network",
        },
        ...List.generate(
          10,
          (index) => {
            "title": "${index + 3}",
            "route": "/${index + 3}",
          },
        ),
      ];
}
