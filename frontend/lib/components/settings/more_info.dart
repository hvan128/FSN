
import 'package:flutter/material.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    text: 'Cách mời',
                    fontSize: FontSize.z16,
                    fontWeight: FontWeight.w400,
                    color: MyColors.grey['c900']!),
                const SizedBox(height: 10),
                MyText(
                    text:
                        'Mã QR lời mời sẽ được hiển thị khi nhấn vào biểu tượng QR ở đầu trang của màn hình Giới thiệu, sau khi đăng nhập của thành viên được mời.',
                    fontSize: FontSize.z15,
                    fontWeight: FontWeight.w400,
                    color: MyColors.grey['c900']!),
                const SizedBox(height: 10),
                MyText(
                    text:
                        'Tại thời điểm này, khi Chủ sở hữu quét mã QR bằng cách sử dụng tính năng Quét mã QR trong màn hình Tủ lạnh gia đình, lời mời sẽ được gửi đi.',
                    fontSize: FontSize.z15,
                    fontWeight: FontWeight.w400,
                    color: MyColors.grey['c900']!),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {
                        Navigate.pop();
                      }, child: const Text('OK')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
