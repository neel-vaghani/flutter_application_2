import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
      height: 22,
      width: 22,
    );
  }
}
