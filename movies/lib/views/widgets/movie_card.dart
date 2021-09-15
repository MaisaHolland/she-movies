import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final String id;
  final void Function()? onTap;

  MovieCard({
    Key? key,
    this.height,
    this.width,
    required this.imageUrl,
    required this.id,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: this.onTap ?? () {},
        child: Hero(
          tag: this.id,
          child: Container(
            width: this.width ?? 450,
            height: this.height ?? 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset.fromDirection(15, 5))
              ],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
