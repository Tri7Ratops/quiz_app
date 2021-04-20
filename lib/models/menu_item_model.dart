import 'package:equatable/equatable.dart';

class MenuItemModel extends Equatable {
  final String name;
  final String category;
  final String imgPath;

  MenuItemModel({required this.name, required this.category, required this.imgPath});

  @override
  List<Object?> get props => [
        name,
        category,
        imgPath,
      ];
}
