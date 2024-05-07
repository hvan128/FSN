import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/components/community/image_picker.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_field.dart';
import 'package:provider/provider.dart';

class AddFeedbackScreen extends StatefulWidget {
  const AddFeedbackScreen({super.key});

  @override
  State<AddFeedbackScreen> createState() => _AddFeedbackScreenState();
}

class _AddFeedbackScreenState extends State<AddFeedbackScreen> {
  String? selectedImagePath;
  int? dishId;

  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;
      setState(() {
        dishId = arguments['dishId'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white['c900']!,
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: uploadImage(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyTextField(
                      obscureText: false,
                      hasError: false,
                      width: MediaQuery.of(context).size.width * 0.8,
                      multipleLine: true,
                      hintText:
                          'Hãy chia sẻ với mọi người về món này của bạn nhé. Bạn đã hoàn thành nó như thế nào? Cảm nhận của bạn về món này ra sao?',
                      fontSize: FontSize.z17,
                      onChange: (value) {
                        contentController.text = value;
                      },
                      controller: contentController),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.send,
                        color: MyColors.primary['CulturalYellow']!['c700']),
                    onPressed: onSend,
                  )
                ],
              ),
            ),
          ],
        ),
        SafeArea(child: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)))
      ]),
    );
  }

  void pickerImage(Function(String) onImageSelected) {
    showDialog(
        context: context,
        builder: (context) => MyImagePicker(onImageSelected: onImageSelected));
  }

  imagePreview() {
    return Image.file(
      File(selectedImagePath!),
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }

  Widget uploadImage() {
    return selectedImagePath != null
        ? imagePreview()
        : GestureDetector(
            onTap: () {
              pickerImage((path) => setState(() {
                    selectedImagePath = path;
                  }));
            },
            child: Container(
              color: MyColors.primary['CulturalYellow']!['c50'],
              width: double.infinity,
              child: Column(children: [
                const SizedBox(height: 100),
                Image.asset('assets/images/new-food.png',
                    width: 150, color: MyColors.grey['c900']!),
                const SizedBox(height: 10),
                MyText(
                  text: 'Đăng tải thành quả nấu ăn của bạn',
                  fontSize: FontSize.z20,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c700']!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                MyText(
                  text: 'Hãy truyền cảm hứng nấu món này tới mọi người',
                  fontSize: FontSize.z15,
                  fontWeight: FontWeight.w400,
                  color: MyColors.grey['c600']!,
                ),
                const SizedBox(height: 20),
              ]),
            ),
          );
  }

  void onSend() async {
    FeedbackModel feedbackModel = FeedbackModel(
      content: contentController.text,
      image: selectedImagePath,
      userId: Provider.of<UserProvider>(context, listen: false).user!.id,
      dishId: dishId,
    );
    final result = await DishService.createFeedback(feedbackModel);
    if (result) {
      Navigate.pop();
      showDialog(context: context, builder: (context) {
        return const MyAlert(
          title: 'Thêm feedback thành công',
          description: 'Feedback của bạn không chỉ làm tăng thêm sự hấp dẫn cho bài đăng gốc mà còn giúp cộng đồng nấu ăn phát triển mạnh mẽ hơn.  ',
          alertType: AlertType.success,
        );
      });
      
    } else {
      showDialog(context: context, builder: (context) {
        return const MyAlert(
          title: 'Tạo feedback biểu thức',
          description: 'Lỗi',
          alertType: AlertType.error,
        );
      });
    }
  }
}
