class TreeViewModel {
  String title;
  List<TreeViewModel> children;

  TreeViewModel({
    required this.title,
    required this.children,
  });

  TreeViewModel.from(TreeViewModel other)
      : this(
          title: other.title,
          children: other.children,
        );
}
