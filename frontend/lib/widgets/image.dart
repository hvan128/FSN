import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';
import 'package:photo_view/photo_view.dart';

class MyImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final bool? showEdit;
  final bool? showCloseIcon;
  final Function()? onClose;
  final Function()? onEdit;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final bool? showImageDetail;
  const MyImage(
      {super.key,
      required this.url,
      this.height,
      this.width,
      this.borderRadius,
      this.fit = BoxFit.cover,
      this.showCloseIcon = true,
      this.showEdit = true,
      this.showImageDetail = true,
      this.onClose,
      this.onEdit});

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = url.startsWith('1');
    bool isFileImage = url.startsWith('/data');
    bool isAssetImage = url.startsWith('assets');
    final image = isNetworkImage
        ? Image.network(
            FunctionCore.convertImageUrl(url),
          )
        : isFileImage
            ? Image.file(File(url))
            : isAssetImage
                ? Image.asset(url)
                : Container(
                    width: width ?? 250,
                    height: height ?? 250,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius ?? BorderRadius.circular(0),
                      border: Border.all(
                        color: MyColors.grey['c400']!,
                      ),
                      color: MyColors.grey['c50']!,
                    ),
                    child: const Center(child: Icon(Icons.error_outline)));
    return Stack(
      children: [
        GestureDetector(
          onTap: () => showImage(context),
          child: ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(0),
              child: image),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Row(
            children: [
              showEdit == true
                  ? GestureDetector(
                      onTap: () => onEdit != null ? onEdit!() : null,
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: MyColors.grey['c900']!.withOpacity(0.5),
                              border: Border.all(
                                color: MyColors.grey['c300']!,
                              )),
                          child: MyText(
                            text: 'Chỉnh sửa ảnh',
                            fontSize: FontSize.z12,
                            fontWeight: FontWeight.w600,
                            color: MyColors.white['c900']!,
                          )),
                    )
                  : const SizedBox(),
              const SizedBox(width: 5),
              showCloseIcon == true
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: MyColors.grey['c900']!.withOpacity(0.5),
                          border: Border.all(
                            color: MyColors.grey['c300']!,
                          )),
                      child: MyIconButton(
                        icon: Icon(Icons.close,
                            color: MyColors.white['c900'], size: 15),
                        onPressed: () => onClose != null ? onClose!() : null,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        )
      ],
    );
  }

  void showImage(BuildContext context) {
    if (showImageDetail == true) {
      showModalBottomSheet(
          context: context,
          builder: (context) => Container(
                height: MediaQuery.of(context).size.height,
                color: MyColors.primary['CulturalYellow']!['c50']!,
                child: PhotoView(
                    imageProvider:
                        NetworkImage(FunctionCore.convertImageUrl(url))),
              ));
    }
  }
}
