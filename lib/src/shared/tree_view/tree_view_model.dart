class TreeViewModel {
  String title;
  List<TreeViewModel> children;
  String prefix;
  bool suffix;
  bool hasChildren;

  TreeViewModel({
    required this.title,
    required this.children,
    required this.prefix,
    this.suffix = false,
    this.hasChildren = true,
  });

  TreeViewModel.from(TreeViewModel other)
      : this(
          title: other.title,
          children: other.children,
          prefix: other.prefix,
          suffix: other.suffix,
          hasChildren: other.hasChildren,
        );
}
