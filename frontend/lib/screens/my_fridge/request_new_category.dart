import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/config.dart';
import 'package:frontend/screens/my_fridge/my_fridge_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_area.dart';

class RequestNewCategoryScreen extends StatefulWidget {
  const RequestNewCategoryScreen({super.key});

  @override
  State<RequestNewCategoryScreen> createState() =>
      _RequestNewCategoryScreenState();
}

class _RequestNewCategoryScreenState extends State<RequestNewCategoryScreen> {
  String? name;
  String? description;
  bool nameHasError = false;
  bool descriptionHasError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
        child: Column(
          children: [
            MyHeader(
              bgUnderColor: MyColors.primary['CulturalYellow']!['c50']!,
              bgColor: MyColors.white['c900']!,
              title: 'Gửi yêu cầu',
              disableRightButton: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Yêu cầu Biểu tượng',
                        fontWeight: FontWeight.w800,
                        color: MyColors.grey['c800']!,
                        fontSize: FontSize.z20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyText(
                        text:
                            'Hãy điền thông tin bên dưới để yêu cầu chúng tôi thêm các biểu tượng bạn muốn sử dụng trong iFridge.',
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c700']!,
                        fontSize: FontSize.z15,
                      ),
                      MyText(
                        text:
                            'Chúng tôi sẽ nỗ lực hết mình để mang đến trải nghiệm tuyệt vời bằng cách thêm nhiều biểu tượng theo yêu cầu của bạn. Yêu cầu của bạn sẽ được gửi đi ẩn danh.',
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c700']!,
                        fontSize: FontSize.z15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyText(
                        text: 'Tên biểu tượng thực phẩm mà bạn cần là gì?',
                        fontWeight: FontWeight.w600,
                        color: MyColors.grey['c900']!,
                        fontSize: FontSize.z16,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextArea(
                          hasError: nameHasError,
                          hintText: 'Vui này nhập tên thực phẩm',
                          maxLength: 50,
                          onChange: (p0) {
                            setState(() {
                              name = p0;
                              nameHasError = name == null || name!.isEmpty;
                            });
                          },
                          label: 'Nhập tên thực phẩm'),
                      const SizedBox(
                        height: 20,
                      ),
                      MyText(
                        text:
                            'Hãy cung cấp mô tả về loại thực phẩm đó! Nếu bạn có bất kỳ thông tin nào giúp chúng tôi hiểu rõ hơn về loại thực phẩm này, xin vui lòng chia sẻ.',
                        fontWeight: FontWeight.w600,
                        color: MyColors.grey['c900']!,
                        fontSize: FontSize.z16,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextArea(
                          hasError: descriptionHasError,
                          hintText: 'Vui lòng nhập mô tả về thực phẩm',
                          maxLength: 200,
                          onChange: (p0) {
                            setState(() {
                              description = p0;
                              descriptionHasError =
                                  description == null || description!.isEmpty;
                            });
                          },
                          label: 'Nhập mô tả về thực phẩm'),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            MyButton(
                              text: 'Gửi',
                              onPressed: onPressSentRequest,
                              width: 200,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPressSentRequest() {
    if (name == null || name!.isEmpty) {
      setState(() {
        nameHasError = true;
      });
    }
    if (description == null || description!.isEmpty) {
      setState(() {
        descriptionHasError = true;
      });
    }
    if (name != null &&
        name!.isNotEmpty &&
        description != null &&
        description!.isNotEmpty) {
      setState(() {
        nameHasError = false;
        descriptionHasError = false;
      });
      ApiService.post(
              Config.REQUEST_API, {"name": name, "description": description})
          .then((value) => {
                print('value: $value'),
                if (jsonDecode(value.toString())['message'] == 'Success')
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: MyColors.green['EmeraldGreen']!['c800']!,
                      content: MyText(
                        text: 'Gửi yêu cầu thành công!',
                        color: MyColors.green['EmeraldGreen']!['c800']!,
                        fontSize: FontSize.z15,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const MyFridgeScreen()),
                        (route) => false)
                  }
                else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: MyColors.support['Error']!['c50']!,
                      content: MyText(
                        text: 'Hệ thống đang quá tải, vui lòng thử lại sau!',
                        color: MyColors.support['Error']!['c500']!,
                        fontSize: FontSize.z15,
                        fontWeight: FontWeight.w400,
                      ),
                    ))
                  }
              });
    }
  }
}
