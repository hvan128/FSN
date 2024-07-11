import 'package:frontend/models/category/category.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/types/type.dart';

List<Category> fruits = [
  Category(
      label: 'Táo',
      value: 'tao',
      icon: 'assets/icons/fruits/tao.png',
      type: 'fruits',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Có thể ngăn ngừa bệnh Alzheimer.\n'
          '- Giúp thông minh và tỉnh táo.\n'
          '- Là nguồn giàu flavonoid và polyphenol, cả hai đều là chất chống oxy hóa mạnh. Giảm nguy cơ ung thư phổi, ung thư bàng quang, đột quỵ và bệnh tim.\n'
          '- Ngăn ngừa nếp nhăn và tổn thương da. Giúp duy trì vẻ trẻ trung và năng động.\n'
          '- Chứa flavonoid giúp cải thiện chức năng phổi, giảm các trường hợp ho và khó thở, có thể hạ cholesterol.\n\n'
          'Ăn uống\n\n'
          '- Ăn quả táo cùng với vỏ. Vỏ táo chứa pectin có thể giúp loại bỏ các chất độc hại ra khỏi cơ thể.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản táo trong tủ lạnh để kéo dài thời gian sử dụng.\n'
          '- Một quả táo hỏng có thể làm hỏng cả đám, vì vậy hãy ăn những quả bị dập trước!\n'
          '- Để bảo quản lâu hơn, hãy để táo trong hộp các tông và đậy bằng một chiếc khăn ẩm.'),
  Category(
      label: 'Cam',
      value: 'cam',
      icon: 'assets/icons/fruits/cam.png',
      type: 'fruits',
      defaultDuration: 28,
      note: 'Sức khỏe\n\n'
          '- Cam là nguồn giàu vitamin C, giúp tăng cường hệ miễn dịch và chống oxi hóa.\n'
          '- Chứa beta-carotene và lutein, giúp bảo vệ mắt và giảm nguy cơ mắc các bệnh mắt liên quan đến tuổi già.\n'
          '- Có chất chống viêm và chất chống oxy hóa giúp làm giảm nguy cơ mắc bệnh tim và đột quỵ.\n'
          '- Giàu chất xơ, giúp cải thiện tiêu hóa và hỗ trợ sự phát triển của vi khuẩn có lợi trong ruột.\n\n'
          'Ăn uống\n\n'
          '- Ăn cam tươi nguyên hoặc ép thành nước cam để tận hưởng tối đa lợi ích dinh dưỡng.\n'
          '- Có thể sử dụng cam để làm nước ép, sinh tố, hoặc làm nguyên liệu cho các món tráng miệng.\n'
          '- Vỏ cam cũng có thể được sử dụng để làm mứt hoặc làm gia vị cho các món nấu ăn.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản cam ở nhiệt độ phòng nếu dùng trong vài ngày.\n'
          '- Để cam lâu hơn, bảo quản trong tủ lạnh. Tránh để cam tiếp xúc trực tiếp với không khí để tránh khô và mất chất dinh dưỡng.\n'
          '- Nếu không sử dụng hết, có thể lột vỏ, cắt thành từng lát và bảo quản trong hộp đựng thực phẩm kín để giữ tươi lâu hơn.'),
  Category(
      label: 'Dâu tây',
      value: 'dau-tay',
      icon: 'assets/icons/fruits/dau-tay.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Dâu tây là nguồn giàu vitamin C và kali, giúp tăng cường hệ miễn dịch và duy trì huyết áp ổn định.\n'
          '- Chứa chất chống oxy hóa như anthocyanin giúp ngăn ngừa sự lão hóa và bảo vệ tế bào khỏi tổn thương.\n'
          '- Có chất chống viêm và chất xơ, giúp cải thiện chức năng tiêu hóa và giảm nguy cơ bệnh tim mạch.\n'
          '- Dâu tây cũng là nguồn beta-carotene, lutein và zeaxanthin, tốt cho sức khỏe mắt.\n\n'
          'Ăn uống\n\n'
          '- Ăn dâu tây tươi nguyên hoặc dùng làm nguyên liệu cho các món tráng miệng như bánh, sinh tố.\n'
          '- Dâu tây hấp dẫn khi kết hợp với sữa chua, kem tươi, hay socola.\n'
          '- Có thể làm dâu tây đông lạnh để bảo quản và sử dụng dài hạn.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản dâu tây trong ngăn mát của tủ lạnh và chỉ rửa lại khi sử dụng để tránh làm mất chất dinh dưỡng và giữ độ tươi.\n'
          '- Nếu không dùng hết, có thể đông lạnh dâu tây sau khi đã rửa sạch và cắt bỏ phần xấu.'),
  Category(
      label: 'Chuối',
      value: 'chuoi',
      icon: 'assets/icons/fruits/chuoi.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Chứa nhiều kali giúp cân bằng huyết áp, hỗ trợ chức năng tim mạch và ngăn ngừa đột quỵ.\n'
          '- Chứa vitamin B6 cần thiết cho chức năng não và sản xuất serotonin, giúp cải thiện tâm trạng và giấc ngủ.\n'
          '- Là nguồn giàu chất xơ giúp cải thiện tiêu hóa và giảm nguy cơ bệnh tim mạch.\n'
          '- Giúp kiểm soát cân nặng vì chuối tạo cảm giác no lâu.\n'
          '- Chứa chất chống oxy hóa mạnh mẽ, bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 89 calo trên 100 gram chuối.\n\n'
          'Ăn uống\n\n'
          '- Ăn chuối tươi, có thể kết hợp với các món ăn khác như sữa chua, ngũ cốc, hoặc dùng làm sinh tố.\n'
          '- Có thể dùng chuối chín để làm bánh mì chuối, bánh ngọt, hoặc làm nguyên liệu cho các món tráng miệng.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản chuối ở nhiệt độ phòng cho đến khi chín.\n'
          '- Khi chuối đã chín, có thể cho vào tủ lạnh để kéo dài thời gian sử dụng. Vỏ chuối sẽ chuyển màu đen, nhưng bên trong vẫn giữ được chất lượng.\n'
          '- Để chuối chín nhanh hơn, đặt chúng vào túi giấy cùng với một quả táo hoặc quả lê.\n'
          '- Nếu không dùng hết, có thể lột vỏ và cắt chuối thành từng lát rồi bảo quản trong ngăn đá để dùng sau.'),
  Category(
      label: 'Đu đủ',
      value: 'du-du',
      icon: 'assets/icons/fruits/du-du.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Đu đủ là nguồn giàu vitamin C và A, tốt cho sức khỏe mắt và hệ miễn dịch.\n'
          '- Chứa enzyme papain giúp tiêu hóa tốt hơn và hỗ trợ quá trình giảm cân.\n'
          '- Đu đủ có tính kháng viêm và chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn đu đủ tươi hoặc dùng làm nguyên liệu cho các món salad, sinh tố.\n'
          '- Có thể ướp chút muối và chanh lên miếng đu đủ để làm món ăn vặt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản đu đủ trong ngăn mát của tủ lạnh sau khi đã bóc vỏ và cắt ra thành từng miếng nhỏ.\n'
          '- Nếu không dùng hết, có thể đóng kín lại và để trong tủ lạnh để giữ độ tươi lâu hơn.'),
  Category(
      label: 'Đào',
      value: 'dao',
      icon: 'assets/icons/fruits/dao.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Đào là nguồn giàu vitamin A và C, giúp tăng cường hệ miễn dịch và chống oxy hóa.\n'
          '- Chứa chất xơ giúp cải thiện tiêu hóa và giảm cảm giác thèm ăn.\n'
          '- Đào có tính kiềm và kali, hỗ trợ cân bằng nước và điện giải cơ thể.\n\n'
          'Ăn uống\n\n'
          '- Ăn đào tươi nguyên hoặc dùng làm nguyên liệu cho các món tráng miệng như bánh, nước ép.\n'
          '- Đào hấp dẫn khi kết hợp với sữa chua hoặc kem tươi.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản đào trong ngăn mát của tủ lạnh và chỉ rửa lại khi sử dụng để giữ độ tươi.\n'
          '- Nếu không dùng hết, có thể đông lạnh đào sau khi đã cắt bỏ hạt.'),
  Category(
      label: 'Ô liu',
      value: 'o-liu',
      icon: 'assets/icons/fruits/o-liu.png',
      type: 'fruits',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Ô liu là nguồn giàu chất béo tốt cho tim mạch và não bộ.\n'
          '- Chứa polyphenol và vitamin E, có tác dụng chống oxy hóa và giảm nguy cơ mắc bệnh tim mạch.\n'
          '- Ô liu cũng có tính chống viêm và hỗ trợ hệ tiêu hóa.\n\n'
          'Ăn uống\n\n'
          '- Ăn ô liu tươi hoặc dùng làm nguyên liệu cho các món nấu ăn, salad.\n'
          '- Ô liu được sử dụng rộng rãi trong ẩm thực Địa Trung Hải và có thể ướp muối hoặc làm mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản ô liu trong hũ đựng kín và nơi khô ráo, tránh ánh nắng trực tiếp.\n'
          '- Nếu mua ô liu đông khô, có thể bảo quản ở nhiệt độ phòng hoặc trong tủ lạnh để giữ độ tươi.'),
  Category(
      label: 'Vải',
      value: 'vai',
      icon: 'assets/icons/fruits/vai.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Vải là nguồn giàu vitamin C và chất chống oxy hóa, giúp tăng cường hệ miễn dịch và bảo vệ tế bào khỏi tổn thương.\n'
          '- Chứa chất xơ giúp cải thiện tiêu hóa và giảm cảm giác thèm ăn.\n'
          '- Vải cũng có chứa các khoáng chất như kali và mangan, hỗ trợ điều hòa nước và điện giải cơ thể.\n\n'
          'Ăn uống\n\n'
          '- Ăn vải tươi nguyên hoặc dùng làm nguyên liệu cho các món tráng miệng như sinh tố, salad.\n'
          '- Vải rất hợp khi ăn kèm với sữa chua hoặc kem tươi.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản vải trong ngăn mát của tủ lạnh và chỉ rửa lại khi sử dụng để giữ độ tươi.\n'
          '- Nếu không dùng hết, có thể đông lạnh vải sau khi đã rửa sạch và cắt bỏ phần xấu.'),
  Category(
      label: 'Việt quất',
      value: 'viet-quat',
      icon: 'assets/icons/fruits/viet-quat.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Việt quất là nguồn giàu vitamin C, K và chất chống oxy hóa như anthocyanin, giúp cải thiện thị lực và bảo vệ mắt khỏi các bệnh lão hóa.\n'
          '- Chứa chất xơ giúp cải thiện tiêu hóa và hỗ trợ sự phát triển của vi khuẩn có lợi trong ruột.\n'
          '- Việt quất có tính kháng viêm và giảm nguy cơ mắc các bệnh tim mạch.\n\n'
          'Ăn uống\n\n'
          '- Ăn việt quất tươi nguyên hoặc dùng làm nguyên liệu cho các món tráng miệng như bánh, nước ép.\n'
          '- Việt quất rất thích hợp để làm thành phẩm như mứt, nước ép, hoặc sử dụng trong các công thức nấu ăn phổ biến.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản việt quất trong ngăn mát của tủ lạnh và chỉ rửa lại khi sử dụng để giữ độ tươi.\n'
          '- Nếu không dùng hết, có thể đông lạnh việt quất để bảo quản lâu dài.'),
  Category(
      label: 'Táo xanh',
      value: 'tao-xanh',
      icon: 'assets/icons/fruits/tao-xanh.png',
      type: 'fruits',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Táo xanh chứa nhiều chất xơ giúp cải thiện tiêu hóa và hỗ trợ giảm cân.\n'
          '- Là nguồn giàu vitamin C, K và chất chống oxy hóa, giúp tăng cường hệ miễn dịch và bảo vệ tế bào khỏi tổn thương.\n'
          '- Táo xanh có tính kiềm và chứa kali, hỗ trợ cân bằng nước và điện giải cơ thể.\n\n'
          'Ăn uống\n\n'
          '- Ăn táo xanh tươi nguyên hoặc dùng làm nguyên liệu cho các món tráng miệng như bánh, salad.\n'
          '- Táo xanh có thể được ướp chút muối và chanh trước khi ăn để làm món ăn vặt hấp dẫn.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản táo xanh trong ngăn mát của tủ lạnh và chỉ rửa lại khi sử dụng để giữ độ tươi.\n'
          '- Nếu không dùng hết, có thể đông lạnh táo xanh sau khi đã cắt bỏ hạt và vỏ.'),
  Category(
      label: 'Táo Tàu',
      value: 'tao-tau',
      icon: 'assets/icons/fruits/tao-tau.png',
      type: 'fruits',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Táo Tàu là một nguồn giàu chất xơ và vitamin C.\n'
          '- Giúp cải thiện hệ tiêu hóa và hỗ trợ hệ miễn dịch.\n'
          '- Có chứa chất chống oxy hóa giúp ngăn ngừa lão hóa sớm.\n'
          '- Hàm lượng calo: Khoảng 52 calo trên 100 gram Táo Tàu.\n\n'
          'Ăn uống\n\n'
          '- Ăn Táo Tàu tươi để tận hưởng hương vị ngọt ngào và sảng khoái.\n'
          '- Thích hợp để làm thành sinh tố hoặc chế biến thành mứt, nước ép.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản Táo Tàu ở nhiệt độ phòng để giữ được độ tươi ngon.\n'
          '- Để Táo Tàu chín nhanh chóng, có thể cho vào túi giấy cùng với một quả táo hoặc quả lê.'),
  Category(
      label: 'Khế',
      value: 'khe',
      icon: 'assets/icons/fruits/khe.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Khế giàu vitamin C và A, có tác dụng tăng cường hệ miễn dịch và duy trì làn da khỏe mạnh.\n'
          '- Chất chống oxy hóa trong Khế giúp bảo vệ cơ thể khỏi tổn thương.\n'
          '- Có hàm lượng calo thấp, giúp kiểm soát cân nặng.\n\n'
          'Ăn uống\n\n'
          '- Ăn Khế tươi để tận hưởng hương vị chua ngọt đặc trưng.\n'
          '- Dùng làm thành nước ép hoặc trang trí trên các món tráng miệng.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản Khế ở nhiệt độ phòng để giữ được độ tươi ngon.\n'
          '- Không nên để Khế trong tủ lạnh quá lâu vì có thể làm giảm chất lượng và mất đi mùi vị tự nhiên.'),
  Category(
      label: 'Sầu Riêng',
      value: 'sau-rieng',
      icon: 'assets/icons/fruits/sau-rieng.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Sầu Riêng chứa nhiều chất dinh dưỡng như kali, magiê và vitamin C.\n'
          '- Giúp cung cấp năng lượng cho cơ thể và cải thiện hệ tiêu hóa.\n'
          '- Có tác dụng làm mát cơ thể và giảm các triệu chứng mệt mỏi.\n\n'
          'Ăn uống\n\n'
          '- Ăn Sầu Riêng tươi để tận hưởng hương vị đặc trưng và thơm ngon.\n'
          '- Dùng làm thành sinh tố hoặc pha chế các món tráng miệng như kem Sầu Riêng.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản Sầu Riêng ở nhiệt độ phòng để giữ được độ tươi ngon.\n'
          '- Khi chín, Sầu Riêng có thể để trong tủ lạnh để bảo quản lâu hơn, nhưng nên ăn ngay khi có thể để tránh mất đi hương vị.'),
  Category(
      label: 'Lựu',
      value: 'luu',
      icon: 'assets/icons/fruits/luu.png',
      type: 'fruits',
      defaultDuration: 21,
      note: 'Sức khỏe\n\n'
          '- Lựu giàu chất chống oxy hóa, giúp ngăn ngừa sự lão hóa sớm.\n'
          '- Cung cấp nhiều vitamin C, tăng cường hệ miễn dịch và giảm nguy cơ bệnh nhiễm trùng.\n'
          '- Chất chống oxy hóa trong lựu có thể giúp giảm nguy cơ mắc các bệnh tim mạch và ung thư.\n'
          '- Lựu có thể giúp kiểm soát lượng cholesterol trong máu và hỗ trợ sức khỏe tim mạch.\n\n'
          'Ăn uống\n\n'
          '- Ăn hạt lựu cùng với những hạt nhỏ chứa nhiều chất dinh dưỡng.\n'
          '- Lựu thường được sử dụng để làm nước ép hoặc trang trí trong các món salad và món ăn khác.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản lựu trong tủ lạnh để kéo dài thời gian sử dụng.\n'
          '- Có thể bảo quản hạt lựu đã tách ra trong hộp đựng kín để dùng dần.'),
  Category(
      label: 'Xoài',
      value: 'xoai',
      icon: 'assets/icons/fruits/xoai.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Xoài chứa nhiều vitamin C và A, giúp củng cố hệ miễn dịch và duy trì sức khỏe mắt.\n'
          '- Cung cấp kali và magiê, hỗ trợ chức năng cơ bắp và điều hòa nhịp tim.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ táo bón.\n'
          '- Chứa chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương do các gốc tự do.\n\n'
          'Ăn uống\n\n'
          '- Ăn xoài tươi trực tiếp, có thể cắt lát hoặc làm thành sinh tố.\n'
          '- Xoài cũng được sử dụng để làm mứt, chutney và các món ăn truyền thống khác.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản xoài chín trong tủ lạnh để giữ nguyên hương vị và chất lượng.\n'
          '- Nếu muốn bảo quản lâu hơn, có thể đóng gói xoài đã lột vỏ vào túi ni lông và đặt trong ngăn đá của tủ lạnh.'),
  Category(
      label: 'Ổi',
      value: 'oi',
      icon: 'assets/icons/fruits/oi.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Ổi là nguồn giàu vitamin C, giúp tăng cường hệ miễn dịch và chống viêm.\n'
          '- Chứa nhiều chất xơ, giúp cải thiện tiêu hóa và ổn định đường huyết.\n'
          '- Cung cấp kali và magiê, hỗ trợ sức khỏe tim mạch và chức năng cơ bắp.\n'
          '- Là nguồn giàu chất chống oxy hóa, giúp ngăn ngừa tổn thương tế bào do các gốc tự do.\n\n'
          'Ăn uống\n\n'
          '- Ăn ổi tươi trực tiếp, có thể cắt lát hoặc dùng trong các món tráng miệng và salad.\n'
          '- Ổi cũng được sử dụng để làm nước ép hoặc mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản ổi trong tủ lạnh để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể đóng gói ổi đã lột vỏ vào túi ni lông và bảo quản trong ngăn đá.'),
  Category(
      label: 'Chôm chôm',
      value: 'chom-chom',
      icon: 'assets/icons/fruits/chom-chom.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Chôm chôm giàu vitamin C, giúp tăng cường hệ miễn dịch và chống oxy hóa.\n'
          '- Cung cấp kali và magiê, hỗ trợ sức khỏe tim mạch và chức năng cơ bắp.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và ổn định đường huyết.\n'
          '- Chôm chôm có tính năng chống viêm và bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn chôm chôm tươi ngon nhất, có thể bóc vỏ và ăn trực tiếp hoặc chế biến thành nước ép.\n'
          '- Chôm chôm cũng được sử dụng để làm mứt hoặc làm thành phần trong các món tráng miệng và salad.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản chôm chôm trong tủ lạnh để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể đóng gói chôm chôm đã lột vỏ vào túi ni lông và bảo quản trong ngăn đá.'),
  Category(
      label: 'Bơ',
      value: 'bo',
      icon: 'assets/icons/fruits/bo.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Bơ chứa nhiều chất béo không bão hòa đơn và chất béo omega-3, tốt cho sức khỏe tim mạch.\n'
          '- Cung cấp nhiều kali và vitamin E, hỗ trợ sức khỏe cơ bắp và làm chậm quá trình lão hóa.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và ổn định đường huyết.\n'
          '- Bơ cũng chứa lượng lớn chất chống oxy hóa, bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn bơ tươi, có thể cắt lát hoặc làm bơ sữa để ăn cùng bánh mì.\n'
          '- Bơ cũng được sử dụng để làm sốt, salad và các món tráng miệng khác.\n\n'
          'Bảo quản\n\n'
          '- Bơ chín có thể bảo quản trong tủ lạnh để giữ nguyên chất lượng.\n'
          '- Nếu không dùng hết, có thể lấy hạt bơ ra và bảo quản trong túi ni lông để ngăn đông.'),
  Category(
      label: 'Thanh long',
      value: 'thanh-long',
      icon: 'assets/icons/fruits/thanh-long.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Thanh long là nguồn giàu vitamin C và vitamin B, hỗ trợ hệ miễn dịch và tăng cường năng lượng.\n'
          '- Chứa nhiều chất xơ, giúp cải thiện tiêu hóa và ổn định đường huyết.\n'
          '- Thanh long có tính năng làm mát cơ thể và giảm cân.\n'
          '- Là nguồn giàu chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn thanh long tươi ngon nhất, có thể ăn trực tiếp hoặc làm thành sinh tố.\n'
          '- Thanh long cũng được sử dụng để làm mứt hoặc làm thành phần trong các món tráng miệng và salad.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản thanh long trong tủ lạnh để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể đóng gói thanh long đã lột vỏ vào túi ni lông và bảo quản trong ngăn đá.'),
  Category(
      label: 'Sung',
      value: 'sung',
      icon: 'assets/icons/fruits/sung.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Sung là nguồn giàu vitamin A và C, hỗ trợ sức khỏe mắt và tăng cường hệ miễn dịch.\n'
          '- Cung cấp kali và magiê, giúp duy trì huyết áp và chức năng cơ bắp.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ bệnh tim mạch.\n'
          '- Chứa chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn sung tươi ngon nhất để tận hưởng hương vị và chất dinh dưỡng.\n'
          '- Sung cũng được dùng làm thành phần trong các món salad và chế biến thành nước ép.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản sung trong tủ lạnh để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể đóng gói sung đã lột vỏ vào túi ni lông và bảo quản trong ngăn đá.'),
  Category(
      label: 'Nho tím',
      value: 'nho-tim',
      icon: 'assets/icons/fruits/nho-tim.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Nho tím chứa nhiều chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Cung cấp nhiều vitamin C và K, hỗ trợ sức khỏe xương và hệ miễn dịch.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và ổn định đường huyết.\n'
          '- Nho tím có tính năng làm mát cơ thể và giảm cân.\n\n'
          'Ăn uống\n\n'
          '- Ăn nho tím tươi ngon nhất, có thể ăn trực tiếp hoặc làm thành nước ép.\n'
          '- Nho tím cũng được sử dụng trong các món salad và làm mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản nho tím trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Có thể bảo quản nho tím đã rửa sạch trong ngăn tủ lạnh.'),
  Category(
      label: 'Mọng',
      value: 'mong',
      icon: 'assets/icons/fruits/mong.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Mọng là nguồn giàu vitamin C, giúp tăng cường hệ miễn dịch và chống oxy hóa.\n'
          '- Cung cấp kali và magiê, hỗ trợ sức khỏe tim mạch và điều hòa huyết áp.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ bệnh đường ruột.\n'
          '- Mọng có tính năng làm mát cơ thể và giảm cân.\n\n'
          'Ăn uống\n\n'
          '- Ăn mọng tươi ngon nhất, có thể ăn trực tiếp hoặc chế biến thành nước ép.\n'
          '- Mọng cũng được sử dụng trong các món salad và làm mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản mọng trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Có thể bảo quản mọng đã rửa sạch trong ngăn tủ lạnh.'),
  Category(
      label: 'Mơ',
      value: 'mo',
      icon: 'assets/icons/fruits/mo.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Mơ là nguồn giàu vitamin A và C, giúp tăng cường hệ miễn dịch và duy trì sức khỏe da.\n'
          '- Cung cấp nhiều kali và magiê, hỗ trợ sức khỏe tim mạch và điều hòa huyết áp.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ bệnh đường ruột.\n'
          '- Mơ cũng chứa lượng lớn chất chống oxy hóa, bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn mơ tươi ngon nhất, có thể ăn trực tiếp hoặc chế biến thành nước ép.\n'
          '- Mơ cũng được sử dụng làm thành phần trong các món salad và chế biến thành mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản mơ trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể bảo quản mơ đã lột vỏ trong ngăn tủ lạnh.'),
  Category(
      label: 'Măng cụt',
      value: 'mang-cut',
      icon: 'assets/icons/fruits/mang-cut.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Măng cụt là nguồn giàu vitamin C và chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Cung cấp kali và magiê, hỗ trợ sức khỏe tim mạch và điều hòa huyết áp.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ bệnh đường ruột.\n'
          '- Măng cụt có tính năng làm mát cơ thể và giảm cân.\n\n'
          'Ăn uống\n\n'
          '- Ăn măng cụt tươi ngon nhất, có thể ăn trực tiếp hoặc chế biến thành nước ép.\n'
          '- Măng cụt cũng được sử dụng trong các món salad và chế biến thành mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản măng cụt trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể bảo quản măng cụt đã lột vỏ trong ngăn tủ lạnh.'),
  Category(
      label: 'Kiwi',
      value: 'kiwi',
      icon: 'assets/icons/fruits/kiwi.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Kiwi là nguồn giàu vitamin C, giúp tăng cường hệ miễn dịch và duy trì sức khỏe da.\n'
          '- Cung cấp nhiều chất xơ, giúp cải thiện tiêu hóa và ổn định đường huyết.\n'
          '- Kiwi chứa nhiều chất chống oxy hóa, bảo vệ tế bào khỏi tổn thương.\n'
          '- Là nguồn giàu kali và magiê, hỗ trợ sức khỏe tim mạch và điều hòa huyết áp.\n\n'
          'Ăn uống\n\n'
          '- Ăn kiwi tươi ngon nhất, có thể cắt lát hoặc chế biến thành sinh tố.\n'
          '- Kiwi cũng được sử dụng trong các món salad và làm mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản kiwi trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể bảo quản kiwi đã lột vỏ trong ngăn tủ lạnh.'),
  Category(
      label: 'Hồng',
      value: 'hong',
      icon: 'assets/icons/fruits/hong.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Hồng là nguồn cung cấp chất chống oxy hóa và vitamin C.\n'
          '- Giúp tăng cường hệ miễn dịch và bảo vệ cơ thể khỏi các bệnh nhiễm trùng.\n'
          '- Có hàm lượng calo thấp, phù hợp cho chế độ ăn kiêng.\n\n'
          'Ăn uống\n\n'
          '- Ăn Hồng tươi để tận hưởng hương vị ngọt ngào và thơm mát.\n'
          '- Dùng làm thành nước ép hoặc trang trí trên các món salad.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản Hồng ở nhiệt độ phòng để giữ được độ tươi ngon.\n'
          '- Không nên để Hồng ở nơi có độ ẩm cao để tránh nhanh hư.'),
  Category(
      label: 'Dứa',
      value: 'dua',
      icon: 'assets/icons/fruits/duas.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Dứa giàu vitamin C và chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có chứa enzyme bromelain giúp tiêu hóa và làm dịu viêm.\n\n'
          'Ăn uống\n\n'
          '- Ăn Dứa tươi để tận hưởng hương vị chua ngọt đặc trưng.\n'
          '- Thích hợp để chế biến thành mứt, nước ép hoặc sử dụng trong các món tráng miệng.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản Dứa trong ngăn mát tủ lạnh để kéo dài thời gian sử dụng.\n'
          '- Cắt Dứa thành từng lát và bảo quản trong hộp đựng kín để tránh bị oxi hóa.'),
  Category(
      label: 'Anh đào',
      value: 'anh-dao',
      icon: 'assets/icons/fruits/anh-dao.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Anh Đào là nguồn giàu vitamin C và A, giúp tăng cường thị lực và làm đẹp da.\n'
          '- Chứa chất chống oxy hóa, giúp ngăn ngừa lão hóa sớm.\n\n'
          'Ăn uống\n\n'
          '- Ăn Anh Đào tươi để tận hưởng hương vị ngọt dịu và giòn ngon.\n'
          '- Dùng làm thành nước ép hoặc trang trí trên các món tráng miệng.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản Anh Đào trong ngăn mát tủ lạnh để giữ được độ tươi ngon.\n'
          '- Không nên để Anh Đào ở nơi có nhiệt độ cao để tránh nhanh chóng chín mọng.'),
  Category(
      label: 'Quả nho',
      value: 'quan-thoai',
      icon: 'assets/icons/fruits/quan-thoai.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Quả nho là nguồn giàu vitamin C và chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Cung cấp kali và magiê, hỗ trợ sức khỏe tim mạch và điều hòa huyết áp.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ bệnh đường ruột.\n'
          '- Quả nho cũng giúp làm mát cơ thể và giảm cân.\n\n'
          'Ăn uống\n\n'
          '- Ăn quả nho tươi ngon nhất, có thể ăn trực tiếp hoặc chế biến thành nước ép.\n'
          '- Quả nho cũng được sử dụng trong các món salad và chế biến thành mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản quả nho trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể bảo quản quả nho đã rửa sạch trong ngăn tủ lạnh.'),
  Category(
      label: 'Mận',
      value: 'man',
      icon: 'assets/icons/fruits/man.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Mận là nguồn giàu vitamin C và A, giúp tăng cường hệ miễn dịch và duy trì sức khỏe da.\n'
          '- Cung cấp kali và magiê, hỗ trợ sức khỏe tim mạch và điều hòa huyết áp.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ bệnh đường ruột.\n'
          '- Mận cũng chứa nhiều chất chống oxy hóa, bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn mận tươi ngon nhất, có thể ăn trực tiếp hoặc chế biến thành nước ép.\n'
          '- Mận cũng được sử dụng trong các món salad và chế biến thành mứt.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản mận trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể bảo quản mận đã rửa sạch trong ngăn tủ lạnh.'),
  Category(
      label: 'Dưa vàng',
      value: 'dua-vang',
      icon: 'assets/icons/fruits/dua-vang.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Dưa vàng là nguồn giàu vitamin C, giúp tăng cường hệ miễn dịch và duy trì sức khỏe da.\n'
          '- Cung cấp nhiều nước, giúp cơ thể giữ được độ ẩm cần thiết.\n'
          '- Là nguồn giàu chất xơ, giúp cải thiện tiêu hóa và ổn định đường huyết.\n'
          '- Dưa vàng cũng chứa chất chống oxy hóa, bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn dưa vàng tươi ngon nhất, có thể ăn trực tiếp hoặc chế biến thành mứt.\n'
          '- Dưa vàng cũng được sử dụng trong các món salad và làm nguyên liệu cho các món tráng miệng.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản dưa vàng trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể bảo quản dưa vàng đã rửa sạch trong ngăn tủ lạnh.'),
  Category(
    label: 'Lê',
    value: 'le',
    icon: 'assets/icons/fruits/le.png',
    type: 'fruits',
    defaultDuration: 14,
    note: 'Sức khỏe\n\n'
        '- Giàu chất xơ, giúp cải thiện tiêu hóa và ngăn ngừa táo bón.\n'
        '- Chứa nhiều vitamin C và K, giúp tăng cường hệ miễn dịch và bảo vệ tế bào khỏi tổn thương.\n'
        '- Có chất chống oxy hóa giúp giảm nguy cơ mắc bệnh tim và ung thư.\n'
        '- Chứa chất chống viêm, có thể giúp giảm viêm và đau khớp.\n'
        '- Giúp kiểm soát cân nặng, vì quả lê có lượng calo thấp nhưng lại tạo cảm giác no lâu.\n'
        '- Quả lê chứa khoảng 0.57 calo mỗi gram.\n\n'
        'Ăn uống\n\n'
        '- Có thể ăn trực tiếp hoặc chế biến thành nhiều món ăn khác nhau như salad, nước ép, và mứt.\n'
        '- Nên ăn lê cùng với vỏ để tận dụng hết các chất dinh dưỡng và chất xơ.\n\n'
        'Bảo quản\n\n'
        '- Bảo quản quả lê ở nhiệt độ phòng nếu bạn muốn chúng chín nhanh hơn.\n'
        '- Để kéo dài thời gian sử dụng, hãy bảo quản trong tủ lạnh.\n'
        '- Kiểm tra thường xuyên và loại bỏ những quả lê bị dập hoặc hỏng để tránh lây lan đến các quả khác.',
  ),
  Category(
      label: 'Nhãn',
      value: 'nhan',
      icon: 'assets/icons/fruits/nhan.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Nhãn là nguồn giàu vitamin C và A, giúp tăng cường hệ miễn dịch và duy trì sức khỏe da.\n'
          '- Nhãn chứa nhiều chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ bệnh đường ruột.\n'
          '- Là nguồn giàu kali và magiê, hỗ trợ sức khỏe tim mạch và điều hòa huyết áp.\n'
          '- Nhãn cũng có tính năng làm mát cơ thể và giúp giảm cân.\n\n'
          'Ăn uống\n\n'
          '- Ăn nhãn tươi ngon nhất, có thể ăn trực tiếp hoặc chế biến thành mứt.\n'
          '- Nhãn cũng được sử dụng trong các món salad và làm nguyên liệu cho các món tráng miệng.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản nhãn trong túi ni lông hoặc hộp đựng kín để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể bảo quản nhãn đã rửa sạch trong ngăn tủ lạnh.'),
  Category(
      label: 'Dừa',
      value: 'dua',
      icon: 'assets/icons/fruits/duaf.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Dừa là nguồn giàu kali và magiê, giúp cân bằng nước và điện giải cho cơ thể.\n'
          '- Chứa nhiều chất xơ, giúp cải thiện tiêu hóa và giảm nguy cơ bệnh đường ruột.\n'
          '- Dừa cũng cung cấp vitamin C và các chất chống oxy hóa, bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn dừa tươi ngon nhất, có thể ăn trực tiếp hoặc sử dụng nước dừa.\n'
          '- Dừa cũng được sử dụng trong các món chè, sinh tố và làm nguyên liệu cho các món tráng miệng.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản dừa tươi trong tủ lạnh để kéo dài thời gian sử dụng.\n'
          '- Nếu không dùng hết, có thể bảo quản dừa đã lột vỏ và cắt thành từng lát trong ngăn đá.'),
  Category(
      label: 'Dưa hấu',
      value: 'dua-hau',
      icon: 'assets/icons/fruits/dua-hau.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Dưa hấu là nguồn giàu nước, giúp cung cấp độ ẩm cho cơ thể.\n'
          '- Chứa lượng lớn vitamin C và A, giúp tăng cường hệ miễn dịch và duy trì sức khỏe da.\n'
          '- Dưa hấu cũng chứa chất chống oxy hóa, bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn dưa hấu tươi ngon nhất khi thời tiết nóng.\n'
          '- Dưa hấu có thể ăn trực tiếp hoặc chế biến thành nước ép, sinh tố.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản dưa hấu tươi trong tủ lạnh để giữ nguyên độ tươi.\n'
          '- Nếu không dùng hết, có thể cắt dưa hấu thành từng miếng và bảo quản trong ngăn đá.'),
  Category(
      label: 'Dưa lưới',
      value: 'dua-luoi',
      icon: 'assets/icons/fruits/dua-luoi.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Dưa lưới giàu vitamin C, giúp tăng cường hệ miễn dịch và chống oxy hóa.\n'
          '- Chứa nhiều nước và chất xơ, tốt cho tiêu hóa và giảm cảm giác thèm ăn.\n'
          '- Thành phần nước cao giúp giải nhiệt và giữ cơ thể mát mẻ trong mùa hè.\n\n'
          'Ăn uống\n\n'
          '- Ăn dưa lưới tươi để tận hưởng hương vị ngọt mát.\n'
          '- Có thể dùng dưa lưới làm nguyên liệu cho món salad, nước ép hoặc thêm vào các món ăn nhẹ.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản dưa lưới ở nhiệt độ phòng để duy trì độ tươi ngon.\n'
          '- Nếu không dùng hết, nên bảo quản dưa lưới đã cắt thành từng lát trong tủ lạnh để kéo dài thời gian sử dụng.'),
  Category(
      label: 'Quất',
      value: 'quat',
      icon: 'assets/icons/fruits/quat.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Quất là nguồn cung cấp vitamin C và A, tốt cho sức khỏe mắt và hệ miễn dịch.\n'
          '- Chứa các chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n\n'
          'Ăn uống\n\n'
          '- Ăn quất tươi để tận hưởng hương vị ngọt chua đặc trưng.\n'
          '- Có thể sử dụng quất làm nguyên liệu cho nước ép, mứt hoặc làm phụ gia trong món salad.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản quất trong tủ lạnh để giữ cho quả tươi lâu hơn.\n'
          '- Tránh bỏ quất vào các nơi có nhiệt độ cao để tránh làm hỏng quả nhanh chóng.'),
  Category(
      label: 'Cà chua bi',
      value: 'ca-chua-bi',
      icon: 'assets/icons/fruits/ca-chua-bi.png',
      type: 'fruits',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Cà chua bi chứa nhiều lycopene, giúp bảo vệ tim mạch và ngăn ngừa ung thư.\n'
          '- Là nguồn cung cấp vitamin C và K, tốt cho hệ xương và da.\n\n'
          'Ăn uống\n\n'
          '- Ăn cà chua bi tươi để tận hưởng hương vị đậm đà và giòn ngọt.\n'
          '- Dùng cà chua bi trong các món salad, nước sốt hoặc chế biến thành món nướng, hầm.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản cà chua bi ở nhiệt độ phòng để duy trì độ tươi ngon.\n'
          '- Nên rửa sạch và lau khô trước khi bảo quản để tránh hỏng nhanh.'),
  Category(
      label: 'Cà chua',
      value: 'ca-chua',
      icon: 'assets/icons/fruits/ca-chua.png',
      type: 'fruits',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Cà chua giàu vitamin C và K, hỗ trợ sức khỏe tim mạch và xương khớp.\n'
          '- Chứa lycopene, giúp giảm nguy cơ mắc các bệnh lý ung thư.\n\n'
          'Ăn uống\n\n'
          '- Ăn cà chua tươi hoặc chế biến thành nước sốt, món salad, sandwich hoặc nước ép.\n'
          '- Có thể sử dụng cà chua để làm nguyên liệu cho các món ăn Ý và các món nước.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản cà chua ở nhiệt độ phòng để giữ cho quả chín và ngon.\n'
          '- Không nên bảo quản cà chua trong tủ lạnh vì có thể làm giảm chất lượng và hương vị của quả.'),
  Category(
      label: 'Chanh xanh',
      value: 'chanh-xanh',
      icon: 'assets/icons/fruits/chanh-xanh.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Chanh xanh là nguồn cung cấp vitamin C, giúp tăng cường hệ miễn dịch và làm đẹp da.\n'
          '- Chứa các chất chống oxy hóa, giúp thanh lọc cơ thể và giảm stress.\n\n'
          'Ăn uống\n\n'
          '- Sử dụng chanh xanh để làm nước ép, sinh tố, nước giải khát hoặc dùng làm gia vị trong các món ăn.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản chanh xanh ở nhiệt độ phòng hoặc trong ngăn mát của tủ lạnh để duy trì độ tươi ngon.\n'
          '- Có thể cắt lát và đông lạnh chanh xanh để sử dụng dần trong thời gian dài.'),
  Category(
      label: 'Chanh vàng',
      value: 'chanh-vang',
      icon: 'assets/icons/fruits/chanh-vang.png',
      type: 'fruits',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Chanh vàng là nguồn cung cấp vitamin C, giúp tăng cường hệ miễn dịch và làm đẹp da.\n'
          '- Chứa các chất chống oxy hóa, giúp thanh lọc cơ thể và giảm stress.\n\n'
          'Ăn uống\n\n'
          '- Sử dụng chanh vàng để làm nước ép, sinh tố, nước giải khát hoặc dùng làm gia vị trong các món ăn.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản chanh vàng ở nhiệt độ phòng hoặc trong ngăn mát của tủ lạnh để duy trì độ tươi ngon.\n'
          '- Có thể cắt lát và đông lạnh chanh vàng để sử dụng dần trong thời gian dài.'),
  Category(
      label: 'Bưởi',
      value: 'buoi',
      icon: 'assets/icons/fruits/buoi.png',
      type: 'fruits',
      defaultDuration: 28,
      note: 'Sức khỏe\n\n'
          '- Bưởi là nguồn cung cấp vitamin C, giúp tăng cường hệ miễn dịch và bảo vệ sức khỏe tim mạch.\n'
          '- Chứa nước và chất xơ, tốt cho tiêu hóa và giảm cảm giác thèm ăn.\n\n'
          'Ăn uống\n\n'
          '- Ăn bưởi tươi để tận hưởng hương vị ngọt thanh.\n'
          '- Dùng bưởi làm nguyên liệu cho món salad, sinh tố hoặc nước ép.\n\n'
          'Bảo quản\n\n'
          '- Bảo quản bưởi ở nhiệt độ phòng để duy trì độ tươi ngon.\n'
          '- Nếu không dùng hết, có thể bảo quản bưởi đã lột vỏ trong tủ lạnh để kéo dài thời gian sử dụng.'),
];

List<Category> vegetables = [
  Category(
    label: 'Khoai môn',
    value: 'khoai-mon',
    icon: 'assets/icons/vegetables/khoai-mon.png',
    type: 'vegetables',
    defaultDuration: 10, // days
  ),
  Category(
      label: 'Nấm',
      value: 'nam',
      icon: 'assets/icons/vegetables/nam.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Nấm là nguồn protein thực vật giàu giá trị, thích hợp cho chế độ ăn chay.\n'
          '- Chứa nhiều chất xơ giúp cân bằng đường huyết và hỗ trợ tiêu hóa.\n'
          '- Là nguồn khoáng chất như kali, sắt, magie và kẽm.\n'
          '- Có chứa các vitamin như vitamin D, vitamin B complex (B2, B3, B5) cần thiết cho sức khỏe.\n'
          '- Có tính chống oxy hóa và hỗ trợ tăng cường hệ miễn dịch.\n'
          'Calo: Nấm có khoảng 22 calo trên 100 gram.\n\n'
          'Ăn uống\n\n'
          '- Nấm có thể được nấu chín, xào, nướng, hoặc dùng tươi trong salad.\n'
          '- Thích hợp là nguyên liệu cho nhiều món chay và món ăn nhẹ.\n\n'
          'Bảo quản\n\n'
          '- Nấm nên được bảo quản trong túi giấy hoặc khay nhựa trong ngăn mát tủ lạnh.\n'
          '- Không nên để nấm tiếp xúc trực tiếp với nước khi bảo quản để tránh hư hỏng nhanh chóng.'),
  Category(
      label: 'Nấm kim châm',
      value: 'nam-kim-cham',
      icon: 'assets/icons/vegetables/nam-kim-cham.png',
      type: 'vegetables',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Nấm kim châm là loại nấm giàu protein và chất xơ, thích hợp cho chế độ ăn chay.\n'
          '- Chứa nhiều kali và các khoáng chất như sắt và magie.\n'
          '- Cung cấp các vitamin như vitamin D và vitamin B complex.\n'
          '- Có tính chống oxy hóa và hỗ trợ tăng cường hệ miễn dịch.\n'
          'Calo: Nấm kim châm có khoảng 27 calo trên 100 gram.\n\n'
          'Ăn uống\n\n'
          '- Nấm kim châm thường được nấu chín, xào, nướng, hoặc sử dụng tươi trong các món salad.\n'
          '- Là nguyên liệu phổ biến trong các món ăn chay và món nhẹ.\n\n'
          'Bảo quản\n\n'
          '- Nấm kim châm nên được bảo quản trong túi giấy hoặc khay nhựa trong ngăn mát tủ lạnh.\n'
          '- Không nên để nấm tiếp xúc trực tiếp với nước khi bảo quản để tránh hư hỏng nhanh chóng.'),
  Category(
      label: 'Nấm hương',
      value: 'nam-huong',
      icon: 'assets/icons/vegetables/nam-huong.png',
      type: 'vegetables',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Nấm hương là nguồn chất dinh dưỡng giàu protein, vitamin và khoáng chất.\n'
          '- Cung cấp kali, sắt, magie và các vitamin như vitamin D và vitamin B complex.\n'
          '- Chứa chất xơ hỗ trợ tiêu hóa và cân bằng đường huyết.\n'
          '- Có tính chống oxy hóa và hỗ trợ tăng cường hệ miễn dịch.\n'
          'Calo: Nấm hương có khoảng 22 calo trên 100 gram.\n\n'
          'Ăn uống\n\n'
          '- Nấm hương thường được nấu chín, xào, nướng, hoặc sử dụng tươi trong các món ăn.\n'
          '- Thích hợp làm nguyên liệu cho các món chay và món nhẹ.\n\n'
          'Bảo quản\n\n'
          '- Nấm hương nên được bảo quản trong túi giấy hoặc khay nhựa trong ngăn mát tủ lạnh.\n'
          '- Tránh để nấm tiếp xúc trực tiếp với nước khi bảo quản để giữ được độ tươi và ngon.'),
  Category(
      label: 'Đậu que',
      value: 'dau-que',
      icon: 'assets/icons/vegetables/dau-que.png',
      type: 'vegetables',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Đậu que là nguồn protein thực vật quan trọng, thích hợp cho chế độ ăn chay.\n'
          '- Chứa nhiều chất xơ giúp hỗ trợ tiêu hóa và cân bằng đường huyết.\n'
          '- Là nguồn kali, magie, sắt và các vitamin như vitamin B complex.\n'
          '- Có tính chống oxy hóa và hỗ trợ tăng cường hệ miễn dịch.\n'
          'Calo: Đậu que có khoảng 56 calo trên 100 gram.\n\n'
          'Ăn uống\n\n'
          '- Đậu que thường được nấu chín, xào, luộc, hoặc dùng tươi trong các món salad.\n'
          '- Là nguyên liệu phổ biến trong các món chay và món ăn nhẹ.\n\n'
          'Bảo quản\n\n'
          '- Đậu que nên được bảo quản trong túi giấy hoặc khay nhựa trong ngăn mát tủ lạnh.\n'
          '- Tránh để đậu que tiếp xúc trực tiếp với nước khi bảo quản để giữ được độ tươi và ngon.'),
  Category(
      label: 'Ớt chỉ thiên',
      value: 'ot-chi-thien',
      icon: 'assets/icons/vegetables/ot-chi-thien.png',
      type: 'vegetables',
      defaultDuration: 10,
      note: 'Sức khỏe\n\n'
          '- Ớt chỉ thiên là nguồn cung cấp vitamin C, A và các chất chống oxy hóa.\n'
          '- Có tác dụng kích thích tiêu hóa và hỗ trợ quá trình trao đổi chất.\n'
          '- Chứa capsaicin có thể giúp giảm cân và tăng cường sự bài tiết của nước mắt và nước bọt.\n'
          '- Có khả năng giảm nguy cơ mắc bệnh tim mạch và tiểu đường.\n'
          'Calo: Khoảng 40 calo trên 100 gram ớt chỉ thiên.\n\n'
          'Ăn uống\n\n'
          '- Ớt chỉ thiên có thể được dùng tươi, ướp chua, hay làm gia vị trong các món ăn.\n'
          '- Thường sử dụng trong món salad, nước chấm và các món xào, rim.\n\n'
          'Bảo quản\n\n'
          '- Ớt chỉ thiên nên được bảo quản trong tủ lạnh để giữ độ tươi và ngăn ngừa việc chín sớm.'),
  Category(
      label: 'Ớt chuông',
      value: 'ot-chuong',
      icon: 'assets/icons/vegetables/ot-chuong.png',
      type: 'vegetables',
      defaultDuration: 10,
      note: 'Sức khỏe\n\n'
          '- Ớt chuông là nguồn cung cấp vitamin C và A, cũng như chất xơ và kali.\n'
          '- Có tác dụng tăng cường miễn dịch và bảo vệ sức khỏe tim mạch.\n'
          '- Chứa capsaicin ở mức rất thấp, có thể giúp giảm đau và viêm.\n'
          '- Có khả năng giảm cân và cải thiện sự tiêu hóa.\n'
          'Calo: Khoảng 20 calo trên 100 gram ớt chuông.\n\n'
          'Ăn uống\n\n'
          '- Ớt chuông thường được sử dụng tươi, nấu chín, xào hoặc làm gia vị trong các món ăn.\n'
          '- Phù hợp để làm nguyên liệu trong salad, món xào và nước chấm.\n\n'
          'Bảo quản\n\n'
          '- Ớt chuông nên được bảo quản trong tủ lạnh để duy trì độ tươi và ngăn ngừa việc chín sớm.'),
  Category(
      label: 'Tỏi tây',
      value: 'toi-tay',
      icon: 'assets/icons/vegetables/toi-tay.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Tỏi tây là nguồn cung cấp vitamin C, vitamin B6 và các chất chống oxy hóa.\n'
          '- Có tác dụng kháng viêm, kháng khuẩn và hỗ trợ hệ miễn dịch.\n'
          '- Có thể giúp kiểm soát huyết áp và giảm nguy cơ mắc bệnh tim mạch.\n'
          '- Tỏi tây có tính khử trùng tự nhiên và có thể hỗ trợ quá trình tiêu hóa.\n'
          'Calo: Khoảng 149 calo trên 100 gram tỏi tây.\n\n'
          'Ăn uống\n\n'
          '- Tỏi tây thường được dùng để gia vị trong nhiều món ăn, nấu chín hoặc ướp chua.\n'
          '- Có thể sử dụng tỏi tây để làm gia vị cho các món xào, nước chấm và nấu súp.\n\n'
          'Bảo quản\n\n'
          '- Tỏi tây nên được bảo quản ở nơi khô ráo, thông thoáng và tránh ánh nắng mặt trời.'),
  Category(
      label: 'Ớt',
      value: 'ot',
      icon: 'assets/icons/vegetables/ot.png',
      type: 'vegetables',
      defaultDuration: 10,
      note: 'Sức khỏe\n\n'
          '- Ớt là nguồn cung cấp vitamin C, A và các chất chống oxy hóa.\n'
          '- Có tác dụng kích thích tiêu hóa và hỗ trợ quá trình trao đổi chất.\n'
          '- Chứa capsaicin có thể giúp giảm cân và tăng cường sự bài tiết của nước mắt và nước bọt.\n'
          '- Có khả năng giảm nguy cơ mắc bệnh tim mạch và tiểu đường.\n'
          'Calo: Khoảng 40 calo trên 100 gram ớt.\n\n'
          'Ăn uống\n\n'
          '- Ớt có thể được dùng tươi, ướp chua, hay làm gia vị trong các món ăn.\n'
          '- Thường sử dụng trong món salad, nước chấm và các món xào, rim.\n\n'
          'Bảo quản\n\n'
          '- Ớt nên được bảo quản trong tủ lạnh để giữ độ tươi và ngăn ngừa việc chín sớm.'),
  Category(
      label: 'Súp lơ trắng',
      value: 'sup-lo-trang',
      icon: 'assets/icons/vegetables/sup-lo-trang.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Súp lơ trắng là nguồn cung cấp vitamin C, K và các chất chống oxy hóa.\n'
          '- Có tác dụng tăng cường sức khỏe xương và hỗ trợ tiêu hóa.\n'
          '- Chứa chất chống viêm và có khả năng giảm nguy cơ ung thư.\n'
          '- Cung cấp chất xơ giúp cải thiện sự tiêu hóa và giảm cholesterol.\n'
          'Calo: Khoảng 27 calo trên 100 gram súp lơ trắng.\n\n'
          'Ăn uống\n\n'
          '- Súp lơ trắng thường được nấu chín, luộc hoặc làm salad.\n'
          '- Có thể sử dụng trong món nướng và chế biến thành bột để làm bánh.\n\n'
          'Bảo quản\n\n'
          '- Súp lơ trắng nên được bảo quản trong tủ lạnh để giữ độ tươi và ngăn ngừa việc chín sớm.'),
  Category(
      label: 'Xu hào',
      value: 'xu-hao',
      icon: 'assets/icons/vegetables/xu-hao.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Xu hào là nguồn cung cấp vitamin K, C và kali.\n'
          '- Có tác dụng làm dịu và giảm thiểu tình trạng viêm.\n'
          '- Chứa chất xơ giúp duy trì sự khỏe mạnh của đường ruột.\n'
          '- Cung cấp chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 34 calo trên 100 gram xu hào.\n\n'
          'Ăn uống\n\n'
          '- Xu hào thường được dùng tươi, luộc, nấu chín hoặc làm gia vị.\n'
          '- Thích hợp trong món nướng, xào và chế biến thành bột để làm bánh.\n\n'
          'Bảo quản\n\n'
          '- Xu hào nên được bảo quản trong tủ lạnh để duy trì độ tươi và ngăn ngừa việc chín sớm.'),
  Category(
      label: 'Bí ngô vàng',
      value: 'bi-ngo-vang',
      icon: 'assets/icons/vegetables/bi-ngo-vang.png',
      type: 'vegetables',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Bí ngô vàng là một nguồn dinh dưỡng giàu chất xơ giúp duy trì sự khỏe mạnh của đường ruột và giảm nguy cơ táo bón.\n'
          '- Chứa nhiều beta-carotene, một dạng của vitamin A, có tác dụng bảo vệ mắt khỏi các bệnh lý và hỗ trợ chức năng thị lực.\n'
          '- Cung cấp kali, một khoáng chất quan trọng cho sự điều hoà nước và điện giải trong cơ thể.\n'
          '- Được coi là thực phẩm có tính kiềm giúp duy trì cân bằng pH của cơ thể.\n'
          '- Có chứa chất chống oxy hóa giúp ngăn ngừa tổn thương tế bào và lão hóa.\n'
          'Calo: Khoảng 26 calo trên 100 gram bí ngô vàng.\n\n'
          'Ăn uống\n\n'
          '- Bí ngô vàng có thể được sử dụng để nấu chín, hấp, nướng, hoặc làm thành món canh, xào, hay súp.\n'
          '- Thường được sử dụng để làm nguyên liệu cho các món bánh, bột chiên, và món ăn chay.\n\n'
          'Bảo quản\n\n'
          '- Bí ngô vàng nên được bảo quản ở nơi khô ráo, thoáng mát và tránh ánh nắng trực tiếp để giữ được độ tươi và dinh dưỡng lâu dài.\n'),
  Category(
      label: 'Rau diếp',
      value: 'rau-diep',
      icon: 'assets/icons/vegetables/rau-diep.png',
      type: 'vegetables',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Rau diếp là nguồn cung cấp vitamin A, C và các chất chống oxy hóa.\n'
          '- Có tác dụng làm mát cơ thể và giảm cảm giác khát.\n'
          '- Chứa nhiều chất xơ giúp hỗ trợ tiêu hóa và duy trì sự khỏe mạnh của đường ruột.\n'
          '- Có tính kháng viêm và giúp hỗ trợ sự chống lại các bệnh nhiễm trùng.\n'
          'Calo: Khoảng 20 calo trên 100 gram rau diếp.\n\n'
          'Ăn uống\n\n'
          '- Rau diếp thường được dùng tươi trong các món salad, nấu canh hoặc xào.\n'
          '- Có thể sử dụng làm nguyên liệu cho món xào, hầm hoặc trộn với mỡ để ăn với bánh mì.\n\n'
          'Bảo quản\n\n'
          '- Rau diếp nên được bảo quản trong tủ lạnh để giữ độ tươi và ngăn ngừa việc chín sớm.'),
  Category(
      label: 'Rau chân vịt',
      value: 'rau-chan-vit',
      icon: 'assets/icons/vegetables/rau-chan-vit.png',
      type: 'vegetables',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Rau chân vịt là nguồn cung cấp vitamin C, K và các chất chống oxy hóa.\n'
          '- Có tác dụng làm dịu viêm và giúp cơ thể đẩy mạnh quá trình trao đổi chất.\n'
          '- Chứa nhiều chất xơ giúp duy trì sự khỏe mạnh của đường ruột.\n'
          '- Có khả năng giảm cholesterol và hỗ trợ sức khỏe tim mạch.\n'
          'Calo: Khoảng 23 calo trên 100 gram rau chân vịt.\n\n'
          'Ăn uống\n\n'
          '- Rau chân vịt thường được sử dụng tươi trong các món salad, nấu canh hoặc xào.\n'
          '- Phù hợp với món nướng và làm gia vị cho các món ăn chế biến nhanh.\n\n'
          'Bảo quản\n\n'
          '- Rau chân vịt nên được bảo quản trong túi nhựa hoặc hộp đựng thực phẩm để giữ độ tươi.'),
  Category(
      label: 'Cần tây',
      value: 'can-tay',
      icon: 'assets/icons/vegetables/can-tay.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Cần tây là nguồn cung cấp vitamin K, A, C và kali.\n'
          '- Có tác dụng tăng cường sức khỏe xương và giúp duy trì hệ miễn dịch.\n'
          '- Chứa chất xơ giúp cải thiện sự tiêu hóa và giảm cholesterol.\n'
          '- Cung cấp chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 17 calo trên 100 gram cần tây.\n\n'
          'Ăn uống\n\n'
          '- Cần tây thường được dùng tươi trong các món salad, nấu canh hoặc xào.\n'
          '- Thích hợp để làm gia vị cho các món nướng và làm nguyên liệu chế biến nhanh.\n\n'
          'Bảo quản\n\n'
          '- Cần tây nên được bảo quản trong túi nhựa hoặc hộp đựng thực phẩm để giữ độ tươi.'),
  Category(
      label: 'Xà lách',
      value: 'xa-lach',
      icon: 'assets/icons/vegetables/xa-lach.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Xà lách là một loại rau giàu chất xơ giúp cải thiện tiêu hóa và duy trì sự khỏe mạnh của đường ruột.\n'
          '- Nguồn cung cấp vitamin và khoáng chất như vitamin A, vitamin K, vitamin C, kali và folate.\n'
          '- Có chứa chất chống oxy hóa giúp ngăn ngừa sự lão hóa và bảo vệ tế bào khỏi tổn thương.\n'
          '- Thường được coi là thực phẩm có ích trong việc kiểm soát cân nặng và giảm nguy cơ các bệnh mãn tính.\n'
          'Calo: Khoảng 15 calo trên 100 gram xà lách.\n\n'
          'Ăn uống\n\n'
          '- Xà lách thường được sử dụng tươi để làm salad, làm phần rau ăn kèm với các món khác, hoặc có thể được nấu chín.\n'
          '- Có thể sử dụng xà lách để làm nguyên liệu cho các món nướng, xào, và các món chế biến nhanh khác.\n\n'
          'Bảo quản\n\n'
          '- Xà lách nên được bảo quản trong túi nhựa hoặc hộp đựng thực phẩm kín để giữ độ tươi và không bị nhạt màu quá nhanh.\n'),
  Category(
      label: 'Bí xanh',
      value: 'bi-xanh',
      icon: 'assets/icons/vegetables/bi-xanh.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Bí xanh là một loại rau quả giàu chất xơ và chứa ít calo, thích hợp cho chế độ ăn kiêng và giảm cân.\n'
          '- Nguồn cung cấp vitamin và khoáng chất như vitamin A, vitamin C, kali và mangan.\n'
          '- Chứa beta-carotene và lutein, các chất dinh dưỡng có tác dụng bảo vệ mắt và hỗ trợ sức khỏe tim mạch.\n'
          '- Có tính kiềm giúp cân bằng pH trong cơ thể.\n'
          '- Là nguồn cung cấp chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 20 calo trên 100 gram bí xanh.\n\n'
          'Ăn uống\n\n'
          '- Bí xanh thường được dùng để nấu chín, hấp, nướng, hay chế biến thành súp, chè, và món ăn chay.\n'
          '- Có thể sử dụng bí xanh để làm nguyên liệu cho các món bánh, pudding, và món ăn nhẹ khác.\n\n'
          'Bảo quản\n\n'
          '- Bí xanh nên được bảo quản ở nơi khô ráo, thoáng mát để giữ được độ tươi và dinh dưỡng lâu dài.\n'),
  Category(
      label: 'Nấm sò',
      value: 'nam-so',
      icon: 'assets/icons/vegetables/nam-so.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Nấm sò là một loại nấm giàu chất dinh dưỡng và thường được coi là thực phẩm hữu ích cho sức khỏe.\n'
          '- Nguồn cung cấp protein, vitamin nhóm B (như vitamin B2 và B3), kali, và chất chống oxy hóa.\n'
          '- Có tính kháng viêm và có thể hỗ trợ hệ miễn dịch.\n'
          '- Chứa chất xơ giúp duy trì sự khỏe mạnh của đường ruột và hỗ trợ tiêu hóa.\n'
          '- Là nguồn cung cấp chất chống oxy hóa giúp ngăn ngừa sự lão hóa và bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 22 calo trên 100 gram nấm sò.\n\n'
          'Ăn uống\n\n'
          '- Nấm sò thường được sử dụng để nấu chín, xào, nấu súp, hay dùng trong các món salad.\n'
          '- Có thể sử dụng nấm sò làm nguyên liệu cho các món ăn chay hoặc kết hợp với thịt, hải sản trong các món chính.\n\n'
          'Bảo quản\n\n'
          '- Nấm sò nên được bảo quản trong túi giữ tươi hoặc hộp đựng thực phẩm kín để giữ được độ tươi và không bị ẩm mốc.\n'),
  Category(
      label: 'Cải ngọt',
      value: 'cai-ngot',
      icon: 'assets/icons/vegetables/cai-ngot.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Cải ngọt là một loại rau lá xanh giàu chất dinh dưỡng, chứa nhiều vitamin A, C, K, và folate.\n'
          '- Chứa chất chống oxy hóa giúp tăng cường hệ miễn dịch và bảo vệ tế bào khỏi tổn thương.\n'
          '- Là nguồn chất xơ tốt giúp hỗ trợ tiêu hóa và duy trì sức khỏe của hệ tiêu hóa.\n'
          '- Chứa nhiều khoáng chất như canxi, sắt, và kali, cần thiết cho sự phát triển xương và sức khỏe tim mạch.\n'
          'Calo: Khoảng 25 calo trên 100 gram cải ngọt.\n\n'
          'Ăn uống\n\n'
          '- Cải ngọt có thể được chế biến theo nhiều cách như luộc, xào, nấu canh, hoặc làm salad.\n'
          '- Thường được dùng trong các món ăn hàng ngày và có thể kết hợp với nhiều loại thực phẩm khác để tăng cường hương vị và dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Cải ngọt nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Tránh để cải ngọt ở nơi ẩm ướt và cần sử dụng trong vòng 1 tuần để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Lá lốt',
      value: 'la-lot',
      icon: 'assets/icons/vegetables/la-lot.png',
      type: 'vegetables',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Lá lốt có tính ấm và chứa nhiều chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có tác dụng kháng viêm và giảm đau, thường được sử dụng trong y học cổ truyền để trị đau nhức xương khớp.\n'
          '- Chứa các hợp chất giúp tăng cường hệ miễn dịch và hỗ trợ tiêu hóa.\n'
          'Calo: Khoảng 20 calo trên 100 gram lá lốt.\n\n'
          'Ăn uống\n\n'
          '- Lá lốt thường được sử dụng để cuốn các món ăn như bò lá lốt, chả lá lốt.\n'
          '- Có thể dùng lá lốt để nấu canh, xào, hoặc làm gia vị trong các món ăn khác nhau.\n\n'
          'Bảo quản\n\n'
          '- Lá lốt nên được bảo quản trong tủ lạnh, bọc trong túi nhựa hoặc hộp kín để giữ tươi lâu hơn.\n'
          '- Nên sử dụng trong vòng 5 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Măng tây',
      value: 'mang-tay',
      icon: 'assets/icons/vegetables/mang-tay.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Măng tây giàu chất dinh dưỡng, chứa nhiều vitamin A, C, E, K, và folate.\n'
          '- Chứa chất chống oxy hóa và chất xơ giúp tăng cường hệ miễn dịch và hỗ trợ tiêu hóa.\n'
          '- Có tác dụng lợi tiểu tự nhiên, giúp thải độc cơ thể và duy trì sức khỏe của hệ tiết niệu.\n'
          'Calo: Khoảng 20 calo trên 100 gram măng tây.\n\n'
          'Ăn uống\n\n'
          '- Măng tây có thể được chế biến theo nhiều cách như luộc, hấp, xào, hoặc nướng.\n'
          '- Thường được dùng trong các món salad, súp, hoặc làm nguyên liệu cho các món chính.\n\n'
          'Bảo quản\n\n'
          '- Măng tây nên được bảo quản trong tủ lạnh, bọc đầu măng tây bằng giấy ẩm và để trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 7 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Ngô',
      value: 'ngo',
      icon: 'assets/icons/vegetables/ngo.png',
      type: 'vegetables',
      defaultDuration: 5,
      note: 'Sức khỏe\n\n'
          '- Ngô là nguồn cung cấp carbohydrate dồi dào, cung cấp năng lượng cho cơ thể.\n'
          '- Chứa nhiều chất xơ giúp duy trì sức khỏe của hệ tiêu hóa và ngăn ngừa táo bón.\n'
          '- Là nguồn vitamin B, folate, và một số khoáng chất như sắt và magiê.\n'
          'Calo: Khoảng 90 calo trên 100 gram ngô tươi.\n\n'
          'Ăn uống\n\n'
          '- Ngô có thể được luộc, nướng, hoặc làm nguyên liệu trong nhiều món ăn như súp, salad, và món xào.\n'
          '- Hạt ngô có thể được dùng để làm bột ngô hoặc nấu cháo.\n\n'
          'Bảo quản\n\n'
          '- Ngô tươi nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn.\n'
          '- Ngô đã chế biến có thể được bảo quản trong tủ lạnh và nên dùng trong vòng 5 ngày.\n'),
  Category(
      label: 'Nhân sâm',
      value: 'nhan-sam',
      icon: 'assets/icons/vegetables/nhan-sam.png',
      type: 'vegetables',
      defaultDuration: 14, // days
      note: 'Sức khỏe\n\n'
          '- Nhân sâm được biết đến với nhiều lợi ích sức khỏe, bao gồm tăng cường hệ miễn dịch và cải thiện năng lượng.\n'
          '- Có chứa ginsenosides, hợp chất có khả năng chống viêm và chống oxy hóa.\n'
          '- Có thể giúp cải thiện chức năng não bộ, tăng cường trí nhớ và khả năng tập trung.\n'
          '- Được cho là có tác dụng giảm căng thẳng, lo âu và cải thiện tâm trạng.\n'
          '- Có thể hỗ trợ trong việc kiểm soát đường huyết và cải thiện sức khỏe tim mạch.\n'
          'Calo: Khoảng 50 calo trên 100 gram nhân sâm.\n\n'
          'Ăn uống\n\n'
          '- Nhân sâm có thể được sử dụng dưới dạng tươi, khô, hoặc làm thành trà, viên nang, bột hoặc chiết xuất.\n'
          '- Có thể thêm nhân sâm vào các món súp, canh, hoặc nước hầm để tăng cường hương vị và giá trị dinh dưỡng.\n'
          '- Có thể được sử dụng như một loại gia vị hoặc nguyên liệu cho các món ăn chay hoặc món khai vị.\n\n'
          'Bảo quản\n\n'
          '- Nhân sâm tươi nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nhân sâm khô nên được giữ trong bao bì kín, tránh ánh nắng trực tiếp và ẩm ướt.\n'),
  Category(
      label: 'Khoai tây',
      value: 'khoai-tay',
      icon: 'assets/icons/vegetables/khoai-tay.png',
      type: 'vegetables',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Khoai tây là nguồn cung cấp carbohydrate dồi dào, cung cấp năng lượng cho cơ thể.\n'
          '- Chứa nhiều vitamin C, B6 và khoáng chất như kali và magiê.\n'
          '- Chứa chất xơ giúp duy trì sức khỏe của hệ tiêu hóa và hỗ trợ kiểm soát cân nặng.\n'
          'Calo: Khoảng 77 calo trên 100 gram khoai tây tươi.\n\n'
          'Ăn uống\n\n'
          '- Khoai tây có thể được nấu chín, nướng, chiên, hoặc luộc.\n'
          '- Thường được dùng trong các món ăn như khoai tây chiên, khoai tây nghiền, súp, và salad.\n\n'
          'Bảo quản\n\n'
          '- Khoai tây nên được bảo quản ở nơi khô ráo, thoáng mát và tránh ánh nắng trực tiếp.\n'
          '- Tránh bảo quản khoai tây trong tủ lạnh vì có thể làm biến đổi chất lượng và hương vị.\n'),
  Category(
      label: 'Khoai lang',
      value: 'khoai-lang',
      icon: 'assets/icons/vegetables/khoai-lang.png',
      type: 'vegetables',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Khoai lang là nguồn cung cấp carbohydrate và chất xơ phong phú, giúp cung cấp năng lượng và hỗ trợ tiêu hóa.\n'
          '- Chứa nhiều vitamin A, C, và B6 cùng các khoáng chất như kali và mangan.\n'
          '- Có chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương và tăng cường hệ miễn dịch.\n'
          'Calo: Khoảng 86 calo trên 100 gram khoai lang tươi.\n\n'
          'Ăn uống\n\n'
          '- Khoai lang có thể được nướng, luộc, hấp, hoặc chiên.\n'
          '- Thường được dùng trong các món ăn như khoai lang nướng, canh, súp, và salad.\n\n'
          'Bảo quản\n\n'
          '- Khoai lang nên được bảo quản ở nơi khô ráo, thoáng mát và tránh ánh nắng trực tiếp.\n'
          '- Không nên bảo quản khoai lang trong tủ lạnh vì có thể làm thay đổi chất lượng và hương vị.\n'),
  Category(
      label: 'Nấm đùi gà',
      value: 'nam-dui-ga',
      icon: 'assets/icons/vegetables/nam-dui-ga.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Nấm đùi gà là nguồn cung cấp protein thực vật tốt và chứa nhiều vitamin B và D.\n'
          '- Chứa chất chống oxy hóa và các hợp chất kháng viêm giúp bảo vệ cơ thể khỏi tổn thương và bệnh tật.\n'
          '- Có chứa chất xơ giúp hỗ trợ tiêu hóa và duy trì sức khỏe của hệ tiêu hóa.\n'
          'Calo: Khoảng 22 calo trên 100 gram nấm đùi gà tươi.\n\n'
          'Ăn uống\n\n'
          '- Nấm đùi gà có thể được nấu chín, nướng, hoặc xào.\n'
          '- Thường được dùng trong các món ăn như súp, xào, hoặc làm nguyên liệu cho các món chay.\n\n'
          'Bảo quản\n\n'
          '- Nấm đùi gà nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 7 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Hẹ',
      value: 'he',
      icon: 'assets/icons/vegetables/he.png',
      type: 'vegetables',
      defaultDuration: 14, // days
      note: 'Sức khỏe\n\n'
          '- Hẹ là nguồn cung cấp vitamin A, C và K, cùng với folate và canxi.\n'
          '- Chứa chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có tính kháng khuẩn và kháng viêm.\n'
          '- Hẹ có thể giúp cải thiện tiêu hóa và tăng cường hệ miễn dịch.\n'
          'Calo: Khoảng 30 calo trên 100 gram hẹ.\n\n'
          'Ăn uống\n\n'
          '- Hẹ có thể được sử dụng để làm gia vị cho nhiều món ăn như xào, canh, hay salad.\n'
          '- Có thể thêm hẹ vào các món ăn chay hoặc món khai vị để tăng cường hương vị.\n\n'
          'Bảo quản\n\n'
          '- Hẹ nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Có thể gói hẹ trong giấy hoặc túi nhựa để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Hành lá',
      value: 'hanh-la',
      icon: 'assets/icons/vegetables/hanh-la.png',
      type: 'vegetables',
      defaultDuration: 14, // days
      note: 'Sức khỏe\n\n'
          '- Hành lá là nguồn cung cấp vitamin A, C, K, và folate.\n'
          '- Chứa chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có tác dụng kháng khuẩn và kháng viêm.\n'
          '- Hành lá có thể giúp cải thiện tiêu hóa và tăng cường hệ miễn dịch.\n'
          'Calo: Khoảng 32 calo trên 100 gram hành lá.\n\n'
          'Ăn uống\n\n'
          '- Hành lá có thể được sử dụng để làm gia vị cho nhiều món ăn như xào, canh, salad và phở.\n'
          '- Có thể thêm hành lá vào các món ăn chay hoặc món khai vị để tăng cường hương vị.\n\n'
          'Bảo quản\n\n'
          '- Hành lá nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Có thể gói hành lá trong giấy hoặc túi nhựa để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Giá đỗ xanh',
      value: 'gia-do-xanh',
      icon: 'assets/icons/vegetables/gia-do-xanh.png',
      type: 'vegetables',
      defaultDuration: 7, // days
      note: 'Sức khỏe\n\n'
          '- Giá đỗ xanh là nguồn cung cấp vitamin C, K, folate và chất xơ.\n'
          '- Chứa nhiều chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có thể giúp cải thiện tiêu hóa và hỗ trợ hệ miễn dịch.\n'
          '- Giá đỗ xanh cũng có tác dụng giảm cholesterol và cải thiện sức khỏe tim mạch.\n'
          'Calo: Khoảng 30 calo trên 100 gram giá đỗ xanh.\n\n'
          'Ăn uống\n\n'
          '- Giá đỗ xanh có thể được sử dụng trong các món xào, canh, salad, hoặc ăn sống.\n'
          '- Có thể thêm giá đỗ xanh vào các món ăn chay hoặc món khai vị để tăng cường hương vị và giá trị dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Giá đỗ xanh nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nên rửa sạch và để ráo trước khi bảo quản để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Giá đỗ',
      value: 'gia-do',
      icon: 'assets/icons/vegetables/gia-do.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Giá đỗ là nguồn cung cấp vitamin C và K dồi dào, giúp tăng cường hệ miễn dịch và hỗ trợ quá trình đông máu.\n'
          '- Chứa nhiều chất xơ, giúp hỗ trợ tiêu hóa và duy trì sự khỏe mạnh của hệ tiêu hóa.\n'
          '- Chứa các chất chống oxy hóa và hợp chất kháng viêm, giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 30 calo trên 100 gram giá đỗ tươi.\n\n'
          'Ăn uống\n\n'
          '- Giá đỗ thường được sử dụng trong các món salad, nộm, xào, hoặc nấu canh.\n'
          '- Có thể dùng giá đỗ để làm nguyên liệu cho các món ăn chay hoặc món khai vị.\n\n'
          'Bảo quản\n\n'
          '- Giá đỗ nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 7 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Dưa chuột',
      value: 'dua-chuot',
      icon: 'assets/icons/vegetables/dua-chuot.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Dưa chuột là nguồn cung cấp nước phong phú, giúp duy trì sự cân bằng nước trong cơ thể.\n'
          '- Chứa nhiều vitamin K, C, và một số khoáng chất như kali và magiê.\n'
          '- Chứa chất chống oxy hóa và hợp chất kháng viêm, giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 16 calo trên 100 gram dưa chuột tươi.\n\n'
          'Ăn uống\n\n'
          '- Dưa chuột có thể ăn sống, thêm vào các món salad, hoặc làm nguyên liệu cho các món ăn chay.\n'
          '- Thường được dùng làm dưa góp, nộm, hoặc làm nước ép.\n\n'
          'Bảo quản\n\n'
          '- Dưa chuột nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 14 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Củ sen',
      value: 'cu-sen',
      icon: 'assets/icons/vegetables/cu-sen.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Củ sen là nguồn cung cấp vitamin C, B6, và một số khoáng chất như sắt và kali.\n'
          '- Chứa nhiều chất xơ, giúp hỗ trợ tiêu hóa và duy trì sức khỏe của hệ tiêu hóa.\n'
          '- Chứa các hợp chất chống oxy hóa và kháng viêm, giúp bảo vệ cơ thể khỏi tổn thương và bệnh tật.\n'
          'Calo: Khoảng 74 calo trên 100 gram củ sen tươi.\n\n'
          'Ăn uống\n\n'
          '- Củ sen có thể được nấu chín, hấp, hoặc xào.\n'
          '- Thường được dùng trong các món súp, salad, hoặc làm nguyên liệu cho các món chay.\n\n'
          'Bảo quản\n\n'
          '- Củ sen nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 14 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Củ cải đường',
      value: 'cu-cai-duong',
      icon: 'assets/icons/vegetables/cu-cai-duong.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Củ cải đường là nguồn cung cấp vitamin C, folate, và chất xơ, giúp hỗ trợ hệ miễn dịch và tiêu hóa.\n'
          '- Chứa chất chống oxy hóa như betanin, giúp bảo vệ tế bào khỏi tổn thương và tăng cường sức khỏe tim mạch.\n'
          '- Có thể giúp cải thiện huyết áp và tăng cường tuần hoàn máu.\n'
          'Calo: Khoảng 43 calo trên 100 gram củ cải đường tươi.\n\n'
          'Ăn uống\n\n'
          '- Củ cải đường có thể được nướng, luộc, hoặc xào.\n'
          '- Thường được dùng trong các món salad, súp, hoặc làm nước ép.\n\n'
          'Bảo quản\n\n'
          '- Củ cải đường nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 14 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Củ cải trắng',
      value: 'cu-cai-trang',
      icon: 'assets/icons/vegetables/cu-cai-trang.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Củ cải trắng là nguồn cung cấp vitamin C và chất xơ, giúp tăng cường hệ miễn dịch và hỗ trợ tiêu hóa.\n'
          '- Chứa nhiều khoáng chất như canxi, kali, và magiê, giúp duy trì sức khỏe xương và tim mạch.\n'
          '- Có tính kháng viêm và giúp cải thiện chức năng gan.\n'
          'Calo: Khoảng 18 calo trên 100 gram củ cải trắng tươi.\n\n'
          'Ăn uống\n\n'
          '- Củ cải trắng có thể được nấu chín, hấp, hoặc xào.\n'
          '- Thường được dùng trong các món súp, canh, hoặc làm nguyên liệu cho các món chay.\n\n'
          'Bảo quản\n\n'
          '- Củ cải trắng nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 14 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Củ cải',
      value: 'cu-cai',
      icon: 'assets/icons/vegetables/cu-cai.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Củ cải là nguồn cung cấp vitamin C, B6, và chất xơ, giúp tăng cường hệ miễn dịch và hỗ trợ tiêu hóa.\n'
          '- Chứa nhiều khoáng chất như kali và magiê, giúp duy trì sức khỏe xương và tim mạch.\n'
          '- Chứa chất chống oxy hóa và hợp chất kháng viêm, giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 16 calo trên 100 gram củ cải tươi.\n\n'
          'Ăn uống\n\n'
          '- Củ cải có thể được nấu chín, hấp, hoặc xào.\n'
          '- Thường được dùng trong các món súp, canh, hoặc làm nguyên liệu cho các món chay.\n\n'
          'Bảo quản\n\n'
          '- Củ cải nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 14 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Hành tây',
      value: 'hanh-tay',
      icon: 'assets/icons/vegetables/hanh-tay.png',
      type: 'vegetables',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Hành tây là nguồn cung cấp vitamin C, B6, và folate, giúp tăng cường hệ miễn dịch và hỗ trợ chức năng tế bào.\n'
          '- Chứa các hợp chất chống oxy hóa như quercetin, giúp bảo vệ tế bào khỏi tổn thương và kháng viêm.\n'
          '- Có thể giúp giảm nguy cơ mắc bệnh tim mạch và cải thiện sức khỏe tiêu hóa.\n'
          'Calo: Khoảng 40 calo trên 100 gram hành tây tươi.\n\n'
          'Ăn uống\n\n'
          '- Hành tây có thể được nấu chín, nướng, xào, hoặc ăn sống.\n'
          '- Thường được dùng làm gia vị trong nhiều món ăn như salad, súp, và các món xào.\n\n'
          'Bảo quản\n\n'
          '- Hành tây nên được bảo quản ở nơi khô ráo, thoáng mát và tránh ánh nắng trực tiếp.\n'
          '- Sau khi cắt, nên bọc kín và bảo quản trong tủ lạnh để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Hành khô',
      value: 'hanh-kho',
      icon: 'assets/icons/vegetables/hanh-kho.png',
      type: 'vegetables',
      defaultDuration: 30, // days
      note: 'Sức khỏe\n\n'
          '- Hành khô là nguồn cung cấp vitamin C, B6 và folate.\n'
          '- Chứa chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có tác dụng kháng khuẩn và kháng viêm.\n'
          '- Hành khô có thể giúp cải thiện tiêu hóa và tăng cường hệ miễn dịch.\n'
          'Calo: Khoảng 40 calo trên 100 gram hành khô.\n\n'
          'Ăn uống\n\n'
          '- Hành khô có thể được sử dụng để làm gia vị cho nhiều món ăn như xào, nấu canh, làm nước sốt, và nướng.\n'
          '- Có thể thêm hành khô vào các món ăn chay hoặc món khai vị để tăng cường hương vị.\n\n'
          'Bảo quản\n\n'
          '- Hành khô nên được bảo quản ở nơi khô ráo, thoáng mát và tránh ánh nắng trực tiếp.\n'
          '- Có thể giữ hành khô trong túi lưới hoặc hộp thoáng khí để duy trì độ tươi lâu hơn.\n'),
  Category(
      label: 'Cải xoăn',
      value: 'cai-xoan',
      icon: 'assets/icons/vegetables/cai-xoan.png',
      type: 'vegetables',
      defaultDuration: 5, // days
      note: 'Sức khỏe\n\n'
          '- Cải xoăn là nguồn cung cấp vitamin A, C, K và nhiều khoáng chất như sắt và canxi.\n'
          '- Chứa chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có tác dụng chống viêm và hỗ trợ hệ miễn dịch.\n'
          '- Cải xoăn có thể giúp cải thiện tiêu hóa và sức khỏe tim mạch.\n'
          'Calo: Khoảng 35 calo trên 100 gram cải xoăn.\n\n'
          'Ăn uống\n\n'
          '- Cải xoăn có thể được sử dụng trong các món xào, canh, salad, hoặc làm sinh tố.\n'
          '- Có thể thêm cải xoăn vào các món ăn chay hoặc món khai vị để tăng cường hương vị và giá trị dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Cải xoăn nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nên rửa sạch và để ráo trước khi bảo quản để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Cải canh',
      value: 'cai-canh',
      icon: 'assets/icons/vegetables/cai-canh.png',
      type: 'vegetables',
      defaultDuration: 7, // days
      note: 'Sức khỏe\n\n'
          '- Cải canh là nguồn cung cấp vitamin A, C, K và nhiều khoáng chất như sắt và canxi.\n'
          '- Chứa chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có tác dụng chống viêm và hỗ trợ hệ miễn dịch.\n'
          '- Cải canh có thể giúp cải thiện tiêu hóa và sức khỏe tim mạch.\n'
          'Calo: Khoảng 25 calo trên 100 gram cải canh.\n\n'
          'Ăn uống\n\n'
          '- Cải canh có thể được sử dụng trong các món xào, canh, salad.\n'
          '- Có thể thêm cải canh vào các món ăn chay hoặc món khai vị để tăng cường hương vị và giá trị dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Cải canh nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nên rửa sạch và để ráo trước khi bảo quản để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Xà lách dài',
      value: 'xa-lach-dai',
      icon: 'assets/icons/vegetables/xa-lach-dai.png',
      type: 'vegetables',
      defaultDuration: 7, // days
      note: 'Sức khỏe\n\n'
          '- Xà lách dài là nguồn cung cấp vitamin A, C, K và folate.\n'
          '- Chứa nhiều chất xơ giúp duy trì sự khỏe mạnh của đường ruột và hỗ trợ tiêu hóa.\n'
          '- Có tính chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Xà lách dài có thể giúp cải thiện sức khỏe tim mạch và giảm nguy cơ mắc bệnh mãn tính.\n'
          'Calo: Khoảng 15 calo trên 100 gram xà lách dài.\n\n'
          'Ăn uống\n\n'
          '- Xà lách dài có thể được sử dụng trong các món salad, sandwich, hoặc làm nguyên liệu cho các món ăn chay.\n'
          '- Có thể thêm xà lách dài vào các món khai vị để tăng cường hương vị và giá trị dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Xà lách dài nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nên rửa sạch và để ráo trước khi bảo quản để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Cải bẹ xanh',
      value: 'cai-be-xanh',
      icon: 'assets/icons/vegetables/cai-be-xanh.png',
      type: 'vegetables',
      defaultDuration: 7,
      note: 'Sức khỏe\n\n'
          '- Cải bẹ xanh là nguồn cung cấp vitamin A, C, và K, cũng như chất xơ và kali.\n'
          '- Giúp tăng cường hệ miễn dịch và duy trì sức khỏe của da, xương, và mắt.\n'
          '- Có tính kháng viêm và giúp hỗ trợ tiêu hóa.\n'
          'Calo: Khoảng 25 calo trên 100 gram cải bẹ xanh tươi.\n\n'
          'Ăn uống\n\n'
          '- Cải bẹ xanh có thể được nấu chín, xào, hoặc ăn sống.\n'
          '- Thường được dùng trong các món canh, xào, hay làm nguyên liệu cho các món salad.\n\n'
          'Bảo quản\n\n'
          '- Cải bẹ xanh nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 7 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Măng',
      value: 'mang',
      icon: 'assets/icons/vegetables/mang.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Măng là nguồn cung cấp vitamin C, K, và các khoáng chất như kali và magiê.\n'
          '- Giúp tăng cường hệ miễn dịch và duy trì sức khỏe của xương và tim mạch.\n'
          '- Có chứa chất chống oxy hóa và hợp chất kháng viêm, giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 20 calo trên 100 gram măng tươi.\n\n'
          'Ăn uống\n\n'
          '- Măng thường được sử dụng trong các món xào, luộc, nấu canh, hoặc làm nguyên liệu cho các món salad.\n'
          '- Nên sử dụng phần ngọt măng và tránh sử dụng phần gân để có trải nghiệm ăn uống ngon hơn.\n\n'
          'Bảo quản\n\n'
          '- Măng nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 14 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Bắp cải',
      value: 'bap-cai',
      icon: 'assets/icons/vegetables/bap-cai.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Bắp cải là nguồn cung cấp vitamin C, K, và các khoáng chất như canxi và kali.\n'
          '- Giúp tăng cường hệ miễn dịch và duy trì sức khỏe của xương và tim mạch.\n'
          '- Có chứa chất chống oxy hóa và hợp chất kháng viêm, giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 24 calo trên 100 gram bắp cải tươi.\n\n'
          'Ăn uống\n\n'
          '- Bắp cải có thể được nấu chín, xào, luộc, hoặc ăn sống.\n'
          '- Thường được sử dụng trong các món canh, xào, salad, và các món xào.\n\n'
          'Bảo quản\n\n'
          '- Bắp cải nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 14 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Cải thảo',
      value: 'cai-thao',
      icon: 'assets/icons/vegetables/cai-thao.png',
      type: 'vegetables',
      defaultDuration: 14,
      note: 'Sức khỏe\n\n'
          '- Cải thảo là nguồn cung cấp vitamin C, K, và chất xơ, giúp tăng cường hệ miễn dịch và hỗ trợ tiêu hóa.\n'
          '- Có tính kháng viêm và giúp hỗ trợ sức khỏe tim mạch.\n'
          '- Chứa các chất chống oxy hóa, giúp bảo vệ tế bào khỏi tổn thương.\n'
          'Calo: Khoảng 23 calo trên 100 gram cải thảo tươi.\n\n'
          'Ăn uống\n\n'
          '- Cải thảo có thể được nấu chín, xào, luộc, hoặc ăn sống.\n'
          '- Thường được sử dụng trong các món canh, xào, hay làm nguyên liệu cho các món salad.\n\n'
          'Bảo quản\n\n'
          '- Cải thảo nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 14 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Cà rốt',
      value: 'ca-rot',
      icon: 'assets/icons/vegetables/ca-rot.png',
      type: 'vegetables',
      defaultDuration: 30,
      note: 'Sức khỏe\n\n'
          '- Cà rốt là nguồn cung cấp beta-carotene, vitamin A, C, và K, cùng các khoáng chất như kali và magiê.\n'
          '- Giúp bảo vệ tế bào khỏi tổn thương và hỗ trợ chức năng thị lực.\n'
          '- Có tính kháng viêm và giúp cải thiện sức khỏe tim mạch.\n'
          'Calo: Khoảng 41 calo trên 100 gram cà rốt tươi.\n\n'
          'Ăn uống\n\n'
          '- Cà rốt có thể được nấu chín, luộc, nướng, hoặc ăn sống.\n'
          '- Thường được sử dụng trong các món salad, xào, canh, và làm nguyên liệu cho nhiều món ăn khác.\n\n'
          'Bảo quản\n\n'
          '- Cà rốt nên được bảo quản trong tủ lạnh để giữ tươi lâu hơn, nên bọc trong túi nhựa hoặc hộp kín.\n'
          '- Nên sử dụng trong vòng 30 ngày để đảm bảo chất lượng tốt nhất.\n'),
  Category(
      label: 'Cà tím dài',
      value: 'ca-tim-dai',
      icon: 'assets/icons/vegetables/ca-tim-dai.png',
      type: 'vegetables',
      defaultDuration: 7, // days
      note: 'Sức khỏe\n\n'
          '- Cà tím dài là nguồn cung cấp vitamin C, K và các chất chống oxy hóa.\n'
          '- Chứa chất xơ giúp cải thiện tiêu hóa và duy trì sự khỏe mạnh của đường ruột.\n'
          '- Có tính chống viêm và hỗ trợ trong việc kiểm soát đường huyết.\n'
          '- Cà tím dài cũng có thể giúp cải thiện sức khỏe tim mạch.\n'
          'Calo: Khoảng 25 calo trên 100 gram cà tím dài.\n\n'
          'Ăn uống\n\n'
          '- Cà tím dài thường được sử dụng trong các món xào, nấu canh, hoặc nướng.\n'
          '- Có thể thêm cà tím dài vào các món ăn chay hoặc món khai vị để tăng cường hương vị và giá trị dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Cà tím dài nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nên rửa sạch và để ráo trước khi bảo quản để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Củ cải tím',
      value: 'cu-cai-tim',
      icon: 'assets/icons/vegetables/cu-cai-tim.png',
      type: 'vegetables',
      defaultDuration: 14, // days
      note: 'Sức khỏe\n\n'
          '- Củ cải tím là nguồn cung cấp vitamin C, K và chất chống oxy hóa.\n'
          '- Có chứa chất xơ giúp cải thiện tiêu hóa và duy trì sự khỏe mạnh của đường ruột.\n'
          '- Củ cải tím có tác dụng làm giảm cholesterol và hỗ trợ trong việc kiểm soát đường huyết.\n'
          '- Có tính chống viêm và có thể giúp cải thiện sức khỏe tim mạch.\n'
          'Calo: Khoảng 35 calo trên 100 gram củ cải tím.\n\n'
          'Ăn uống\n\n'
          '- Củ cải tím thường được sử dụng trong các món xào, nấu canh, hay làm salad.\n'
          '- Có thể thêm củ cải tím vào các món ăn chay hoặc món khai vị để tăng cường hương vị và dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Củ cải tím nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nên rửa sạch và để ráo trước khi bảo quản để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Súp lơ',
      value: 'sup-lo',
      icon: 'assets/icons/vegetables/sup-lo.png',
      type: 'vegetables',
      defaultDuration: 7, // days
      note: 'Sức khỏe\n\n'
          '- Súp lơ là nguồn cung cấp vitamin C, K và chất xơ.\n'
          '- Chứa nhiều chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có tác dụng kháng viêm và hỗ trợ hệ miễn dịch.\n'
          '- Súp lơ có thể giúp cải thiện tiêu hóa và làm giảm nguy cơ mắc bệnh tim mạch.\n'
          'Calo: Khoảng 25 calo trên 100 gram súp lơ.\n\n'
          'Ăn uống\n\n'
          '- Súp lơ thường được sử dụng trong các món xào, nấu canh, hay làm nước súp.\n'
          '- Có thể thêm súp lơ vào các món ăn chay hoặc món khai vị để tăng cường hương vị và dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Súp lơ nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nên rửa sạch và để ráo trước khi bảo quản để giữ tươi lâu hơn.\n'),
  Category(
      label: 'Bí ngô',
      value: 'bi-ngo',
      icon: 'assets/icons/vegetables/bi-ngo.png',
      type: 'vegetables',
      defaultDuration: 30, // days
      note: 'Sức khỏe\n\n'
          '- Bí ngô là nguồn cung cấp vitamin A, C và các chất chống oxy hóa.\n'
          '- Chứa chất xơ giúp cải thiện tiêu hóa và duy trì sự khỏe mạnh của đường ruột.\n'
          '- Có tác dụng giảm cholesterol và hỗ trợ trong việc kiểm soát đường huyết.\n'
          '- Bí ngô cũng có tính chống viêm và có thể giúp cải thiện sức khỏe tim mạch.\n'
          'Calo: Khoảng 30 calo trên 100 gram bí ngô.\n\n'
          'Ăn uống\n\n'
          '- Bí ngô thường được sử dụng trong các món nướng, hầm, xào và làm bánh.\n'
          '- Có thể thêm bí ngô vào các món ăn chay hoặc món khai vị để tăng cường hương vị và dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Bí ngô nên được bảo quản trong nơi khô ráo, thoáng mát và không tiếp xúc trực tiếp với ánh nắng mặt trời.\n'
          '- Nên lưu ý không để bí ngô bị va đập để tránh làm hỏng vỏ và giữ nguyên độ tươi của sản phẩm.\n'),
  Category(
      label: 'Bí đỏ',
      value: 'bi-do',
      icon: 'assets/icons/vegetables/bi-do.png',
      type: 'vegetables',
      defaultDuration: 30, // days
      note: 'Sức khỏe\n\n'
          '- Bí đỏ là nguồn cung cấp vitamin A, C và các chất chống oxy hóa.\n'
          '- Chứa chất xơ giúp cải thiện tiêu hóa và duy trì sự khỏe mạnh của đường ruột.\n'
          '- Có tác dụng giảm cholesterol và hỗ trợ trong việc kiểm soát đường huyết.\n'
          '- Bí đỏ cũng có tính chống viêm và có thể giúp cải thiện sức khỏe tim mạch.\n'
          'Calo: Khoảng 30 calo trên 100 gram bí đỏ.\n\n'
          'Ăn uống\n\n'
          '- Bí đỏ thường được sử dụng trong các món nướng, hầm, xào và làm bánh.\n'
          '- Có thể thêm bí đỏ vào các món ăn chay hoặc món khai vị để tăng cường hương vị và dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Bí đỏ nên được bảo quản trong nơi khô ráo, thoáng mát và không tiếp xúc trực tiếp với ánh nắng mặt trời.\n'
          '- Nên lưu ý không để bí đỏ bị va đập để tránh làm hỏng vỏ và giữ nguyên độ tươi của sản phẩm.\n'),
  Category(
      label: 'Cải chíp',
      value: 'cai-chip',
      icon: 'assets/icons/vegetables/cai-chip.png',
      type: 'vegetables',
      defaultDuration: 7, // days
      note: 'Sức khỏe\n\n'
          '- Cải chíp là nguồn cung cấp vitamin A, C, K và chất xơ.\n'
          '- Chứa nhiều chất chống oxy hóa giúp bảo vệ tế bào khỏi tổn thương.\n'
          '- Có tính chống viêm và hỗ trợ trong việc giảm nguy cơ mắc bệnh tim mạch.\n'
          '- Cải chíp cũng giúp cải thiện tiêu hóa và duy trì sự khỏe mạnh của đường ruột.\n'
          'Calo: Khoảng 25 calo trên 100 gram cải chíp.\n\n'
          'Ăn uống\n\n'
          '- Cải chíp thường được sử dụng trong các món xào, nấu canh, hay làm salad.\n'
          '- Có thể thêm cải chíp vào các món ăn chay hoặc món khai vị để tăng cường hương vị và dinh dưỡng.\n\n'
          'Bảo quản\n\n'
          '- Cải chíp nên được bảo quản trong tủ lạnh, nơi khô ráo và thoáng mát.\n'
          '- Nên rửa sạch và để ráo trước khi bảo quản để giữ tươi lâu hơn.\n')
];

List<Category> meats = [
  Category(
      label: 'Bụng heo',
      value: 'bung-heo',
      icon: 'assets/icons/meats/bung-heo.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của bụng heo:\n\n'
          '1. Cung cấp năng lượng: Bụng heo là nguồn cung cấp năng lượng dồi dào, giúp duy trì hoạt động và chức năng của cơ thể.\n\n'
          '2. Chất đạm và các khoáng chất: Bụng heo chứa nhiều chất đạm và khoáng chất như sắt, kẽm và selen, cần thiết cho sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Vitamin B12: Giúp duy trì hệ thần kinh hoạt động bình thường và sản xuất tế bào hồng cầu.\n\n'
          '4. Omega-3: Duy trì sức khỏe tim mạch và giảm nguy cơ viêm.\n\n'
          '5. Lượng calo: Bụng heo có thể có lượng calo cao, do đó nên tiêu thụ với lượng vừa phải để tránh thừa cân.\n\n'
          '6. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Bụng heo thường được sử dụng để nấu canh, xào hay nướng. Cách nấu này giúp giảm lượng chất béo dư thừa.\n\n'
          '- Bảo quản: Bụng heo tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để tránh bị hư hỏng và mất đi hương vị.'),
  Category(
      label: 'Cánh gà',
      value: 'canh-ga',
      icon: 'assets/icons/meats/canh-ga.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của cánh gà:\n\n'
          '1. Nguồn protein: Cánh gà là một nguồn protein giàu giúp xây dựng và duy trì cơ bắp.\n\n'
          '2. Vitamin và khoáng chất: Chứa nhiều vitamin B6, B12, và khoáng chất như sắt, kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Chất béo: Cánh gà cũng chứa một lượng chất béo tốt, đặc biệt là axit béo omega-3, có lợi cho sức khỏe tim mạch.\n\n'
          '4. Lượng calo: Cánh gà có thể có lượng calo khá thấp, tuy nhiên nên chế biến một cách hợp lý để tránh thêm chất béo dư thừa.\n\n'
          '5. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Cánh gà thường được nướng, chiên, hay nấu súp. Các phương pháp này giữ được giá trị dinh dưỡng và vị ngon của cánh gà.\n\n'
          '- Bảo quản: Cánh gà tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được hương vị và chất lượng.'),
  Category(
      label: 'Chân giò',
      value: 'chan-gio',
      icon: 'assets/icons/meats/chan-gio.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của chân giò:\n\n'
          '1. Chất đạm: Chân giò là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Chân giò cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Chân giò cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Lượng calo: Chân giò có thể có lượng calo cao, do đó nên tiêu thụ với lượng vừa phải để tránh thừa cân.\n\n'
          '5. Omega-3: Giúp hỗ trợ sức khỏe tim mạch và giảm viêm.\n\n'
          '6. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Chân giò thường được nấu cháo, hầm hay nướng. Các phương pháp này giúp giảm lượng chất béo.\n\n'
          '- Bảo quản: Chân giò tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được hương vị và chất lượng.'),
  Category(
      label: 'Đùi gà',
      value: 'dui-ga',
      icon: 'assets/icons/meats/dui-ga.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của đùi gà:\n\n'
          '1. Chất đạm: Đùi gà là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Đùi gà cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Đùi gà cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Đùi gà thường được nướng, xào hoặc hầm. Các phương pháp này giúp giữ được hương vị và dinh dưỡng của thực phẩm.\n\n'
          '- Bảo quản: Đùi gà tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Gà',
      value: 'ga',
      icon: 'assets/icons/meats/ga.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của thịt gà:\n\n'
          '1. Nguồn protein giàu dinh dưỡng: Thịt gà ngực là nguồn protein giàu chất béo thấp, hỗ trợ sự phát triển cơ bắp và phát triển. Protein này cũng giúp duy trì cân nặng lành mạnh và hỗ trợ giảm cân.\n\n'
          '2. Phosphorus: Gà cung cấp phốt pho là khoáng chất quan trọng hỗ trợ răng, xương, và chức năng của thận, gan và hệ thần kinh trung ương.\n\n'
          '3. Vitamin B6 và Niacin: Vitamin B6 giúp duy trì sức khỏe mạch máu, năng lượng cao và giảm lượng calo. Niacin bảo vệ khỏi ung thư và hư hỏng gen.\n\n'
          '4. Tăng hàm lượng serotonin: Ăn thịt gà có thể tăng mức độ serotonin trong não, cải thiện tâm trạng và giảm căng thẳng.\n\n'
          '5. Vitamin A và Riboflavin: Thịt gà giàu retinol, beta-carotene và lycopene, tất cả cần thiết cho sự khỏe mạnh của thị lực. Riboflavin giúp giảm vấn đề da và phục hồi da khô hoặc hư hại.\n\n'
          '6. Chống lại loãng xương: Protein trong thịt gà giúp ngăn ngừa mất xương, hữu ích đặc biệt cho người cao tuổi lo lắng về loãng xương hoặc viêm khớp.\n\n'
          'Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Cách làm nấu gà lành mạnh nhất là nướng trong lò hoặc xào với rau củ. Đặt các phần thịt vào khuôn nướng, thoa dầu olive, và thêm tỏi, chanh, cà rốt, hoặc các gia vị mà bạn thích.\n\n'
          '- Bảo quản: Thịt gà tươi chỉ có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu bạn bảo quản thịt gà đã nấu trong tủ lạnh, nó có thể an toàn để sử dụng sau khi đông lạnh trong vòng 4 tháng, miễn là bạn đóng gói kín và an toàn.'),
  Category(
      label: 'Gà tây',
      value: 'ga-tay',
      icon: 'assets/icons/meats/ga-tay.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của gà tây:\n\n'
          '1. Chất đạm: Gà tây là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Gà tây cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Gà tây cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Gà tây thường được nướng, hầm hay nấu canh. Các phương pháp này giúp giữ được hương vị và dinh dưỡng của thực phẩm.\n\n'
          '- Bảo quản: Gà tây tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Giăm bông',
      value: 'giam-bong',
      icon: 'assets/icons/meats/giam-bong.png',
      type: 'meats',
      defaultDuration: 5, // days
      note: 'Đây là các lợi ích sức khỏe của giăm bông:\n\n'
          '1. Chất đạm: Giăm bông là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Giăm bông cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Giăm bông cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Giăm bông thường được nấu cháo, hầm hay nướng. Các phương pháp này giúp giữ được hương vị và dinh dưỡng của thực phẩm.\n\n'
          '- Bảo quản: Giăm bông tươi có thể bảo quản trong tủ lạnh khoảng 3-5 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Giò tươi',
      value: 'gio-tuoi',
      icon: 'assets/icons/meats/gio-tuoi.png',
      type: 'meats',
      defaultDuration: 3, // days
      note: 'Đây là các lợi ích sức khỏe của giò tươi:\n\n'
          '1. Chất đạm: Giò tươi là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Giò tươi cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Giò tươi cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Giò tươi thường được ướp gia vị và nấu để ăn kèm với cơm hoặc bánh mì.\n\n'
          '- Bảo quản: Giò tươi tươi có thể bảo quản trong tủ lạnh khoảng 2-3 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Jamon',
      value: 'jamon',
      icon: 'assets/icons/meats/jamon.png',
      type: 'meats',
      defaultDuration: 5, // days
      note: 'Đây là các lợi ích sức khỏe của Jamon:\n\n'
          '1. Chất đạm: Jamon là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Jamon cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Jamon cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Jamon thường được ướp muối và chín để tạo ra hương vị đặc trưng. Thường được ăn sống.\n\n'
          '- Bảo quản: Jamon tươi có thể bảo quản trong tủ lạnh khoảng 5 ngày. Nên bảo quản trong túi chống thấm hoặc giấy màng để giữ hương vị và chất lượng.'),
  Category(
      label: 'Mắt sườn',
      value: 'mat-suon',
      icon: 'assets/icons/meats/mat-suon.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của mắt sườn:\n\n'
          '1. Chất đạm: Mắt sườn là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Mắt sườn cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Mắt sườn cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Mắt sườn thường được nướng, hầm hay nấu cháo. Các phương pháp này giúp giữ được hương vị và dinh dưỡng của thực phẩm.\n\n'
          '- Bảo quản: Mắt sườn tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Prosciutto',
      value: 'prosciutto',
      icon: 'assets/icons/meats/prosciutto.png',
      type: 'meats',
      defaultDuration: 5, // days
      note: 'Đây là các lợi ích sức khỏe của Prosciutto:\n\n'
          '1. Chất đạm: Prosciutto là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Prosciutto cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Prosciutto cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Prosciutto thường được cắt mỏng và ăn sống, hoặc được sử dụng trong các món salad và món khai vị.\n\n'
          '- Bảo quản: Prosciutto tươi có thể bảo quản trong tủ lạnh khoảng 5 ngày. Nên bảo quản trong túi chống thấm hoặc giấy màng để giữ hương vị và chất lượng.'),
  Category(
      label: 'Thịt thăn',
      value: 'thit-than',
      icon: 'assets/icons/meats/thit-than.png',
      type: 'meats',
      defaultDuration: 3, // days
      note: 'Đây là các lợi ích sức khỏe của thịt thăn:\n\n'
          '1. Chất đạm: Thịt thăn là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Thịt thăn cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Thịt thăn cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Thịt thăn thường được nướng, hầm hoặc nấu cháo. Các phương pháp này giúp giữ được hương vị và dinh dưỡng của thực phẩm.\n\n'
          '- Bảo quản: Thịt thăn tươi có thể bảo quản trong tủ lạnh khoảng 3 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Thịt ba rọi',
      value: 'thit-ba-roi',
      icon: 'assets/icons/meats/thit-ba-roi.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của thịt ba rọi:\n\n'
          '1. Chất đạm: Thịt ba rọi là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Thịt ba rọi cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Thịt ba rọi cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Thịt ba rọi thường được nướng, xào hoặc hầm. Các phương pháp này giúp giữ được hương vị và dinh dưỡng của thực phẩm.\n\n'
          '- Bảo quản: Thịt ba rọi tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Thịt bò',
      value: 'thit-bo',
      icon: 'assets/icons/meats/thit-bo.png',
      type: 'meats',
      defaultDuration: 3, // days
      note: 'Đây là các lợi ích sức khỏe của thịt bò:\n\n'
          '1. Chất đạm: Thịt bò là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Thịt bò cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Thịt bò cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Thịt bò thường được nướng, xào hoặc nấu kho để giữ được hương vị và dinh dưỡng.\n\n'
          '- Bảo quản: Thịt bò tươi có thể bảo quản trong tủ lạnh khoảng 2-3 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Thịt cừu',
      value: 'thit-cuu',
      icon: 'assets/icons/meats/thit-cuu.png',
      type: 'meats',
      defaultDuration: 3, // days
      note: 'Đây là các lợi ích sức khỏe của thịt cừu:\n\n'
          '1. Chất đạm: Thịt cừu là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Thịt cừu cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Thịt cừu cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Thịt cừu thường được nướng hoặc hầm để giữ được hương vị đặc trưng.\n\n'
          '- Bảo quản: Thịt cừu tươi có thể bảo quản trong tủ lạnh khoảng 2-3 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Thịt heo',
      value: 'thit-heo',
      icon: 'assets/icons/meats/thit-heo.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của thịt heo:\n\n'
          '1. Cung cấp năng lượng: Thịt heo là nguồn cung cấp năng lượng dồi dào, giúp duy trì hoạt động và chức năng của cơ thể.\n\n'
          '2. Chất đạm và các khoáng chất: Thịt heo cung cấp nhiều chất đạm và khoáng chất như sắt, kẽm và selen, cần thiết cho sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Vitamin B12: Giúp duy trì hệ thần kinh hoạt động bình thường và sản xuất tế bào hồng cầu.\n\n'
          '4. Omega-3: Duy trì sức khỏe tim mạch và giảm nguy cơ viêm.\n\n'
          '5. Lượng calo: Thịt heo có thể có lượng calo cao, do đó nên tiêu thụ với lượng vừa phải để tránh thừa cân.\n\n'
          '6. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Thịt heo có thể được nấu chín, xào, nướng, hay sử dụng trong các món hầm. Chế biến này giúp giảm lượng chất béo dư thừa.\n\n'
          '- Bảo quản: Thịt heo tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để tránh bị hư hỏng và mất đi hương vị.'),
  Category(
      label: 'Tomahawk',
      value: 'tomahawk',
      icon: 'assets/icons/meats/tomahawk.png',
      type: 'meats',
      defaultDuration: 3, // days
      note: 'Đây là các lợi ích sức khỏe của Tomahawk:\n\n'
          '1. Chất đạm: Tomahawk là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Tomahawk cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Tomahawk cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Tomahawk thường được nướng hoặc nấu chín để giữ được hương vị đặc trưng.\n\n'
          '- Bảo quản: Tomahawk tươi có thể bảo quản trong tủ lạnh khoảng 2-3 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Trứng',
      value: 'trung',
      icon: 'assets/icons/meats/trung.png',
      type: 'meats',
      defaultDuration: 21, // days
      note: 'Đây là các lợi ích sức khỏe của trứng:\n\n'
          '1. Protein: Trứng là nguồn giàu chất đạm và protein dễ tiêu hóa.\n\n'
          '2. Vitamin và khoáng chất: Trứng cung cấp nhiều vitamin nhóm B, vitamin D, sắt và kẽm.\n\n'
          '3. Duy trì cân bằng năng lượng: Trứng cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Trứng có thể được nấu, chiên, hoặc dùng để làm các món tráng miệng và món nhẹ.\n\n'
          '- Bảo quản: Trứng tươi có thể bảo quản trong tủ lạnh khoảng 3 tuần. Nên bảo quản trong lòng bàn tay khi lấy ra từ tủ lạnh để tránh sự thay đổi nhiệt độ gây ẩm ướt, ẩn dụng và hư hỏng hương vị.'),
  Category(
      label: 'Trứng cút',
      value: 'trung-cut',
      icon: 'assets/icons/meats/trung-cut.png',
      type: 'meats',
      defaultDuration: 21, // days
      note: 'Đây là các lợi ích sức khỏe của trứng cút:\n\n'
          '1. Protein: Trứng cút là nguồn giàu chất đạm và protein dễ tiêu hóa.\n\n'
          '2. Vitamin và khoáng chất: Trứng cút cung cấp nhiều vitamin nhóm B, vitamin D, sắt và kẽm.\n\n'
          '3. Duy trì cân bằng năng lượng: Trứng cút cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Trứng cút thường được luộc hoặc nấu súp. Có thể dùng làm món tráng miệng hoặc nhâm nhi trong các buổi tiệc.\n\n'
          '- Bảo quản: Trứng cút tươi có thể bảo quản trong tủ lạnh khoảng 3 tuần. Nên bảo quản trong lòng bàn tay khi lấy ra từ tủ lạnh để tránh sự thay đổi nhiệt độ gây ẩm ướt, ẩn dụng và hư hỏng hương vị.'),
  Category(
      label: 'Ức gà',
      value: 'uc-ga',
      icon: 'assets/icons/meats/uc-ga.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của ức gà:\n\n'
          '1. Chất đạm: Ức gà là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Ức gà cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Ức gà cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Ức gà thường được nướng, xào hoặc nấu chín. Các phương pháp này giúp giữ được hương vị và dinh dưỡng của thực phẩm.\n\n'
          '- Bảo quản: Ức gà tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Vịt',
      value: 'vit',
      icon: 'assets/icons/meats/vit.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của thịt vịt:\n\n'
          '1. Chất đạm: Thịt vịt là một nguồn giàu chất đạm cần thiết cho sự phát triển và sửa chữa cơ thể.\n\n'
          '2. Vitamin và khoáng chất: Thịt vịt cung cấp các vitamin nhóm B, sắt và kẽm, giúp duy trì sức khỏe tim mạch và hệ miễn dịch.\n\n'
          '3. Duy trì cân bằng năng lượng: Thịt vịt cung cấp năng lượng cần thiết cho hoạt động hàng ngày.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Thịt vịt thường được nấu chín hoặc xào để giữ được hương vị đặc trưng.\n\n'
          '- Bảo quản: Thịt vịt tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Xúc xích',
      value: 'xuc-xich',
      icon: 'assets/icons/meats/xuc-xich.png',
      type: 'meats',
      defaultDuration: 7, // days
      note: 'Đây là các lợi ích sức khỏe của xúc xích:\n\n'
          '1. Protein: Xúc xích là một nguồn cung cấp protein dễ tiêu hóa cho cơ thể.\n\n'
          '2. Năng lượng: Xúc xích cung cấp năng lượng dồi dào, phù hợp cho các hoạt động hàng ngày.\n\n'
          '3. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Xúc xích thường được chiên, nướng hoặc luộc. Các phương pháp này giúp giữ được hương vị và dinh dưỡng.\n\n'
          '- Bảo quản: Xúc xích có thể bảo quản trong tủ lạnh khoảng 5-7 ngày. Nếu đã mở bao bì và không sử dụng hết, nên bảo quản lại trong hộp đựng kín để tránh khô và mất đi hương vị.'),
  Category(
      label: 'Xúc xích cay',
      value: 'xuc-xich-cay',
      icon: 'assets/icons/meats/xuc-xich-cay.png',
      type: 'meats',
      defaultDuration: 7, // days
      note: 'Đây là các lợi ích sức khỏe của xúc xích cay:\n\n'
          '1. Protein: Xúc xích cay là một nguồn cung cấp protein dễ tiêu hóa cho cơ thể.\n\n'
          '2. Năng lượng: Xúc xích cay cung cấp năng lượng dồi dào, phù hợp cho các hoạt động hàng ngày.\n\n'
          '3. Hương vị: Xúc xích cay có hương vị đặc trưng và thường được ưa chuộng trong các món ăn nhanh.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Xúc xích cay thường được chiên, nướng hoặc sử dụng làm nguyên liệu trong các món nấu.\n\n'
          '- Bảo quản: Xúc xích cay có thể bảo quản trong tủ lạnh khoảng 5-7 ngày. Nếu đã mở bao bì và không sử dụng hết, nên bảo quản lại trong hộp đựng kín để tránh khô và mất đi hương vị.'),
  Category(
      label: 'Xúc xích hun khói',
      value: 'xuc-xich-hun-khoi',
      icon: 'assets/icons/meats/xuc-xich-hun-khoi.png',
      type: 'meats',
      defaultDuration: 7, // days
      note: 'Đây là các lợi ích sức khỏe của xúc xích hun khói:\n\n'
          '1. Protein: Xúc xích hun khói là một nguồn cung cấp protein dễ tiêu hóa cho cơ thể.\n\n'
          '2. Năng lượng: Xúc xích hun khói cung cấp năng lượng dồi dào, phù hợp cho các hoạt động hàng ngày.\n\n'
          '3. Hương vị: Xúc xích hun khói có hương vị đặc trưng và thường được ưa chuộng trong các món ăn nhanh.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Xúc xích hun khói thường được chiên, nướng hoặc sử dụng làm nguyên liệu trong các món nấu.\n\n'
          '- Bảo quản: Xúc xích hun khói có thể bảo quản trong tủ lạnh khoảng 5-7 ngày. Nếu đã mở bao bì và không sử dụng hết, nên bảo quản lại trong hộp đựng kín để tránh khô và mất đi hương vị.'),
  Category(
      label: 'Xúc xích Ý',
      value: 'xuc-xich-y',
      icon: 'assets/icons/meats/xuc-xich-y.png',
      type: 'meats',
      defaultDuration: 7, // days
      note: 'Đây là các lợi ích sức khỏe của xúc xích Ý:\n\n'
          '1. Protein: Xúc xích Ý là một nguồn cung cấp protein dễ tiêu hóa cho cơ thể.\n\n'
          '2. Năng lượng: Xúc xích Ý cung cấp năng lượng dồi dào, phù hợp cho các hoạt động hàng ngày.\n\n'
          '3. Hương vị: Xúc xích Ý có hương vị đặc trưng và thường được ưa chuộng trong các món ăn nhanh.\n\n'
          '4. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Xúc xích Ý thường được chiên, nướng hoặc sử dụng làm nguyên liệu trong các món nấu.\n\n'
          '- Bảo quản: Xúc xích Ý có thể bảo quản trong tủ lạnh khoảng 5-7 ngày. Nếu đã mở bao bì và không sử dụng hết, nên bảo quản lại trong hộp đựng kín để tránh khô và mất đi hương vị.'),
  Category(
      label: 'Xương chữ T',
      value: 'xuong-chu-t',
      icon: 'assets/icons/meats/xuong-chu-t.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của xương chữ T:\n\n'
          '1. Canxi: Xương chữ T là một nguồn giàu canxi và khoáng chất cần thiết cho sự phát triển và bảo vệ xương khỏe mạnh.\n\n'
          '2. Duy trì cân bằng nước và điện giải: Xương chữ T cung cấp collagen và các chất dinh dưỡng giúp duy trì cân bằng nước và điện giải cho cơ thể.\n\n'
          '3. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Xương chữ T thường được hầm hoặc nấu để chiết xuất hương vị và dinh dưỡng.\n\n'
          '- Bảo quản: Xương chữ T tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
  Category(
      label: 'Xương sườn',
      value: 'xuong-suon',
      icon: 'assets/icons/meats/xuong-suon.png',
      type: 'meats',
      defaultDuration: 2, // days
      note: 'Đây là các lợi ích sức khỏe của xương sườn:\n\n'
          '1. Canxi: Xương sườn là một nguồn giàu canxi và khoáng chất cần thiết cho sự phát triển và bảo vệ xương khỏe mạnh.\n\n'
          '2. Duy trì cân bằng nước và điện giải: Xương sườn cung cấp collagen và các chất dinh dưỡng giúp duy trì cân bằng nước và điện giải cho cơ thể.\n\n'
          '3. Cách chế biến và bảo quản:\n\n'
          '- Chế biến: Xương sườn thường được hầm hoặc nấu để chiết xuất hương vị và dinh dưỡng.\n\n'
          '- Bảo quản: Xương sườn tươi có thể bảo quản trong tủ lạnh khoảng 1-2 ngày. Nếu đã nấu chín và muốn bảo quản lâu dài, nên đông lạnh và đóng gói kín để giữ được chất lượng.'),
];

List<Category> seafood = [
  Category(
    label: 'Ốc',
    value: 'oc',
    icon: 'assets/icons/seafood/oc.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của ốc:\n\n'
        '1. Giàu protein: Ốc là nguồn cung cấp protein dồi dào, cần thiết cho xây dựng và duy trì cơ bắp.\n\n'
        '2. Giàu vitamin: Ốc chứa nhiều vitamin A, B12 và E, giúp tăng cường hệ miễn dịch và chức năng não bộ.\n\n'
        '3. Giàu khoáng chất: Ốc chứa nhiều khoáng chất như sắt, canxi, giúp duy trì sức khỏe xương khớp và tuần hoàn máu.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mua ốc tươi ngon, không có mùi lạ.\n\n'
        '* Rửa sạch và luộc kỹ trước khi ăn để tránh nguy cơ nhiễm khuẩn.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Ốc luộc: Luộc ốc với sả, lá chanh để giữ nguyên hương vị tự nhiên.\n\n'
        '* Ốc xào: Xào ốc với tỏi, ớt và rau răm để tăng hương vị.\n\n',
  ),
  Category(
    label: 'Tôm sú',
    value: 'tom-su',
    icon: 'assets/icons/seafood/tom-su.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của tôm sú:\n\n'
        '1. Giàu protein: Tôm sú là nguồn cung cấp protein dồi dào, cần thiết cho xây dựng và duy trì cơ bắp.\n\n'
        '2. Ít béo: Tôm sú chứa rất ít chất béo, phù hợp cho người đang ăn kiêng.\n\n'
        '3. Giàu khoáng chất: Tôm sú chứa nhiều khoáng chất cần thiết cho cơ thể như selen, kẽm, sắt và canxi, giúp duy trì sức khỏe tim mạch, xương khớp và hệ miễn dịch.\n\n'
        '4. Vitamin B12: Tôm sú là nguồn cung cấp vitamin B12 dồi dào, giúp duy trì hệ thần kinh khỏe mạnh và sản xuất tế bào hồng cầu.\n\n'
        '5. Choline: Tôm sú chứa choline, một chất dinh dưỡng quan trọng cho trí nhớ và chức năng não bộ.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mua tôm sú tươi ngon, có màu sắc sáng bóng, thịt chắc. Tránh mua tôm bị chảy nhớt, có mùi lạ.\n\n'
        '* Tôm sú có thể chế biến thành nhiều món ăn ngon như hấp, nướng, xào, nấu canh...\n\n'
        '* Người bị dị ứng với hải sản nên tránh ăn tôm sú.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Tôm sú hấp: Hấp tôm sú với sả, gừng, ớt để giữ nguyên hương vị ngọt tự nhiên của tôm.\n\n'
        '* Tôm sú nướng: Nướng tôm sú trên than hoa hoặc trong lò nướng, tẩm ướp gia vị yêu thích để món ăn thêm đậm đà.\n\n'
        '* Tôm sú xào: Xào tôm sú với các loại rau củ quả như bông cải xanh, ớt chuông, nấm,... để có món ăn đầy đủ dinh dưỡng.\n\n'
        '* Tôm sú nấu canh: Nấu canh tôm sú với mướp, rau đay, mồng tơi,... để có món canh thanh mát, bổ dưỡng.\n\n',
  ),
  Category(
    label: 'Tôm hùm',
    value: 'tom-hum',
    icon: 'assets/icons/seafood/tom-hum.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của tôm hùm:\n\n'
        '1. Giàu protein: Tôm hùm cung cấp protein chất lượng cao, cần thiết cho cơ bắp và sự phát triển của cơ thể.\n\n'
        '2. Giàu khoáng chất: Tôm hùm chứa nhiều khoáng chất như kẽm, sắt và đồng, hỗ trợ hệ miễn dịch và sức khỏe tim mạch.\n\n'
        '3. Omega-3: Tôm hùm là nguồn cung cấp omega-3 tốt, giúp cải thiện sức khỏe não bộ và tim mạch.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mua tôm hùm tươi sống, tránh mua tôm có mùi lạ hoặc vỏ mềm.\n\n'
        '* Tôm hùm có thể chế biến thành nhiều món ăn ngon như nướng, hấp, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Tôm hùm hấp: Hấp tôm hùm với rượu vang trắng và thảo mộc để giữ nguyên hương vị tự nhiên.\n\n'
        '* Tôm hùm nướng: Nướng tôm hùm trên than hoa, tẩm bơ tỏi để tăng hương vị.\n\n',
  ),
  Category(
    label: 'Trứng cá muối',
    value: 'trung-ca-muoi',
    icon: 'assets/icons/seafood/trung-ca-muoi.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của trứng cá muối:\n\n'
        '1. Giàu omega-3: Trứng cá muối là nguồn cung cấp omega-3 phong phú, tốt cho tim mạch và não bộ.\n\n'
        '2. Giàu protein: Trứng cá muối cung cấp lượng protein chất lượng cao, cần thiết cho cơ thể.\n\n'
        '3. Vitamin D: Trứng cá muối chứa nhiều vitamin D, giúp duy trì xương chắc khỏe và hệ miễn dịch mạnh mẽ.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mua trứng cá muối tươi ngon, không có mùi hôi.\n\n'
        '* Trứng cá muối có thể dùng ăn kèm với bánh mì, salad hoặc sushi.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Trứng cá muối trên bánh mì: Ăn kèm với bánh mì, bơ và ít chanh để tăng hương vị.\n\n'
        '* Sushi trứng cá muối: Kết hợp với sushi để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Ngao',
    value: 'ngao',
    icon: 'assets/icons/seafood/ngao.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của ngao:\n\n'
        '1. Giàu protein: Ngao là nguồn cung cấp protein dồi dào, tốt cho sức khỏe cơ bắp.\n\n'
        '2. Giàu vitamin và khoáng chất: Ngao chứa nhiều vitamin B12, sắt, và kẽm, tốt cho hệ thần kinh và máu.\n\n'
        '3. Ít calo: Ngao chứa ít calo, phù hợp cho người đang ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn ngao tươi, vỏ cứng và không có mùi lạ.\n\n'
        '* Rửa sạch và nấu chín kỹ trước khi ăn.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Ngao hấp: Hấp ngao với sả và gừng để giữ nguyên hương vị.\n\n'
        '* Canh ngao: Nấu canh ngao với mướp và rau mồng tơi để món ăn thanh mát.\n\n',
  ),
  Category(
    label: 'Nhím biển',
    value: 'nhim-bien',
    icon: 'assets/icons/seafood/nhim-bien.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của nhím biển:\n\n'
        '1. Giàu protein: Nhím biển cung cấp protein chất lượng cao.\n\n'
        '2. Giàu omega-3: Nhím biển là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '3. Chứa nhiều khoáng chất: Nhím biển giàu kẽm, sắt và canxi, tốt cho xương và hệ miễn dịch.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nhím biển tươi ngon, không có mùi lạ.\n\n'
        '* Nhím biển có thể ăn sống hoặc chế biến thành nhiều món ngon.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Nhím biển sashimi: Ăn sống nhím biển với nước chấm chanh muối.\n\n'
        '* Nhím biển nướng: Nướng nhím biển với bơ tỏi để tăng hương vị.\n\n',
  ),
  Category(
    label: 'Rong biển',
    value: 'rong-bien',
    icon: 'assets/icons/seafood/rong-bien.png',
    type: 'seafood',
    defaultDuration: 5, // days
    note: 'Lợi ích sức khỏe của rong biển:\n\n'
        '1. Giàu vitamin và khoáng chất: Rong biển chứa nhiều vitamin A, C, E, K, canxi và sắt.\n\n'
        '2. Giàu chất xơ: Rong biển cung cấp lượng chất xơ dồi dào, tốt cho tiêu hóa.\n\n'
        '3. Chứa chất chống oxy hóa: Rong biển chứa nhiều chất chống oxy hóa, tốt cho da và hệ miễn dịch.\n\n'
        'Lưu ý:\n\n'
        '* Chọn rong biển sạch, không có mùi lạ.\n\n'
        '* Rong biển có thể dùng ăn kèm với cơm, làm salad hoặc canh.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Canh rong biển: Nấu canh rong biển với đậu hũ và thịt bò.\n\n'
        '* Salad rong biển: Trộn rong biển với rau sống và nước chấm.\n\n',
  ),
  Category(
    label: 'Sò huyết',
    value: 'so-huyet',
    icon: 'assets/icons/seafood/so-huyet.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của sò huyết:\n\n'
        '1. Giàu protein: Sò huyết là nguồn cung cấp protein chất lượng cao.\n\n'
        '2. Giàu sắt: Sò huyết chứa nhiều sắt, tốt cho máu và hệ thần kinh.\n\n'
        '3. Chứa nhiều khoáng chất: Sò huyết giàu kẽm, magiê, tốt cho sức khỏe tổng thể.\n\n'
        'Lưu ý:\n\n'
        '* Chọn sò huyết tươi, không có mùi lạ.\n\n'
        '* Sò huyết có thể chế biến thành nhiều món ngon như nướng, hấp, xào...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Sò huyết nướng: Nướng sò huyết với mỡ hành để tăng hương vị.\n\n'
        '* Sò huyết xào tỏi: Xào sò huyết với tỏi và rau muống.\n\n',
  ),
  Category(
    label: 'Trứng cá',
    value: 'trung-ca',
    icon: 'assets/icons/seafood/trung-ca.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của trứng cá:\n\n'
        '1. Giàu omega-3: Trứng cá là nguồn cung cấp omega-3 phong phú.\n\n'
        '2. Giàu protein: Trứng cá cung cấp lượng protein chất lượng cao, tốt cho cơ bắp.\n\n'
        '3. Chứa nhiều vitamin: Trứng cá giàu vitamin D và B12, tốt cho xương và hệ thần kinh.\n\n'
        'Lưu ý:\n\n'
        '* Chọn trứng cá tươi, không có mùi lạ.\n\n'
        '* Trứng cá có thể chế biến thành nhiều món ngon như chiên, nướng, hấp...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Trứng cá chiên: Chiên trứng cá với hành và tiêu để tăng hương vị.\n\n'
        '* Trứng cá hấp: Hấp trứng cá với nước dừa để món ăn thêm ngọt ngào.\n\n',
  ),
  Category(
    label: 'Mực ống',
    value: 'muc-ong',
    icon: 'assets/icons/seafood/muc-ong.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của mực ống:\n\n'
        '1. Giàu protein: Mực ống là nguồn cung cấp protein tốt, cần thiết cho cơ bắp.\n\n'
        '2. Giàu vitamin và khoáng chất: Mực ống chứa nhiều vitamin B12, kẽm và đồng.\n\n'
        '3. Ít calo và chất béo: Mực ống phù hợp cho người ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mực tươi, thịt chắc, không có mùi hôi.\n\n'
        '* Mực ống có thể chế biến thành nhiều món như nướng, xào, hấp...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Mực nướng: Nướng mực với sa tế và chanh để tăng hương vị.\n\n'
        '* Mực xào: Xào mực với hành tây và ớt chuông để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Mực nang',
    value: 'muc-nang',
    icon: 'assets/icons/seafood/muc-nang.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của mực nang:\n\n'
        '1. Giàu protein: Mực nang cung cấp lượng protein dồi dào.\n\n'
        '2. Giàu vitamin và khoáng chất: Mực nang chứa nhiều vitamin B2, B12, selen và đồng.\n\n'
        '3. Ít chất béo: Mực nang phù hợp cho người đang ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mực nang tươi, không có mùi hôi.\n\n'
        '* Mực nang có thể chế biến thành nhiều món như nướng, xào, hấp...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Mực nang nướng: Nướng mực nang với bơ tỏi để tăng hương vị.\n\n'
        '* Mực nang xào: Xào mực nang với cải thìa và hành tây.\n\n',
  ),
  Category(
    label: 'Hải sâm',
    value: 'hai-sam',
    icon: 'assets/icons/seafood/hai-sam.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của hải sâm:\n\n'
        '1. Giàu protein: Hải sâm cung cấp protein chất lượng cao.\n\n'
        '2. Giàu khoáng chất: Hải sâm chứa nhiều khoáng chất như kẽm, sắt và canxi.\n\n'
        '3. Chống viêm: Hải sâm có đặc tính chống viêm, tốt cho sức khỏe.\n\n'
        'Lưu ý:\n\n'
        '* Chọn hải sâm tươi, không có mùi lạ.\n\n'
        '* Hải sâm có thể chế biến thành nhiều món ngon như hầm, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Hải sâm hầm: Hầm hải sâm với thịt bò và nấm đông cô.\n\n'
        '* Canh hải sâm: Nấu canh hải sâm với bí đỏ và cà rốt.\n\n',
  ),
  Category(
    label: 'Cá tuyết',
    value: 'ca-tuyet',
    icon: 'assets/icons/seafood/ca-tuyet.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá tuyết:\n\n'
        '1. Giàu protein: Cá tuyết cung cấp lượng protein dồi dào, tốt cho cơ bắp.\n\n'
        '2. Giàu omega-3: Cá tuyết là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '3. Chứa nhiều vitamin và khoáng chất: Cá tuyết giàu vitamin B12, selen và magiê.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá tuyết tươi, không có mùi lạ.\n\n'
        '* Cá tuyết có thể chế biến thành nhiều món như nướng, hấp, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá tuyết nướng: Nướng cá tuyết với dầu ô liu và thảo mộc để tăng hương vị.\n\n'
        '* Canh cá tuyết: Nấu canh cá tuyết với nấm và rau cải.\n\n',
  ),
  Category(
    label: 'Cá thu',
    value: 'ca-thu',
    icon: 'assets/icons/seafood/ca-thu.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá thu:\n\n'
        '1. Giàu omega-3: Cá thu cung cấp lượng lớn omega-3, tốt cho tim mạch.\n\n'
        '2. Giàu protein: Cá thu cung cấp protein chất lượng cao.\n\n'
        '3. Chứa nhiều vitamin và khoáng chất: Cá thu giàu vitamin D, B12 và selen.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá thu tươi, không có mùi lạ.\n\n'
        '* Cá thu có thể chế biến thành nhiều món như nướng, chiên, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá thu nướng: Nướng cá thu với chanh và gia vị để tăng hương vị.\n\n'
        '* Cá thu chiên: Chiên cá thu với hành và tỏi để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Cá hồi',
    value: 'ca-hoi',
    icon: 'assets/icons/seafood/ca-hoi.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá hồi:\n\n'
        '1. Giàu omega-3: Cá hồi là nguồn cung cấp omega-3 phong phú.\n\n'
        '2. Giàu protein: Cá hồi cung cấp lượng protein chất lượng cao.\n\n'
        '3. Chứa nhiều vitamin và khoáng chất: Cá hồi giàu vitamin D, B12 và selen.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá hồi tươi, không có mùi lạ.\n\n'
        '* Cá hồi có thể chế biến thành nhiều món như nướng, hấp, làm sushi...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá hồi nướng: Nướng cá hồi với chanh và thảo mộc để tăng hương vị.\n\n'
        '* Sushi cá hồi: Làm sushi cá hồi với cơm và rong biển.\n\n',
  ),
  Category(
    label: 'Cá khô',
    value: 'ca-kho',
    icon: 'assets/icons/seafood/ca-kho.png',
    type: 'seafood',
    defaultDuration: 180, // days (dried fish)
    note: 'Lợi ích sức khỏe của cá khô:\n\n'
        '1. Giàu protein: Cá khô cung cấp lượng protein cao, tốt cho cơ bắp.\n\n'
        '2. Chứa nhiều khoáng chất: Cá khô giàu sắt, canxi và kẽm.\n\n'
        '3. Dễ bảo quản: Cá khô có thể bảo quản lâu dài mà không cần tủ lạnh.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá khô sạch, không có mùi lạ.\n\n'
        '* Cá khô có thể chế biến thành nhiều món như chiên, kho, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá khô chiên: Chiên cá khô với tỏi và ớt để tăng hương vị.\n\n'
        '* Cá khô kho: Kho cá khô với thịt ba chỉ và tiêu.\n\n',
  ),
  Category(
    label: 'Cá mèo',
    value: 'ca-meo',
    icon: 'assets/icons/seafood/ca-meo.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá mèo:\n\n'
        '1. Giàu protein: Cá mèo cung cấp lượng protein dồi dào.\n\n'
        '2. Chứa nhiều omega-3: Cá mèo là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '3. Giàu vitamin và khoáng chất: Cá mèo chứa nhiều vitamin B12, selen và magiê.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá mèo tươi, không có mùi lạ.\n\n'
        '* Cá mèo có thể chế biến thành nhiều món như nướng, chiên, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá mèo nướng: Nướng cá mèo với thảo mộc và chanh để tăng hương vị.\n\n'
        '* Cá mèo chiên: Chiên cá mèo với tỏi và hành để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Cá mòi',
    value: 'ca-moi',
    icon: 'assets/icons/seafood/ca-moi.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá mòi:\n\n'
        '1. Giàu omega-3: Cá mòi là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '2. Giàu protein: Cá mòi cung cấp lượng protein chất lượng cao.\n\n'
        '3. Chứa nhiều vitamin và khoáng chất: Cá mòi giàu vitamin D, B12 và canxi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá mòi tươi, không có mùi lạ.\n\n'
        '* Cá mòi có thể chế biến thành nhiều món như nướng, chiên, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá mòi nướng: Nướng cá mòi với chanh và dầu ô liu để tăng hương vị.\n\n'
        '* Cá mòi chiên: Chiên cá mòi với tỏi và hành để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Cá ngừ',
    value: 'ca-ngu',
    icon: 'assets/icons/seafood/ca-ngu.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá ngừ:\n\n'
        '1. Giàu omega-3: Cá ngừ là nguồn cung cấp omega-3 phong phú.\n\n'
        '2. Giàu protein: Cá ngừ cung cấp lượng protein chất lượng cao.\n\n'
        '3. Chứa nhiều vitamin và khoáng chất: Cá ngừ giàu vitamin D, B12 và selen.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá ngừ tươi, không có mùi lạ.\n\n'
        '* Cá ngừ có thể chế biến thành nhiều món như nướng, chiên, làm sushi...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá ngừ nướng: Nướng cá ngừ với chanh và thảo mộc để tăng hương vị.\n\n'
        '* Sushi cá ngừ: Làm sushi cá ngừ với cơm và rong biển.\n\n',
  ),
  Category(
    label: 'Cá hố',
    value: 'ca-ho',
    icon: 'assets/icons/seafood/ca-ho.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá hố:\n\n'
        '1. Giàu protein: Cá hố cung cấp lượng protein dồi dào.\n\n'
        '2. Chứa nhiều omega-3: Cá hố là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '3. Giàu vitamin và khoáng chất: Cá hố chứa nhiều vitamin B12, selen và magiê.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá hố tươi, không có mùi lạ.\n\n'
        '* Cá hố có thể chế biến thành nhiều món như nướng, chiên, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá hố nướng: Nướng cá hố với thảo mộc và chanh để tăng hương vị.\n\n'
        '* Cá hố chiên: Chiên cá hố với tỏi và hành để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Cá cơm',
    value: 'ca-com',
    icon: 'assets/icons/seafood/ca-com.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá cơm:\n\n'
        '1. Giàu omega-3: Cá cơm là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '2. Giàu protein: Cá cơm cung cấp lượng protein chất lượng cao.\n\n'
        '3. Chứa nhiều vitamin và khoáng chất: Cá cơm giàu vitamin D, B12 và canxi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá cơm tươi, không có mùi lạ.\n\n'
        '* Cá cơm có thể chế biến thành nhiều món như chiên, kho, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá cơm chiên: Chiên cá cơm với tỏi và ớt để tăng hương vị.\n\n'
        '* Cá cơm kho: Kho cá cơm với tiêu và hành tím.\n\n',
  ),
  Category(
    label: 'Cá chình',
    value: 'ca-chinh',
    icon: 'assets/icons/seafood/ca-chinh.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá chình:\n\n'
        '1. Giàu protein: Cá chình cung cấp lượng protein dồi dào.\n\n'
        '2. Chứa nhiều omega-3: Cá chình là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '3. Giàu vitamin và khoáng chất: Cá chình chứa nhiều vitamin B12, selen và magiê.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá chình tươi, không có mùi lạ.\n\n'
        '* Cá chình có thể chế biến thành nhiều món như nướng, chiên, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá chình nướng: Nướng cá chình với thảo mộc và chanh để tăng hương vị.\n\n'
        '* Cá chình chiên: Chiên cá chình với tỏi và hành để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Cá',
    value: 'ca',
    icon: 'assets/icons/seafood/ca.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cá:\n\n'
        '1. Giàu protein: Cá cung cấp lượng protein dồi dào, tốt cho cơ bắp.\n\n'
        '2. Chứa nhiều omega-3: Cá là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '3. Giàu vitamin và khoáng chất: Cá chứa nhiều vitamin D, B12 và selen.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá tươi, không có mùi lạ.\n\n'
        '* Cá có thể chế biến thành nhiều món như nướng, chiên, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá nướng: Nướng cá với chanh và thảo mộc để tăng hương vị.\n\n'
        '* Cá chiên: Chiên cá với tỏi và hành để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Cua tuyết',
    value: 'cua-tuyet',
    icon: 'assets/icons/seafood/cua-tuyet.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cua tuyết:\n\n'
        '1. Giàu protein: Cua tuyết cung cấp lượng protein dồi dào.\n\n'
        '2. Giàu omega-3: Cua tuyết là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        '3. Chứa nhiều vitamin và khoáng chất: Cua tuyết giàu vitamin B12, selen và magiê.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cua tuyết tươi, không có mùi lạ.\n\n'
        '* Cua tuyết có thể chế biến thành nhiều món như nướng, hấp, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cua tuyết nướng: Nướng cua tuyết với thảo mộc và chanh để tăng hương vị.\n\n'
        '* Cua tuyết hấp: Hấp cua tuyết với sả và gừng để giữ nguyên hương vị.\n\n',
  ),
  Category(
    label: 'Sứa',
    value: 'sua',
    icon: 'assets/icons/seafood/sua.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của sứa:\n\n'
        '1. Giàu protein: Sứa cung cấp lượng protein dồi dào.\n\n'
        '2. Giàu khoáng chất: Sứa chứa nhiều khoáng chất như sắt và canxi.\n\n'
        '3. Ít calo: Sứa có lượng calo thấp, phù hợp cho người ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn sứa tươi, không có mùi lạ.\n\n'
        '* Sứa có thể chế biến thành nhiều món như nộm, xào, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Nộm sứa: Trộn sứa với rau sống và nước chấm.\n\n'
        '* Sứa xào: Xào sứa với hành tây và ớt chuông.\n\n',
  ),
  Category(
    label: 'Trai',
    value: 'trai',
    icon: 'assets/icons/seafood/trai.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của trai:\n\n'
        '1. Giàu protein: Trai cung cấp lượng protein dồi dào.\n\n'
        '2. Giàu vitamin và khoáng chất: Trai chứa nhiều vitamin B12, selen và sắt.\n\n'
        '3. Ít calo: Trai có lượng calo thấp, phù hợp cho người ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn trai tươi, không có mùi lạ.\n\n'
        '* Trai có thể chế biến thành nhiều món như hấp, xào, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Trai hấp: Hấp trai với sả và gừng để giữ nguyên hương vị.\n\n'
        '* Trai xào: Xào trai với hành tây và ớt chuông để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Tép',
    value: 'tep',
    icon: 'assets/icons/seafood/tep.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của tép:\n\n'
        '1. Giàu protein: Tép cung cấp lượng protein chất lượng cao.\n\n'
        '2. Giàu khoáng chất: Tép chứa nhiều khoáng chất như canxi, sắt và kẽm.\n\n'
        '3. Ít calo: Tép có lượng calo thấp, phù hợp cho người ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn tép tươi, không có mùi lạ.\n\n'
        '* Tép có thể chế biến thành nhiều món như chiên, xào, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Tép chiên: Chiên tép với tỏi và ớt để tăng hương vị.\n\n'
        '* Canh tép: Nấu canh tép với mướp và rau đay.\n\n',
  ),
  Category(
    label: 'Bạch tuộc',
    value: 'bach-tuoc',
    icon: 'assets/icons/seafood/bach-tuoc.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của bạch tuộc:\n\n'
        '1. Giàu protein: Bạch tuộc cung cấp lượng protein dồi dào.\n\n'
        '2. Giàu khoáng chất: Bạch tuộc chứa nhiều kẽm, sắt và đồng.\n\n'
        '3. Ít calo: Bạch tuộc có lượng calo thấp, phù hợp cho người ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn bạch tuộc tươi, không có mùi lạ.\n\n'
        '* Bạch tuộc có thể chế biến thành nhiều món như nướng, xào, hấp...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Bạch tuộc nướng: Nướng bạch tuộc với bơ tỏi để tăng hương vị.\n\n'
        '* Bạch tuộc xào: Xào bạch tuộc với hành tây và ớt chuông.\n\n',
  ),
  Category(
    label: 'Cua',
    value: 'cua',
    icon: 'assets/icons/seafood/cua.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của cua:\n\n'
        '1. Giàu protein: Cua cung cấp lượng protein chất lượng cao.\n\n'
        '2. Giàu khoáng chất: Cua chứa nhiều kẽm, sắt và canxi.\n\n'
        '3. Giàu omega-3: Cua là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cua tươi, không có mùi lạ.\n\n'
        '* Cua có thể chế biến thành nhiều món như hấp, xào, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cua hấp: Hấp cua với sả và gừng để giữ nguyên hương vị.\n\n'
        '* Cua xào: Xào cua với hành tây và ớt chuông để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Hến',
    value: 'hen',
    icon: 'assets/icons/seafood/hen.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của hến:\n\n'
        '1. Giàu protein: Hến cung cấp lượng protein chất lượng cao.\n\n'
        '2. Giàu khoáng chất: Hến chứa nhiều kẽm, sắt và canxi.\n\n'
        '3. Giàu vitamin B12: Hến là nguồn cung cấp vitamin B12 tốt cho hệ thần kinh.\n\n'
        'Lưu ý:\n\n'
        '* Chọn hến tươi, không có mùi lạ.\n\n'
        '* Hến có thể chế biến thành nhiều món như hấp, xào, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Hến hấp: Hấp hến với sả và gừng để giữ nguyên hương vị.\n\n'
        '* Canh hến: Nấu canh hến với mướp và rau đay.\n\n',
  ),
  Category(
    label: 'Hàu',
    value: 'hau',
    icon: 'assets/icons/seafood/hau.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của hàu:\n\n'
        '1. Giàu protein: Hàu cung cấp lượng protein dồi dào.\n\n'
        '2. Giàu khoáng chất: Hàu chứa nhiều kẽm, sắt và canxi.\n\n'
        '3. Chứa nhiều omega-3: Hàu là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        'Lưu ý:\n\n'
        '* Chọn hàu tươi, không có mùi lạ.\n\n'
        '* Hàu có thể chế biến thành nhiều món như nướng, hấp, ăn sống...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Hàu nướng: Nướng hàu với mỡ hành để tăng hương vị.\n\n'
        '* Hàu sống: Ăn hàu sống với chanh và nước mắm để thưởng thức hương vị tự nhiên.\n\n',
  ),
  Category(
    label: 'Bào ngư',
    value: 'bao-ngu',
    icon: 'assets/icons/seafood/bao-ngu.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của bào ngư:\n\n'
        '1. Giàu protein: Bào ngư cung cấp lượng protein chất lượng cao.\n\n'
        '2. Giàu khoáng chất: Bào ngư chứa nhiều kẽm, sắt và canxi.\n\n'
        '3. Chứa nhiều omega-3: Bào ngư là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        'Lưu ý:\n\n'
        '* Chọn bào ngư tươi, không có mùi lạ.\n\n'
        '* Bào ngư có thể chế biến thành nhiều món như nướng, hấp, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Bào ngư nướng: Nướng bào ngư với bơ tỏi để tăng hương vị.\n\n'
        '* Canh bào ngư: Nấu canh bào ngư với rau cải và nấm.\n\n',
  ),
  Category(
    label: 'Sò',
    value: 'so',
    icon: 'assets/icons/seafood/so.png',
    type: 'seafood',
    defaultDuration: 2, // days
    note: 'Lợi ích sức khỏe của sò:\n\n'
        '1. Giàu protein: Sò cung cấp lượng protein dồi dào.\n\n'
        '2. Giàu vitamin và khoáng chất: Sò chứa nhiều vitamin B12, selen và sắt.\n\n'
        '3. Ít calo: Sò có lượng calo thấp, phù hợp cho người ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn sò tươi, không có mùi lạ.\n\n'
        '* Sò có thể chế biến thành nhiều món như hấp, xào, nấu canh...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Sò hấp: Hấp sò với sả và gừng để giữ nguyên hương vị.\n\n'
        '* Sò xào: Xào sò với hành tây và ớt chuông để món ăn thêm hấp dẫn.\n\n',
  ),
];

List<Category> dishes = [
  Category(
    label: 'Món hầm',
    value: 'mon-ham',
    icon: 'assets/icons/dishes/mon-ham.png',
    type: 'dishes',
    defaultDuration: 2,
    note: 'Lợi ích sức khỏe của món hầm:\n\n'
        '1. Giàu dinh dưỡng: Món hầm thường chứa nhiều rau củ và thịt, cung cấp đầy đủ các chất dinh dưỡng.\n\n'
        '2. Tốt cho tiêu hóa: Món hầm thường được nấu chín kỹ, dễ tiêu hóa.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để đảm bảo món ăn ngon và an toàn.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Hầm xương: Hầm xương với các loại rau củ như cà rốt, khoai tây để món ăn thêm dinh dưỡng.\n\n'
        '* Hầm thịt: Hầm thịt bò hoặc thịt heo với nước dừa và gia vị.\n\n',
  ),
  Category(
    label: 'Garu',
    value: 'garu',
    icon: 'assets/icons/dishes/garu.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của Garu:\n\n'
        '1. Giàu protein: Garu là nguồn cung cấp protein chất lượng cao.\n\n'
        '2. Chứa nhiều vitamin và khoáng chất: Garu giàu vitamin B12, sắt và kẽm.\n\n'
        'Lưu ý:\n\n'
        '* Chọn garu tươi, không có mùi lạ.\n\n'
        '* Garu có thể chế biến thành nhiều món như nướng, hấp, chiên...\n\n'
        'Gợi ý chế biến:\n\n'
        '* Garu nướng: Nướng garu với bơ tỏi để tăng hương vị.\n\n'
        '* Garu hấp: Hấp garu với sả và gừng để giữ nguyên hương vị tự nhiên.\n\n',
  ),
  Category(
    label: 'Mì ống',
    value: 'mi-ong',
    icon: 'assets/icons/dishes/mi-ong.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của mì ống:\n\n'
        '1. Giàu carbohydrate: Mì ống cung cấp năng lượng cho cơ thể.\n\n'
        '2. Dễ chế biến: Mì ống có thể chế biến nhanh chóng và dễ dàng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mì ống chất lượng tốt, không chứa chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Mì ống sốt cà chua: Nấu mì ống với sốt cà chua và thịt bằm.\n\n'
        '* Mì ống sốt kem: Nấu mì ống với sốt kem và nấm.\n\n',
  ),
  Category(
    label: 'Onigiri',
    value: 'com-rong-bien',
    icon: 'assets/icons/dishes/com-rong-bien.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của Onigiri:\n\n'
        '1. Giàu carbohydrate: Onigiri cung cấp năng lượng cho cơ thể.\n\n'
        '2. Dễ mang theo: Onigiri dễ dàng mang theo làm bữa ăn nhẹ hoặc bữa trưa.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm onigiri.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Onigiri nhân cá hồi: Làm onigiri với nhân cá hồi và rong biển.\n\n'
        '* Onigiri nhân umeboshi: Làm onigiri với nhân mơ muối và rong biển.\n\n',
  ),
  Category(
    label: 'Chả cá Hàn Quốc',
    value: 'cha-ca-han-quoc',
    icon: 'assets/icons/dishes/cha-ca-han-quoc.png',
    type: 'dishes',
    defaultDuration: 2,
    note: 'Lợi ích sức khỏe của chả cá Hàn Quốc:\n\n'
        '1. Giàu protein: Chả cá Hàn Quốc cung cấp protein chất lượng cao.\n\n'
        '2. Dễ chế biến: Chả cá Hàn Quốc có thể chế biến nhanh chóng và dễ dàng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn chả cá tươi, không có mùi lạ.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Chả cá xiên que: Xiên chả cá và nướng hoặc chiên giòn.\n\n'
        '* Chả cá om: Om chả cá với rau củ và nước dùng.\n\n',
  ),
  Category(
    label: 'Nước dùng',
    value: 'nuoc-dung',
    icon: 'assets/icons/dishes/nuoc-dung.png',
    type: 'dishes',
    defaultDuration: 2,
    note: 'Lợi ích sức khỏe của nước dùng:\n\n'
        '1. Giàu dinh dưỡng: Nước dùng cung cấp nhiều khoáng chất và vitamin từ xương và rau củ.\n\n'
        '2. Tốt cho tiêu hóa: Nước dùng dễ tiêu hóa và giúp bù nước cho cơ thể.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để nấu nước dùng.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Nước dùng xương: Nấu nước dùng từ xương heo hoặc gà với rau củ.\n\n'
        '* Nước dùng hải sản: Nấu nước dùng từ tôm, cua và các loại hải sản.\n\n',
  ),
  Category(
    label: 'Nori',
    value: 'nori',
    icon: 'assets/icons/dishes/nori.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của nori:\n\n'
        '1. Giàu vitamin và khoáng chất: Nori chứa nhiều vitamin A, C, và khoáng chất như sắt, canxi.\n\n'
        '2. Giàu chất xơ: Nori cung cấp lượng chất xơ dồi dào, tốt cho tiêu hóa.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nori sạch, không có mùi lạ.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Nori cuốn cơm: Dùng nori để cuốn sushi hoặc cơm.\n\n'
        '* Nori nướng: Nướng nori giòn và ăn kèm với cơm trắng.\n\n',
  ),
  Category(
    label: 'Ngũ cốc',
    value: 'ngu-coc',
    icon: 'assets/icons/dishes/ngu-coc.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của ngũ cốc:\n\n'
        '1. Giàu chất xơ: Ngũ cốc cung cấp lượng chất xơ dồi dào, tốt cho tiêu hóa.\n\n'
        '2. Giàu vitamin và khoáng chất: Ngũ cốc chứa nhiều vitamin B, sắt và magiê.\n\n'
        'Lưu ý:\n\n'
        '* Chọn ngũ cốc không chứa nhiều đường và chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Ngũ cốc ăn sáng: Trộn ngũ cốc với sữa hoặc sữa chua.\n\n'
        '* Ngũ cốc nướng: Nướng ngũ cốc với mật ong và hạt để làm granola.\n\n',
  ),
  Category(
    label: 'Pad Thái',
    value: 'pad-thai',
    icon: 'assets/icons/dishes/pad-thai.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của Pad Thái:\n\n'
        '1. Giàu dinh dưỡng: Pad Thái chứa nhiều protein từ tôm hoặc gà, cùng với rau củ.\n\n'
        '2. Cung cấp năng lượng: Pad Thái cung cấp năng lượng từ mì gạo và đậu phụng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để nấu Pad Thái.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Pad Thái tôm: Nấu Pad Thái với tôm, đậu phụng và rau thơm.\n\n'
        '* Pad Thái gà: Nấu Pad Thái với gà, giá đỗ và hành lá.\n\n',
  ),
  Category(
    label: 'Cháo hải sản',
    value: 'chao-hai-san',
    icon: 'assets/icons/dishes/chao-hai-san.png',
    type: 'dishes',
    defaultDuration: 2,
    note: 'Lợi ích sức khỏe của cháo hải sản:\n\n'
        '1. Giàu dinh dưỡng: Cháo hải sản cung cấp nhiều protein và khoáng chất từ hải sản.\n\n'
        '2. Dễ tiêu hóa: Cháo hải sản dễ tiêu hóa và phù hợp cho mọi lứa tuổi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn hải sản tươi, sạch để nấu cháo.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cháo tôm: Nấu cháo với tôm và rau củ.\n\n'
        '* Cháo cua: Nấu cháo với cua và ngô ngọt.\n\n',
  ),
  Category(
    label: 'Phở',
    value: 'pho',
    icon: 'assets/icons/dishes/pho.png',
    type: 'dishes',
    defaultDuration: 2,
    note: 'Lợi ích sức khỏe của phở:\n\n'
        '1. Giàu dinh dưỡng: Phở cung cấp protein từ thịt bò hoặc gà, cùng với rau thơm và gia vị.\n\n'
        '2. Tốt cho tiêu hóa: Nước dùng phở giàu khoáng chất và dễ tiêu hóa.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để nấu phở.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Phở bò: Nấu phở với thịt bò tái, hành tây và rau thơm.\n\n'
        '* Phở gà: Nấu phở với thịt gà, giá đỗ và rau thơm.\n\n',
  ),
  Category(
    label: 'Pizza',
    value: 'pizza',
    icon: 'assets/icons/dishes/pizza.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của pizza:\n\n'
        '1. Giàu dinh dưỡng: Pizza cung cấp protein từ thịt, phô mai và rau củ.\n\n'
        '2. Cung cấp năng lượng: Pizza cung cấp năng lượng từ bột mì và dầu ô liu.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm pizza.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Pizza hải sản: Làm pizza với tôm, mực và phô mai.\n\n'
        '* Pizza thịt: Làm pizza với thịt bò, ớt chuông và phô mai.\n\n',
  ),
  Category(
    label: 'Pulkogi',
    value: 'pulkogi',
    icon: 'assets/icons/dishes/pulkogi.png',
    type: 'dishes',
    defaultDuration: 2,
    note: 'Lợi ích sức khỏe của Pulkogi:\n\n'
        '1. Giàu protein: Pulkogi cung cấp lượng protein dồi dào từ thịt bò.\n\n'
        '2. Giàu vitamin và khoáng chất: Pulkogi chứa nhiều vitamin B12, sắt và kẽm.\n\n'
        'Lưu ý:\n\n'
        '* Chọn thịt bò tươi, không có mùi lạ.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Pulkogi nướng: Nướng thịt bò Pulkogi với tỏi và gừng để tăng hương vị.\n\n'
        '* Pulkogi xào: Xào thịt bò Pulkogi với hành tây và ớt chuông.\n\n',
  ),
  Category(
    label: 'Thịt nướng',
    value: 'thit-nuong',
    icon: 'assets/icons/dishes/thit-nuong.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của thịt nướng:\n\n'
        '1. Giàu protein: Thịt nướng cung cấp lượng protein chất lượng cao.\n\n'
        '2. Giàu vitamin và khoáng chất: Thịt nướng chứa nhiều vitamin B12, sắt và kẽm.\n\n'
        'Lưu ý:\n\n'
        '* Chọn thịt tươi, không có mùi lạ.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Thịt nướng BBQ: Nướng thịt với gia vị BBQ và rau thơm.\n\n'
        '* Thịt nướng xiên: Xiên thịt và nướng với ớt chuông và hành tây.\n\n',
  ),
  Category(
    label: 'Sashimi',
    value: 'sashimi',
    icon: 'assets/icons/dishes/sashimi.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của sashimi:\n\n'
        '1. Giàu protein: Sashimi cung cấp lượng protein chất lượng cao.\n\n'
        '2. Giàu omega-3: Sashimi là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        'Lưu ý:\n\n'
        '* Chọn hải sản tươi, sạch để làm sashimi.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Sashimi cá hồi: Làm sashimi với cá hồi tươi và nước chấm xì dầu.\n\n'
        '* Sashimi cá ngừ: Làm sashimi với cá ngừ và nước chấm wasabi.\n\n',
  ),
  Category(
    label: 'Rendang',
    value: 'rendang',
    icon: 'assets/icons/dishes/rendang.png',
    type: 'dishes',
    defaultDuration: 2,
    note: 'Lợi ích sức khỏe của Rendang:\n\n'
        '1. Giàu protein: Rendang cung cấp lượng protein dồi dào từ thịt bò.\n\n'
        '2. Giàu gia vị: Rendang chứa nhiều gia vị tốt cho sức khỏe như nghệ, gừng, tỏi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn thịt bò tươi, không có mùi lạ.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Rendang bò: Nấu Rendang với thịt bò và nước cốt dừa.\n\n'
        '* Rendang gà: Nấu Rendang với thịt gà và gia vị truyền thống.\n\n',
  ),
  Category(
    label: 'Bánh ngọt',
    value: 'banh-ngot',
    icon: 'assets/icons/dishes/banh-ngot.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của bánh ngọt:\n\n'
        '1. Cung cấp năng lượng: Bánh ngọt cung cấp năng lượng nhanh chóng từ đường và bột mì.\n\n'
        '2. Tăng cường tâm trạng: Bánh ngọt có thể giúp cải thiện tâm trạng và giảm stress.\n\n'
        'Lưu ý:\n\n'
        '* Chọn bánh ngọt chất lượng tốt, không chứa quá nhiều đường và chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Bánh bông lan: Làm bánh bông lan mềm mịn với trứng và bột mì.\n\n'
        '* Bánh quy: Làm bánh quy giòn tan với bơ và sô cô la.\n\n',
  ),
  Category(
    label: 'Salad',
    value: 'salad',
    icon: 'assets/icons/dishes/salad.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của salad:\n\n'
        '1. Giàu vitamin và khoáng chất: Salad chứa nhiều rau xanh, cung cấp vitamin và khoáng chất.\n\n'
        '2. Giàu chất xơ: Salad cung cấp lượng chất xơ dồi dào, tốt cho tiêu hóa.\n\n'
        'Lưu ý:\n\n'
        '* Chọn rau tươi, sạch để làm salad.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Salad rau xanh: Trộn các loại rau xanh với dầu ô liu và giấm balsamic.\n\n'
        '* Salad trái cây: Trộn các loại trái cây với sữa chua và mật ong.\n\n',
  ),
  Category(
    label: 'Lạp xưởng',
    value: 'lap-xuong',
    icon: 'assets/icons/dishes/lap-xuong.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của lạp xưởng:\n\n'
        '1. Giàu protein: Lạp xưởng cung cấp lượng protein dồi dào từ thịt heo.\n\n'
        '2. Chứa nhiều gia vị: Lạp xưởng chứa nhiều gia vị tốt cho sức khỏe như tỏi, tiêu.\n\n'
        'Lưu ý:\n\n'
        '* Chọn lạp xưởng chất lượng tốt, không chứa chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Lạp xưởng chiên: Chiên lạp xưởng với hành tây và ớt chuông.\n\n'
        '* Lạp xưởng hấp: Hấp lạp xưởng với rau củ để giữ nguyên hương vị.\n\n',
  ),
  Category(
    label: 'Mì gói',
    value: 'mi-goi',
    icon: 'assets/icons/dishes/mi-goi.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của mì gói:\n\n'
        '1. Tiện lợi: Mì gói dễ dàng chế biến và tiết kiệm thời gian.\n\n'
        '2. Cung cấp năng lượng: Mì gói cung cấp năng lượng nhanh chóng từ carbohydrate.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mì gói không chứa quá nhiều chất bảo quản và muối.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Mì gói xào: Xào mì gói với rau và thịt.\n\n'
        '* Mì gói nước: Nấu mì gói với nước dùng và thêm trứng, rau.\n\n',
  ),
  Category(
    label: 'Mì nướng',
    value: 'mi-nuong',
    icon: 'assets/icons/dishes/mi-nuong.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của mì nướng:\n\n'
        '1. Tiện lợi: Mì nướng dễ dàng chế biến và tiết kiệm thời gian.\n\n'
        '2. Cung cấp năng lượng: Mì nướng cung cấp năng lượng nhanh chóng từ carbohydrate.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mì nướng không chứa quá nhiều chất bảo quản và muối.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Mì nướng xào: Xào mì nướng với rau và thịt.\n\n'
        '* Mì nướng nước: Nấu mì nướng với nước dùng và thêm trứng, rau.\n\n',
  ),
  Category(
    label: 'Mì trộn',
    value: 'mi-tron',
    icon: 'assets/icons/dishes/mi-tron.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của mì trộn:\n\n'
        '1. Tiện lợi: Mì trộn dễ dàng chế biến và tiết kiệm thời gian.\n\n'
        '2. Cung cấp năng lượng: Mì trộn cung cấp năng lượng nhanh chóng từ carbohydrate.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mì trộn không chứa quá nhiều chất bảo quản và muối.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Mì trộn xào: Xào mì trộn với rau và thịt.\n\n'
        '* Mì trộn nước: Nấu mì trộn với nước dùng và thêm trứng, rau.\n\n',
  ),
  Category(
    label: 'Mì udon',
    value: 'mi-udon',
    icon: 'assets/icons/dishes/mi-udon.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của mì udon:\n\n'
        '1. Giàu dinh dưỡng: Mì udon cung cấp năng lượng từ carbohydrate và protein.\n\n'
        '2. Dễ tiêu hóa: Mì udon dễ tiêu hóa và phù hợp cho mọi lứa tuổi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn mì udon tươi, không chứa chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Mì udon xào: Xào mì udon với rau và thịt.\n\n'
        '* Mì udon nước: Nấu mì udon với nước dùng và thêm trứng, rau.\n\n',
  ),
  Category(
    label: 'Kim chi',
    value: 'kim-chi',
    icon: 'assets/icons/dishes/kim-chi.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của kim chi:\n\n'
        '1. Giàu vitamin và khoáng chất: Kim chi chứa nhiều vitamin A, C, và khoáng chất.\n\n'
        '2. Giàu chất xơ: Kim chi cung cấp lượng chất xơ dồi dào, tốt cho tiêu hóa.\n\n'
        'Lưu ý:\n\n'
        '* Chọn kim chi tươi, không chứa chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Kim chi ăn kèm: Dùng kim chi ăn kèm với cơm và các món chính.\n\n'
        '* Kim chi nấu canh: Nấu canh kim chi với đậu hũ và thịt bò.\n\n',
  ),
  Category(
    label: 'Kebab',
    value: 'kebab',
    icon: 'assets/icons/dishes/kebab.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của kebab:\n\n'
        '1. Giàu protein: Kebab cung cấp lượng protein dồi dào từ thịt.\n\n'
        '2. Giàu vitamin và khoáng chất: Kebab chứa nhiều rau xanh và gia vị tốt cho sức khỏe.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm kebab.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Kebab nướng: Nướng kebab với gia vị và rau thơm.\n\n'
        '* Kebab chiên: Chiên kebab với dầu ô liu để món ăn thêm hấp dẫn.\n\n',
  ),
  Category(
    label: 'Hàng đông lạnh',
    value: 'hang-dong-lanh',
    icon: 'assets/icons/dishes/hang-dong-lanh.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của hàng đông lạnh:\n\n'
        '1. Tiện lợi: Hàng đông lạnh dễ bảo quản và sử dụng.\n\n'
        '2. Cung cấp dinh dưỡng: Hàng đông lạnh vẫn giữ được nhiều chất dinh dưỡng từ nguyên liệu tươi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn hàng đông lạnh chất lượng tốt, không chứa nhiều chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Hàng đông lạnh chiên: Chiên hàng đông lạnh với dầu ô liu.\n\n'
        '* Hàng đông lạnh nấu canh: Nấu canh với hàng đông lạnh và rau củ.\n\n',
  ),
  Category(
    label: 'Gỏi cuốn',
    value: 'goi-cuon',
    icon: 'assets/icons/dishes/goi-cuon.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của gỏi cuốn:\n\n'
        '1. Giàu vitamin và khoáng chất: Gỏi cuốn chứa nhiều rau xanh và hải sản.\n\n'
        '2. Ít calo: Gỏi cuốn có lượng calo thấp, phù hợp cho người ăn kiêng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm gỏi cuốn.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Gỏi cuốn tôm: Làm gỏi cuốn với tôm, rau sống và bún.\n\n'
        '* Gỏi cuốn thịt: Làm gỏi cuốn với thịt heo, rau sống và bún.\n\n',
  ),
  Category(
    label: 'Gimbap',
    value: 'gimbap',
    icon: 'assets/icons/dishes/gimbap.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của gimbap:\n\n'
        '1. Giàu dinh dưỡng: Gimbap cung cấp protein từ thịt, trứng và rau củ.\n\n'
        '2. Tiện lợi: Gimbap dễ mang theo làm bữa ăn nhẹ hoặc bữa trưa.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm gimbap.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Gimbap thịt bò: Làm gimbap với thịt bò, trứng và rau củ.\n\n'
        '* Gimbap cá ngừ: Làm gimbap với cá ngừ, trứng và rau củ.\n\n',
  ),
  Category(
    label: 'Gnocchi',
    value: 'gnocchi',
    icon: 'assets/icons/dishes/gnocchi.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của gnocchi:\n\n'
        '1. Giàu carbohydrate: Gnocchi cung cấp năng lượng cho cơ thể.\n\n'
        '2. Dễ chế biến: Gnocchi có thể chế biến nhanh chóng và dễ dàng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn gnocchi chất lượng tốt, không chứa chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Gnocchi sốt cà chua: Nấu gnocchi với sốt cà chua và phô mai.\n\n'
        '* Gnocchi sốt kem: Nấu gnocchi với sốt kem và nấm.\n\n',
  ),
  Category(
    label: 'Gà rán',
    value: 'ga-ran',
    icon: 'assets/icons/dishes/ga-ran.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của gà rán:\n\n'
        '1. Giàu protein: Gà rán cung cấp lượng protein chất lượng cao.\n\n'
        '2. Giàu vitamin và khoáng chất: Gà rán chứa nhiều vitamin B6, niacin và selen.\n\n'
        'Lưu ý:\n\n'
        '* Chọn gà tươi, không có mùi lạ.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Gà rán giòn: Rán gà với lớp vỏ giòn tan và gia vị hấp dẫn.\n\n'
        '* Gà rán mật ong: Rán gà và tẩm mật ong để món ăn thêm ngọt ngào.\n\n',
  ),
  Category(
    label: 'Dưa chuột muối',
    value: 'dua-chuot-muoi',
    icon: 'assets/icons/dishes/dua-chuot-muoi.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của dưa chuột muối:\n\n'
        '1. Giàu vitamin và khoáng chất: Dưa chuột muối chứa nhiều vitamin K, kali và magiê.\n\n'
        '2. Giàu chất xơ: Dưa chuột muối cung cấp lượng chất xơ dồi dào, tốt cho tiêu hóa.\n\n'
        'Lưu ý:\n\n'
        '* Chọn dưa chuột tươi, không có mùi lạ để muối.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Dưa chuột muối chua: Muối dưa chuột với giấm và muối để tạo vị chua.\n\n'
        '* Dưa chuột muối ngọt: Muối dưa chuột với đường và muối để tạo vị ngọt.\n\n',
  ),
  Category(
    label: 'Cơm trắng',
    value: 'com-trang',
    icon: 'assets/icons/dishes/com-trang.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của cơm trắng:\n\n'
        '1. Cung cấp năng lượng: Cơm trắng là nguồn cung cấp năng lượng chính từ carbohydrate.\n\n'
        '2. Dễ tiêu hóa: Cơm trắng dễ tiêu hóa và phù hợp cho mọi lứa tuổi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn gạo chất lượng tốt để nấu cơm trắng.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cơm trắng: Nấu cơm trắng với nước và ăn kèm các món chính.\n\n'
        '* Cơm trắng chiên: Chiên cơm trắng với trứng và rau củ để tạo món cơm chiên.\n\n',
  ),
  Category(
    label: 'Cơm rang',
    value: 'com-rang',
    icon: 'assets/icons/dishes/com-rang.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của cơm rang:\n\n'
        '1. Giàu dinh dưỡng: Cơm rang chứa nhiều rau củ và protein từ thịt hoặc trứng.\n\n'
        '2. Cung cấp năng lượng: Cơm rang cung cấp năng lượng từ carbohydrate và protein.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để nấu cơm rang.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cơm rang trứng: Rang cơm với trứng, hành và rau củ.\n\n'
        '* Cơm rang thịt: Rang cơm với thịt bò, gà hoặc heo và rau củ.\n\n',
  ),
  Category(
    label: 'Cá hộp',
    value: 'ca-hop',
    icon: 'assets/icons/dishes/ca-hop.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của cá hộp:\n\n'
        '1. Giàu protein: Cá hộp cung cấp lượng protein chất lượng cao.\n\n'
        '2. Giàu omega-3: Cá hộp là nguồn cung cấp omega-3 tốt cho tim mạch.\n\n'
        'Lưu ý:\n\n'
        '* Chọn cá hộp không chứa nhiều chất bảo quản và muối.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cá hộp ăn liền: Ăn cá hộp trực tiếp với bánh mì.\n\n'
        '* Cá hộp xào: Xào cá hộp với rau củ và hành tây.\n\n',
  ),
  Category(
    label: 'Cà ri',
    value: 'ca-ri',
    icon: 'assets/icons/dishes/ca-ri.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của cà ri:\n\n'
        '1. Giàu protein: Cà ri cung cấp lượng protein dồi dào từ thịt hoặc đậu.\n\n'
        '2. Giàu gia vị: Cà ri chứa nhiều gia vị tốt cho sức khỏe như nghệ, gừng, tỏi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để nấu cà ri.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cà ri gà: Nấu cà ri với thịt gà, khoai tây và cà rốt.\n\n'
        '* Cà ri chay: Nấu cà ri với đậu hũ, rau củ và gia vị.\n\n',
  ),
  Category(
    label: 'Bánh mì kẹp xúc xích',
    value: 'banh-mi-kep-xuc-xich',
    icon: 'assets/icons/dishes/banh-mi-kep-xuc-xich.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của bánh mì kẹp xúc xích:\n\n'
        '1. Giàu protein: Bánh mì kẹp xúc xích cung cấp lượng protein từ xúc xích và bánh mì.\n\n'
        '2. Tiện lợi: Bánh mì kẹp xúc xích dễ mang theo và chế biến nhanh chóng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm bánh mì kẹp xúc xích.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Bánh mì kẹp xúc xích: Kẹp xúc xích với rau sống và nước sốt.\n\n'
        '* Bánh mì kẹp xúc xích phô mai: Kẹp xúc xích với phô mai và rau sống.\n\n',
  ),
  Category(
    label: 'Bánh mì sandwich',
    value: 'banh-mi-sandwich',
    icon: 'assets/icons/dishes/banh-mi-sandwich.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của bánh mì sandwich:\n\n'
        '1. Giàu dinh dưỡng: Bánh mì sandwich cung cấp protein từ thịt, phô mai và rau củ.\n\n'
        '2. Tiện lợi: Bánh mì sandwich dễ mang theo và chế biến nhanh chóng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm bánh mì sandwich.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Sandwich thịt nguội: Kẹp thịt nguội, phô mai và rau sống vào bánh mì.\n\n'
        '* Sandwich cá ngừ: Kẹp cá ngừ, rau sống và nước sốt vào bánh mì.\n\n',
  ),
  Category(
    label: 'Bánh gối',
    value: 'banh-goi',
    icon: 'assets/icons/dishes/banh-goi.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của bánh gối:\n\n'
        '1. Giàu dinh dưỡng: Bánh gối chứa nhiều thịt và rau củ, cung cấp protein và vitamin.\n\n'
        '2. Tiện lợi: Bánh gối dễ mang theo và chế biến nhanh chóng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm bánh gối.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Bánh gối chiên: Chiên bánh gối với dầu cho đến khi giòn.\n\n'
        '* Bánh gối hấp: Hấp bánh gối để giữ nguyên hương vị tự nhiên.\n\n',
  ),
  Category(
    label: 'Hamburger',
    value: 'hamburger',
    icon: 'assets/icons/dishes/hamburger.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của hamburger:\n\n'
        '1. Giàu protein: Hamburger cung cấp lượng protein chất lượng cao từ thịt bò.\n\n'
        '2. Giàu vitamin và khoáng chất: Hamburger chứa nhiều rau xanh và gia vị tốt cho sức khỏe.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm hamburger.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Hamburger phô mai: Kẹp thịt bò nướng, phô mai và rau sống vào bánh mì.\n\n'
        '* Hamburger gà: Kẹp thịt gà nướng, rau sống và sốt mayonnaise vào bánh mì.\n\n',
  ),
  Category(
    label: 'Canh',
    value: 'canh',
    icon: 'assets/icons/dishes/canh.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của canh:\n\n'
        '1. Giàu dinh dưỡng: Canh cung cấp nhiều vitamin và khoáng chất từ rau củ và thịt.\n\n'
        '2. Tốt cho tiêu hóa: Canh dễ tiêu hóa và giúp bù nước cho cơ thể.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để nấu canh.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Canh rau củ: Nấu canh với các loại rau củ tươi như cà rốt, khoai tây.\n\n'
        '* Canh thịt: Nấu canh với thịt bò, gà hoặc heo và rau củ.\n\n',
  ),
  Category(
    label: 'Cháo',
    value: 'chao',
    icon: 'assets/icons/dishes/chao.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của cháo:\n\n'
        '1. Giàu dinh dưỡng: Cháo cung cấp nhiều vitamin và khoáng chất từ gạo và nguyên liệu thêm vào.\n\n'
        '2. Dễ tiêu hóa: Cháo dễ tiêu hóa và phù hợp cho mọi lứa tuổi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để nấu cháo.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cháo trắng: Nấu cháo với gạo và nước, ăn kèm với gia vị.\n\n'
        '* Cháo thịt: Nấu cháo với thịt bằm và rau củ.\n\n',
  ),
  Category(
    label: 'Bánh mì',
    value: 'banh-mi',
    icon: 'assets/icons/dishes/banh-mi.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của bánh mì:\n\n'
        '1. Cung cấp năng lượng: Bánh mì là nguồn cung cấp năng lượng chính từ carbohydrate.\n\n'
        '2. Dễ tiêu hóa: Bánh mì dễ tiêu hóa và phù hợp cho mọi lứa tuổi.\n\n'
        'Lưu ý:\n\n'
        '* Chọn bánh mì tươi, không chứa chất bảo quản.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Bánh mì ăn kèm: Ăn bánh mì với bơ và mứt.\n\n'
        '* Bánh mì nướng: Nướng bánh mì với tỏi và bơ.\n\n',
  ),
  Category(
    label: 'Bánh bao',
    value: 'banh-bao',
    icon: 'assets/icons/dishes/banh-bao.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của bánh bao:\n\n'
        '1. Giàu dinh dưỡng: Bánh bao chứa nhiều thịt và rau củ, cung cấp protein và vitamin.\n\n'
        '2. Tiện lợi: Bánh bao dễ mang theo và chế biến nhanh chóng.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm bánh bao.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Bánh bao chiên: Chiên bánh bao với dầu cho đến khi giòn.\n\n'
        '* Bánh bao hấp: Hấp bánh bao để giữ nguyên hương vị tự nhiên.\n\n',
  ),
  Category(
    label: 'Nem rán',
    value: 'nem-ran',
    icon: 'assets/icons/dishes/nem-ran.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của nem rán:\n\n'
        '1. Giàu dinh dưỡng: Nem rán chứa nhiều thịt và rau củ, cung cấp protein và vitamin.\n\n'
        '2. Tiện lợi: Nem rán dễ chế biến và ăn kèm với nhiều món.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để làm nem rán.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Nem rán chiên: Chiên nem với dầu cho đến khi giòn.\n\n'
        '* Nem rán hấp: Hấp nem trước khi chiên để giữ nguyên hương vị tự nhiên.\n\n',
  ),
  Category(
    label: 'Cơm trộn',
    value: 'com-tron',
    icon: 'assets/icons/dishes/com-tron.png',
    type: 'dishes',
    defaultDuration: 1,
    note: 'Lợi ích sức khỏe của cơm trộn:\n\n'
        '1. Giàu dinh dưỡng: Cơm trộn chứa nhiều rau củ và protein từ thịt hoặc trứng.\n\n'
        '2. Cung cấp năng lượng: Cơm trộn cung cấp năng lượng từ carbohydrate và protein.\n\n'
        'Lưu ý:\n\n'
        '* Chọn nguyên liệu tươi, sạch để nấu cơm trộn.\n\n'
        'Gợi ý chế biến:\n\n'
        '* Cơm trộn Hàn Quốc: Trộn cơm với rau, thịt và sốt gochujang.\n\n'
        '* Cơm trộn Nhật Bản: Trộn cơm với cá ngừ, rau củ và sốt teriyaki.\n\n',
  ),
];
List<Category> dairyProducts = [
  Category(
    label: 'Roquefort',
    value: 'roquefort',
    icon: 'assets/icons/dairy_products/roquefort.png',
    type: 'dairy_products',
    defaultDuration: 30, // Phô mai Roquefort có thể bảo quản lâu
    note: 'Lợi ích sức khỏe của Roquefort:\n\n'
        '1. Giàu protein: Roquefort cung cấp lượng protein dồi dào, hỗ trợ cơ bắp và sức khỏe toàn diện.\n\n'
        '2. Giàu canxi: Roquefort chứa nhiều canxi, giúp duy trì xương chắc khỏe.\n\n'
        '3. Chứa vitamin A và B12: Hỗ trợ sức khỏe mắt và hệ thần kinh.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 369 kcal\n'
        '* Chất đạm: 21g\n'
        '* Chất béo: 30g\n'
        '* Canxi: 500mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và tránh tiếp xúc với không khí để giữ độ tươi ngon.\n\n',
  ),
  Category(
    label: 'Sữa hạnh nhân',
    value: 'sua-hanh-nhan',
    icon: 'assets/icons/dairy_products/sua-hanh-nhan.png',
    type: 'dairy_products',
    defaultDuration: 7, // Sữa hạnh nhân thường bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của sữa hạnh nhân:\n\n'
        '1. Ít calo: Sữa hạnh nhân chứa ít calo, phù hợp cho người ăn kiêng.\n\n'
        '2. Không chứa lactose: Thích hợp cho người không dung nạp lactose.\n\n'
        '3. Giàu vitamin E: Hỗ trợ sức khỏe da và chống oxy hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 30 kcal\n'
        '* Chất đạm: 1g\n'
        '* Chất béo: 2.5g\n'
        '* Vitamin E: 6mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Sữa đậu nành',
    value: 'sua-dau-nanh',
    icon: 'assets/icons/dairy_products/sua-dau-nanh.png',
    type: 'dairy_products',
    defaultDuration: 7, // Sữa đậu nành thường bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của sữa đậu nành:\n\n'
        '1. Giàu protein: Sữa đậu nành cung cấp lượng protein thực vật chất lượng cao.\n\n'
        '2. Không chứa lactose: Thích hợp cho người không dung nạp lactose.\n\n'
        '3. Chứa isoflavones: Hỗ trợ sức khỏe tim mạch và hormone.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 54 kcal\n'
        '* Chất đạm: 3.3g\n'
        '* Chất béo: 1.8g\n'
        '* Canxi: 25mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Thức uống lợi khuẩn',
    value: 'thuc-uong-loi-khuan',
    icon: 'assets/icons/dairy_products/thuc-uong-loi-khuan.png',
    type: 'dairy_products',
    defaultDuration:
        14, // Thức uống lợi khuẩn thường bảo quản được trong 2 tuần
    note: 'Lợi ích sức khỏe của thức uống lợi khuẩn:\n\n'
        '1. Tốt cho tiêu hóa: Chứa probiotics giúp cân bằng hệ vi sinh đường ruột.\n\n'
        '2. Tăng cường miễn dịch: Hỗ trợ hệ miễn dịch khỏe mạnh.\n\n'
        '3. Cung cấp năng lượng: Thức uống lợi khuẩn thường giàu dinh dưỡng.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 50 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 2g\n'
        '* Probiotics: 1 tỷ CFU\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 2 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Trà sữa',
    value: 'tra-sua',
    icon: 'assets/icons/dairy_products/tra-sua.png',
    type: 'dairy_products',
    defaultDuration: 3, // Trà sữa nên dùng trong 3 ngày
    note: 'Lợi ích sức khỏe của trà sữa:\n\n'
        '1. Thưởng thức hương vị: Trà sữa là thức uống thơm ngon, giúp thư giãn.\n\n'
        '2. Cung cấp năng lượng: Trà sữa chứa đường và sữa cung cấp năng lượng nhanh.\n\n'
        '3. Giàu canxi: Sữa trong trà sữa cung cấp canxi cho xương chắc khỏe.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 80 kcal\n'
        '* Chất đạm: 1g\n'
        '* Chất béo: 3g\n'
        '* Đường: 10g\n\n'
        'Lưu ý: Trà sữa nên uống vừa phải để tránh tăng cân. Bảo quản trong tủ lạnh và dùng trong 3 ngày.\n\n',
  ),
  Category(
    label: 'Sữa dừa',
    value: 'sua-dua',
    icon: 'assets/icons/dairy_products/sua-dua.png',
    type: 'dairy_products',
    defaultDuration: 7, // Sữa dừa thường bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của sữa dừa:\n\n'
        '1. Giàu chất béo tốt: Sữa dừa chứa chất béo bão hòa có lợi cho sức khỏe.\n\n'
        '2. Không chứa lactose: Thích hợp cho người không dung nạp lactose.\n\n'
        '3. Giàu kali: Hỗ trợ cân bằng điện giải trong cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 60 kcal\n'
        '* Chất đạm: 0.5g\n'
        '* Chất béo: 5g\n'
        '* Kali: 50mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Sữa chua',
    value: 'sua-chua',
    icon: 'assets/icons/dairy_products/sua-chua.png',
    type: 'dairy_products',
    defaultDuration: 14, // Sữa chua thường bảo quản được trong 2 tuần
    note: 'Lợi ích sức khỏe của sữa chua:\n\n'
        '1. Tốt cho tiêu hóa: Chứa probiotics giúp cân bằng hệ vi sinh đường ruột.\n\n'
        '2. Giàu canxi: Sữa chua cung cấp canxi cho xương chắc khỏe.\n\n'
        '3. Giàu protein: Hỗ trợ cơ bắp và sức khỏe toàn diện.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 59 kcal\n'
        '* Chất đạm: 10g\n'
        '* Chất béo: 3.3g\n'
        '* Canxi: 120mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 2 tuần.\n\n',
  ),
  Category(
    label: 'Sữa bột',
    value: 'sua-bot',
    icon: 'assets/icons/dairy_products/sua-bot.png',
    type: 'dairy_products',
    defaultDuration: 180, // Sữa bột có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của sữa bột:\n\n'
        '1. Giàu dinh dưỡng: Sữa bột cung cấp đầy đủ vitamin và khoáng chất.\n\n'
        '2. Dễ bảo quản: Sữa bột có thể bảo quản lâu và tiện lợi khi sử dụng.\n\n'
        '3. Hỗ trợ tăng trưởng: Giúp phát triển cơ bắp và xương.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 496 kcal\n'
        '* Chất đạm: 24g\n'
        '* Chất béo: 26g\n'
        '* Canxi: 900mg\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 tháng sau khi mở hộp.\n\n',
  ),
  Category(
    label: 'Sữa tươi',
    value: 'sua-tuoi',
    icon: 'assets/icons/dairy_products/sua-tuoi.png',
    type: 'dairy_products',
    defaultDuration: 7, // Sữa tươi thường bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của sữa tươi:\n\n'
        '1. Giàu dinh dưỡng: Sữa tươi cung cấp đầy đủ vitamin và khoáng chất.\n\n'
        '2. Giàu canxi: Sữa tươi cung cấp canxi cho xương chắc khỏe.\n\n'
        '3. Giàu protein: Hỗ trợ cơ bắp và sức khỏe toàn diện.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 42 kcal\n'
        '* Chất đạm: 3.4g\n'
        '* Chất béo: 1g\n'
        '* Canxi: 120mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Phô mát kem',
    value: 'pho-mat-kem',
    icon: 'assets/icons/dairy_products/pho-mat-kem.png',
    type: 'dairy_products',
    defaultDuration: 14, // Phô mát kem thường bảo quản được trong 2 tuần
    note: 'Lợi ích sức khỏe của phô mát kem:\n\n'
        '1. Giàu dinh dưỡng: Phô mát kem cung cấp đầy đủ protein và chất béo.\n\n'
        '2. Giàu canxi: Giúp xương chắc khỏe và phát triển.\n\n'
        '3. Giàu vitamin A: Tốt cho mắt và da.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 342 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 34g\n'
        '* Canxi: 98mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 2 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Phô mai',
    value: 'pho-mai',
    icon: 'assets/icons/dairy_products/pho-mai.png',
    type: 'dairy_products',
    defaultDuration: 30, // Phô mai thường bảo quản được trong 1 tháng
    note: 'Lợi ích sức khỏe của phô mai:\n\n'
        '1. Giàu dinh dưỡng: Phô mai cung cấp đầy đủ protein và chất béo.\n\n'
        '2. Giàu canxi: Giúp xương chắc khỏe và phát triển.\n\n'
        '3. Giàu vitamin B12: Hỗ trợ sức khỏe thần kinh và hồng cầu.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 402 kcal\n'
        '* Chất đạm: 25g\n'
        '* Chất béo: 33g\n'
        '* Canxi: 721mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tháng sau khi mở.\n\n',
  ),
  Category(
    label: 'Phô mai mozzarella',
    value: 'pho-mai-mozzarella',
    icon: 'assets/icons/dairy_products/pho-mai-mozzarella.png',
    type: 'dairy_products',
    defaultDuration: 21, // Phô mai mozzarella thường bảo quản được trong 3 tuần
    note: 'Lợi ích sức khỏe của phô mai mozzarella:\n\n'
        '1. Giàu protein: Phô mai mozzarella cung cấp lượng protein dồi dào, hỗ trợ cơ bắp và sức khỏe toàn diện.\n\n'
        '2. Giàu canxi: Giúp duy trì xương chắc khỏe.\n\n'
        '3. Giàu vitamin B12: Hỗ trợ sức khỏe thần kinh và hồng cầu.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 280 kcal\n'
        '* Chất đạm: 28g\n'
        '* Chất béo: 17g\n'
        '* Canxi: 731mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 3 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Ricotta',
    value: 'ricotta',
    icon: 'assets/icons/dairy_products/ricotta.png',
    type: 'dairy_products',
    defaultDuration: 7, // Ricotta thường bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của Ricotta:\n\n'
        '1. Giàu protein: Ricotta cung cấp lượng protein dồi dào, hỗ trợ cơ bắp và sức khỏe toàn diện.\n\n'
        '2. Giàu canxi: Giúp duy trì xương chắc khỏe.\n\n'
        '3. Giàu vitamin B12: Hỗ trợ sức khỏe thần kinh và hồng cầu.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 174 kcal\n'
        '* Chất đạm: 11g\n'
        '* Chất béo: 13g\n'
        '* Canxi: 207mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Kem tươi',
    value: 'kem-tuoi',
    icon: 'assets/icons/dairy_products/kem-tuoi.png',
    type: 'dairy_products',
    defaultDuration: 7, // Kem tươi thường bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của kem tươi:\n\n'
        '1. Giàu chất béo tốt: Kem tươi cung cấp lượng chất béo cần thiết cho cơ thể.\n\n'
        '2. Giàu canxi: Giúp duy trì xương chắc khỏe.\n\n'
        '3. Cung cấp năng lượng: Kem tươi cung cấp năng lượng nhanh chóng cho cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 207 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 20g\n'
        '* Canxi: 66mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Kem chua',
    value: 'kem-chua',
    icon: 'assets/icons/dairy_products/kem-chua.png',
    type: 'dairy_products',
    defaultDuration: 14, // Kem chua thường bảo quản được trong 2 tuần
    note: 'Lợi ích sức khỏe của kem chua:\n\n'
        '1. Giàu chất béo tốt: Kem chua cung cấp lượng chất béo cần thiết cho cơ thể.\n\n'
        '2. Giàu canxi: Giúp duy trì xương chắc khỏe.\n\n'
        '3. Giàu probiotics: Hỗ trợ tiêu hóa và cân bằng hệ vi sinh đường ruột.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 214 kcal\n'
        '* Chất đạm: 3.5g\n'
        '* Chất béo: 20g\n'
        '* Canxi: 101mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 2 tuần sau khi mở.\n\n',
  ),
  Category(
    label: 'Gouda',
    value: 'gouda',
    icon: 'assets/icons/dairy_products/gouda.png',
    type: 'dairy_products',
    defaultDuration: 60, // Phô mai Gouda có thể bảo quản được trong 2 tháng
    note: 'Lợi ích sức khỏe của phô mai Gouda:\n\n'
        '1. Giàu protein: Phô mai Gouda cung cấp lượng protein dồi dào, hỗ trợ cơ bắp và sức khỏe toàn diện.\n\n'
        '2. Giàu canxi: Giúp duy trì xương chắc khỏe.\n\n'
        '3. Giàu vitamin K2: Hỗ trợ sức khỏe tim mạch và xương.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 356 kcal\n'
        '* Chất đạm: 25g\n'
        '* Chất béo: 27g\n'
        '* Canxi: 700mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 2 tháng sau khi mở.\n\n',
  ),
  Category(
    label: 'Cheddar',
    value: 'cheddar',
    icon: 'assets/icons/dairy_products/cheddar.png',
    type: 'dairy_products',
    defaultDuration: 60, // Phô mai Cheddar có thể bảo quản được trong 2 tháng
    note: 'Lợi ích sức khỏe của phô mai Cheddar:\n\n'
        '1. Giàu protein: Phô mai Cheddar cung cấp lượng protein dồi dào, hỗ trợ cơ bắp và sức khỏe toàn diện.\n\n'
        '2. Giàu canxi: Giúp duy trì xương chắc khỏe.\n\n'
        '3. Giàu vitamin B12: Hỗ trợ sức khỏe thần kinh và hồng cầu.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 403 kcal\n'
        '* Chất đạm: 25g\n'
        '* Chất béo: 33g\n'
        '* Canxi: 721mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 2 tháng sau khi mở.\n\n',
  ),
  Category(
    label: 'Bơ',
    value: 'bo',
    icon: 'assets/icons/dairy_products/bo.png',
    type: 'dairy_products',
    defaultDuration: 30, // Bơ có thể bảo quản được trong 1 tháng
    note: 'Lợi ích sức khỏe của bơ:\n\n'
        '1. Giàu chất béo tốt: Bơ cung cấp lượng chất béo cần thiết cho cơ thể.\n\n'
        '2. Giàu vitamin A: Hỗ trợ sức khỏe mắt và da.\n\n'
        '3. Cung cấp năng lượng: Bơ cung cấp năng lượng nhanh chóng cho cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 717 kcal\n'
        '* Chất đạm: 0.9g\n'
        '* Chất béo: 81g\n'
        '* Vitamin A: 684μg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tháng sau khi mở.\n\n',
  ),
];

List<Category> drinks = [
  Category(
    label: 'Cà phê',
    value: 'ca-phe',
    icon: 'assets/icons/drinks/ca-phe.png',
    type: 'drinks',
    defaultDuration: 7, // Cà phê pha sẵn có thể bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của cà phê:\n\n'
        '1. Tăng cường năng lượng: Caffeine trong cà phê giúp tăng cường sự tỉnh táo và năng lượng.\n\n'
        '2. Chứa chất chống oxy hóa: Cà phê chứa nhiều chất chống oxy hóa có lợi cho sức khỏe.\n\n'
        '3. Cải thiện tinh thần: Cà phê có thể cải thiện tâm trạng và giảm nguy cơ trầm cảm.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 2 kcal\n'
        '* Chất đạm: 0.1g\n'
        '* Chất béo: 0g\n'
        '* Caffeine: 40mg\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của caffeine. Bảo quản trong tủ lạnh và dùng trong 1 tuần.\n\n',
  ),
  Category(
    label: 'Coca',
    value: 'coca',
    icon: 'assets/icons/drinks/coca.png',
    type: 'drinks',
    defaultDuration: 180, // Nước ngọt có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của Coca:\n\n'
        '1. Cung cấp năng lượng nhanh: Coca chứa đường cung cấp năng lượng nhanh chóng.\n\n'
        '2. Giải khát: Coca là thức uống giải khát phổ biến.\n\n'
        '3. Chứa caffeine: Giúp tăng cường tỉnh táo và năng lượng.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 42 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Đường: 10.6g\n'
        '* Caffeine: 10mg\n\n'
        'Lưu ý: Uống vừa phải để tránh tăng cân và các vấn đề về sức khỏe khác. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt cà phê',
    value: 'hat-ca-phe',
    icon: 'assets/icons/drinks/hat-ca-phe.png',
    type: 'drinks',
    defaultDuration: 365, // Hạt cà phê có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của hạt cà phê:\n\n'
        '1. Chứa chất chống oxy hóa: Hạt cà phê chứa nhiều chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Tăng cường năng lượng: Caffeine trong hạt cà phê giúp tăng cường sự tỉnh táo và năng lượng.\n\n'
        '3. Hỗ trợ đốt cháy mỡ: Caffeine có thể giúp tăng cường quá trình trao đổi chất và đốt cháy mỡ.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 0 kcal (trong hạt nguyên, không pha)\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Caffeine: 40mg\n\n'
        'Lưu ý: Bảo quản nơi khô ráo, thoáng mát và tránh ánh nắng trực tiếp. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Nước cam',
    value: 'nuoc-cam',
    icon: 'assets/icons/drinks/nuoc-cam.png',
    type: 'drinks',
    defaultDuration: 3, // Nước cam tươi nên dùng trong 3 ngày
    note: 'Lợi ích sức khỏe của nước cam:\n\n'
        '1. Giàu vitamin C: Nước cam cung cấp lượng vitamin C dồi dào, hỗ trợ hệ miễn dịch.\n\n'
        '2. Chứa chất chống oxy hóa: Giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '3. Tốt cho tiêu hóa: Chứa chất xơ hòa tan giúp cải thiện tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 45 kcal\n'
        '* Chất đạm: 0.7g\n'
        '* Chất béo: 0.2g\n'
        '* Vitamin C: 50mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 3 ngày.\n\n',
  ),
  Category(
    label: 'Nước chanh',
    value: 'nuoc-chanh',
    icon: 'assets/icons/drinks/nuoc-chanh.png',
    type: 'drinks',
    defaultDuration: 3, // Nước chanh tươi nên dùng trong 3 ngày
    note: 'Lợi ích sức khỏe của nước chanh:\n\n'
        '1. Giàu vitamin C: Nước chanh cung cấp lượng vitamin C dồi dào, hỗ trợ hệ miễn dịch.\n\n'
        '2. Thải độc cơ thể: Giúp thải độc và cải thiện hệ tiêu hóa.\n\n'
        '3. Hỗ trợ giảm cân: Chứa ít calo và có thể giúp giảm cảm giác thèm ăn.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 29 kcal\n'
        '* Chất đạm: 0.2g\n'
        '* Chất béo: 0.1g\n'
        '* Vitamin C: 30mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 3 ngày.\n\n',
  ),
  Category(
    label: 'Nước dừa',
    value: 'nuoc-dua',
    icon: 'assets/icons/drinks/nuoc-dua.png',
    type: 'drinks',
    defaultDuration: 7, // Nước dừa tươi thường bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của nước dừa:\n\n'
        '1. Giàu chất điện giải: Nước dừa cung cấp kali và natri, giúp cân bằng điện giải.\n\n'
        '2. Giảm mệt mỏi: Giúp bù nước và cung cấp năng lượng.\n\n'
        '3. Tốt cho tiêu hóa: Hỗ trợ tiêu hóa và thải độc cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 19 kcal\n'
        '* Chất đạm: 0.7g\n'
        '* Chất béo: 0.2g\n'
        '* Kali: 250mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Nước ép trái cây',
    value: 'nuoc-ep-trai-cay',
    icon: 'assets/icons/drinks/nuoc-ep-trai-cay.png',
    type: 'drinks',
    defaultDuration: 3, // Nước ép trái cây tươi nên dùng trong 3 ngày
    note: 'Lợi ích sức khỏe của nước ép trái cây:\n\n'
        '1. Giàu vitamin và khoáng chất: Nước ép trái cây cung cấp nhiều vitamin và khoáng chất cần thiết.\n\n'
        '2. Chống oxy hóa: Giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '3. Giải khát và bù nước: Giúp cơ thể giải khát và bù nước nhanh chóng.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 45 kcal\n'
        '* Chất đạm: 0.7g\n'
        '* Chất béo: 0.2g\n'
        '* Vitamin C: 50mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 3 ngày.\n\n',
  ),
  Category(
    label: 'Nước mía',
    value: 'nuoc-mia',
    icon: 'assets/icons/drinks/nuoc-mia.png',
    type: 'drinks',
    defaultDuration: 3, // Nước mía tươi nên dùng trong 3 ngày
    note: 'Lợi ích sức khỏe của nước mía:\n\n'
        '1. Cung cấp năng lượng nhanh: Nước mía chứa đường tự nhiên, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Giải nhiệt: Giúp cơ thể giải nhiệt và làm mát.\n\n'
        '3. Tốt cho tiêu hóa: Hỗ trợ tiêu hóa và thải độc cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 40 kcal\n'
        '* Chất đạm: 0.1g\n'
        '* Chất béo: 0g\n'
        '* Đường: 10g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 3 ngày.\n\n',
  ),
  Category(
    label: 'Nước ngọt có ga',
    value: 'nuoc-ngot-co-ga',
    icon: 'assets/icons/drinks/nuoc-ngot-co-ga.png',
    type: 'drinks',
    defaultDuration: 180, // Nước ngọt có ga có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của nước ngọt có ga:\n\n'
        '1. Giải khát: Nước ngọt có ga giúp giải khát nhanh chóng.\n\n'
        '2. Cung cấp năng lượng: Chứa đường cung cấp năng lượng nhanh.\n\n'
        '3. Kích thích tiêu hóa: Giúp tiêu hóa thức ăn nhanh hơn.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 42 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Đường: 10.6g\n\n'
        'Lưu ý: Uống vừa phải để tránh các vấn đề về sức khỏe. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Nước suối',
    value: 'nuoc-suoi',
    icon: 'assets/icons/drinks/nuoc-suoi.png',
    type: 'drinks',
    defaultDuration: 365, // Nước suối có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của nước suối:\n\n'
        '1. Giải khát: Nước suối giúp giải khát và bù nước cho cơ thể.\n\n'
        '2. Không calo: Nước suối không chứa calo, phù hợp cho người ăn kiêng.\n\n'
        '3. Tốt cho sức khỏe tổng quát: Uống đủ nước giúp duy trì sức khỏe toàn diện.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 0 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Không chứa khoáng chất\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Nước suối có ga',
    value: 'nuoc-suoi-co-ga',
    icon: 'assets/icons/drinks/nuoc-suoi-co-ga.png',
    type: 'drinks',
    defaultDuration: 365, // Nước suối có ga có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của nước suối có ga:\n\n'
        '1. Giải khát: Nước suối có ga giúp giải khát và bù nước cho cơ thể.\n\n'
        '2. Không calo: Nước suối có ga không chứa calo, phù hợp cho người ăn kiêng.\n\n'
        '3. Tốt cho tiêu hóa: Giúp tiêu hóa tốt hơn và giảm cảm giác đầy hơi.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 0 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Không chứa khoáng chất\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Nước tăng lực',
    value: 'nuoc-tang-luc',
    icon: 'assets/icons/drinks/nuoc-tang-luc.png',
    type: 'drinks',
    defaultDuration: 180, // Nước tăng lực có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của nước tăng lực:\n\n'
        '1. Tăng cường năng lượng: Chứa caffeine và đường cung cấp năng lượng nhanh chóng.\n\n'
        '2. Tăng sự tỉnh táo: Giúp tăng cường sự tập trung và tỉnh táo.\n\n'
        '3. Chứa vitamin B: Giúp hỗ trợ quá trình chuyển hóa năng lượng.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 45 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Đường: 11g\n'
        '* Caffeine: 32mg\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của caffeine. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Nước táo',
    value: 'nuoc-tao',
    icon: 'assets/icons/drinks/nuoc-tao.png',
    type: 'drinks',
    defaultDuration: 7, // Nước táo tươi thường bảo quản được trong 1 tuần
    note: 'Lợi ích sức khỏe của nước táo:\n\n'
        '1. Giàu vitamin C: Nước táo cung cấp lượng vitamin C dồi dào, hỗ trợ hệ miễn dịch.\n\n'
        '2. Chứa chất chống oxy hóa: Giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '3. Tốt cho tiêu hóa: Chứa chất xơ hòa tan giúp cải thiện tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 46 kcal\n'
        '* Chất đạm: 0.1g\n'
        '* Chất béo: 0.2g\n'
        '* Vitamin C: 50mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Nước tonic',
    value: 'nuoc-tonic',
    icon: 'assets/icons/drinks/nuoc-tonic.png',
    type: 'drinks',
    defaultDuration: 180, // Nước tonic có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của nước tonic:\n\n'
        '1. Giải khát: Nước tonic giúp giải khát nhanh chóng.\n\n'
        '2. Cung cấp năng lượng: Chứa đường cung cấp năng lượng nhanh.\n\n'
        '3. Kích thích tiêu hóa: Giúp tiêu hóa thức ăn nhanh hơn.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 37 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Đường: 9g\n\n'
        'Lưu ý: Uống vừa phải để tránh các vấn đề về sức khỏe. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Nước uống thể thao',
    value: 'nuoc-uong-the-thao',
    icon: 'assets/icons/drinks/nuoc-uong-the-thao.png',
    type: 'drinks',
    defaultDuration:
        180, // Nước uống thể thao có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của nước uống thể thao:\n\n'
        '1. Bù nước và điện giải: Cung cấp các chất điện giải như natri và kali, giúp cân bằng nước và điện giải trong cơ thể.\n\n'
        '2. Tăng cường năng lượng: Chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '3. Giảm mệt mỏi: Giúp giảm mệt mỏi và cải thiện hiệu suất thể thao.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 25 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Đường: 6g\n'
        '* Natri: 110mg\n'
        '* Kali: 30mg\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Sô cô la nóng',
    value: 'so-co-la-nong',
    icon: 'assets/icons/drinks/so-co-la-nong.png',
    type: 'drinks',
    defaultDuration: 3, // Sô cô la nóng nên dùng trong 3 ngày
    note: 'Lợi ích sức khỏe của sô cô la nóng:\n\n'
        '1. Cung cấp năng lượng: Sô cô la nóng chứa đường và cacao, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Giàu chất chống oxy hóa: Cacao chứa nhiều chất chống oxy hóa tốt cho sức khỏe.\n\n'
        '3. Cải thiện tâm trạng: Sô cô la nóng có thể giúp cải thiện tâm trạng và giảm stress.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 89 kcal\n'
        '* Chất đạm: 2g\n'
        '* Chất béo: 2.5g\n'
        '* Đường: 14g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 3 ngày.\n\n',
  ),
  Category(
    label: 'Soda lon',
    value: 'soda-lon',
    icon: 'assets/icons/drinks/soda-lon.png',
    type: 'drinks',
    defaultDuration: 180, // Soda lon có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của soda lon:\n\n'
        '1. Giải khát: Soda lon giúp giải khát nhanh chóng.\n\n'
        '2. Cung cấp năng lượng: Chứa đường cung cấp năng lượng nhanh.\n\n'
        '3. Kích thích tiêu hóa: Giúp tiêu hóa thức ăn nhanh hơn.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 42 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Đường: 10.6g\n\n'
        'Lưu ý: Uống vừa phải để tránh các vấn đề về sức khỏe. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Trà',
    value: 'tra',
    icon: 'assets/icons/drinks/tra.png',
    type: 'drinks',
    defaultDuration: 365, // Trà khô có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà:\n\n'
        '1. Chứa chất chống oxy hóa: Trà chứa nhiều chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Tăng cường tinh thần: Trà có thể giúp tăng cường sự tập trung và giảm căng thẳng.\n\n'
        '3. Hỗ trợ tiêu hóa: Trà giúp cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 1 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Caffeine: 20mg\n\n'
        'Lưu ý: Bảo quản trà khô nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Trà bạc hà',
    value: 'tra-bac-ha',
    icon: 'assets/icons/drinks/tra-bac-ha.png',
    type: 'drinks',
    defaultDuration: 365, // Trà bạc hà khô có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà bạc hà:\n\n'
        '1. Cải thiện tiêu hóa: Trà bạc hà giúp giảm đầy hơi và khó tiêu.\n\n'
        '2. Giảm căng thẳng: Hương thơm của bạc hà giúp giảm căng thẳng và mệt mỏi.\n\n'
        '3. Làm dịu cổ họng: Trà bạc hà có thể giúp làm dịu cổ họng đau rát.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 0 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Không chứa caffeine\n\n'
        'Lưu ý: Bảo quản trà bạc hà khô nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Trà chanh',
    value: 'tra-chanh',
    icon: 'assets/icons/drinks/tra-chanh.png',
    type: 'drinks',
    defaultDuration: 3, // Trà chanh pha sẵn nên dùng trong 3 ngày
    note: 'Lợi ích sức khỏe của trà chanh:\n\n'
        '1. Giàu vitamin C: Trà chanh cung cấp lượng vitamin C dồi dào, hỗ trợ hệ miễn dịch.\n\n'
        '2. Giải khát: Giúp giải khát và làm mát cơ thể.\n\n'
        '3. Thải độc cơ thể: Giúp thải độc và cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 20 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Vitamin C: 20mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 3 ngày.\n\n',
  ),
  Category(
    label: 'Trà dâm bụt',
    value: 'tra-dam-but',
    icon: 'assets/icons/drinks/tra-dam-but.png',
    type: 'drinks',
    defaultDuration: 365, // Trà dâm bụt khô có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà dâm bụt:\n\n'
        '1. Giàu chất chống oxy hóa: Trà dâm bụt chứa nhiều chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Hạ huyết áp: Trà dâm bụt có thể giúp giảm huyết áp cao.\n\n'
        '3. Hỗ trợ tiêu hóa: Trà dâm bụt giúp cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 0 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Không chứa caffeine\n\n'
        'Lưu ý: Bảo quản trà dâm bụt khô nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Trà gừng',
    value: 'tra-gung',
    icon: 'assets/icons/drinks/tra-gung.png',
    type: 'drinks',
    defaultDuration: 365, // Trà gừng khô có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà gừng:\n\n'
        '1. Cải thiện tiêu hóa: Trà gừng giúp giảm buồn nôn và khó tiêu.\n\n'
        '2. Chống viêm: Gừng có tác dụng chống viêm và giảm đau.\n\n'
        '3. Tăng cường miễn dịch: Trà gừng giúp tăng cường hệ miễn dịch.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 1 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Không chứa caffeine\n\n'
        'Lưu ý: Bảo quản trà gừng khô nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Trà hoa cúc',
    value: 'tra-hoa-cuc',
    icon: 'assets/icons/drinks/tra-hoa-cuc.png',
    type: 'drinks',
    defaultDuration: 365, // Trà hoa cúc khô có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà hoa cúc:\n\n'
        '1. Làm dịu thần kinh: Trà hoa cúc giúp giảm căng thẳng và lo âu.\n\n'
        '2. Hỗ trợ tiêu hóa: Giúp cải thiện tiêu hóa và giảm đau dạ dày.\n\n'
        '3. Chống viêm: Trà hoa cúc có tác dụng chống viêm và giảm đau.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 1 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Không chứa caffeine\n\n'
        'Lưu ý: Bảo quản trà hoa cúc khô nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Trà hoa nhài',
    value: 'tra-hoa-nhai',
    icon: 'assets/icons/drinks/tra-hoa-nhai.png',
    type: 'drinks',
    defaultDuration: 365, // Trà hoa nhài khô có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà hoa nhài:\n\n'
        '1. Làm dịu thần kinh: Trà hoa nhài giúp giảm căng thẳng và lo âu.\n\n'
        '2. Chống oxy hóa: Giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '3. Hỗ trợ tiêu hóa: Trà hoa nhài giúp cải thiện tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 1 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Không chứa caffeine\n\n'
        'Lưu ý: Bảo quản trà hoa nhài khô nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Trà ô long',
    value: 'tra-o-long',
    icon: 'assets/icons/drinks/tra-o-long.png',
    type: 'drinks',
    defaultDuration: 365, // Trà ô long khô có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà ô long:\n\n'
        '1. Chứa chất chống oxy hóa: Trà ô long giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '2. Tăng cường tinh thần: Trà ô long giúp tăng cường sự tập trung và giảm căng thẳng.\n\n'
        '3. Hỗ trợ tiêu hóa: Giúp cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 1 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Caffeine: 20mg\n\n'
        'Lưu ý: Bảo quản trà ô long khô nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Trà túi lọc',
    value: 'tra-tui-loc',
    icon: 'assets/icons/drinks/tra-tui-loc.png',
    type: 'drinks',
    defaultDuration: 365, // Trà túi lọc có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà túi lọc:\n\n'
        '1. Chứa chất chống oxy hóa: Trà túi lọc giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '2. Tăng cường tinh thần: Trà túi lọc giúp tăng cường sự tập trung và giảm căng thẳng.\n\n'
        '3. Hỗ trợ tiêu hóa: Giúp cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 1 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Caffeine: 20mg\n\n'
        'Lưu ý: Bảo quản trà túi lọc nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Trà xanh',
    value: 'tra-xanh',
    icon: 'assets/icons/drinks/tra-xanh.png',
    type: 'drinks',
    defaultDuration: 365, // Trà xanh khô có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của trà xanh:\n\n'
        '1. Chứa chất chống oxy hóa: Trà xanh giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '2. Tăng cường tinh thần: Trà xanh giúp tăng cường sự tập trung và giảm căng thẳng.\n\n'
        '3. Hỗ trợ tiêu hóa: Giúp cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml, khi pha):\n\n'
        '* Calo: 1 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Caffeine: 20mg\n\n'
        'Lưu ý: Bảo quản trà xanh khô nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
];

List<Category> alcohol = [
  Category(
    label: 'Bia',
    value: 'bia',
    icon: 'assets/icons/alcohol/bia.png',
    type: 'alcohol',
    defaultDuration: 180, // Bia có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của bia:\n\n'
        '1. Cung cấp vitamin B: Bia chứa các vitamin nhóm B, đặc biệt là B6 và B12.\n\n'
        '2. Giải khát: Bia giúp giải khát và làm mát cơ thể.\n\n'
        '3. Chứa chất chống oxy hóa: Giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 43 kcal\n'
        '* Chất đạm: 0.5g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 3.6g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bia không cồn',
    value: 'bia-khong-con',
    icon: 'assets/icons/alcohol/bia-khong-con.png',
    type: 'alcohol',
    defaultDuration: 180, // Bia không cồn có thể bảo quản được trong 6 tháng
    note: 'Lợi ích sức khỏe của bia không cồn:\n\n'
        '1. Giải khát: Bia không cồn giúp giải khát và làm mát cơ thể.\n\n'
        '2. Cung cấp vitamin B: Bia không cồn chứa các vitamin nhóm B.\n\n'
        '3. Ít calo: Bia không cồn thường chứa ít calo hơn bia thường.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 20 kcal\n'
        '* Chất đạm: 0.5g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 4g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Cocktail',
    value: 'cocktail',
    icon: 'assets/icons/alcohol/cocktail.png',
    type: 'alcohol',
    defaultDuration: 7, // Cocktail pha sẵn nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của cocktail:\n\n'
        '1. Cung cấp năng lượng: Cocktail chứa đường cung cấp năng lượng nhanh chóng.\n\n'
        '2. Thưởng thức hương vị: Cocktail là thức uống thơm ngon, giúp thư giãn.\n\n'
        '3. Chứa chất chống oxy hóa: Một số thành phần trong cocktail có chất chống oxy hóa.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 150 kcal\n'
        '* Chất đạm: 0.1g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 20g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản trong tủ lạnh và dùng trong 1 tuần.\n\n',
  ),
  Category(
    label: 'Punch',
    value: 'punch',
    icon: 'assets/icons/alcohol/punch.png',
    type: 'alcohol',
    defaultDuration: 7, // Punch pha sẵn nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của punch:\n\n'
        '1. Cung cấp năng lượng: Punch chứa đường cung cấp năng lượng nhanh chóng.\n\n'
        '2. Thưởng thức hương vị: Punch là thức uống thơm ngon, giúp thư giãn.\n\n'
        '3. Giải khát: Punch giúp giải khát và làm mát cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 120 kcal\n'
        '* Chất đạm: 0.2g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 18g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản trong tủ lạnh và dùng trong 1 tuần.\n\n',
  ),
  Category(
    label: 'Rượu absinthe',
    value: 'ruou-absinthe',
    icon: 'assets/icons/alcohol/ruou-absinthe.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu absinthe có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu absinthe:\n\n'
        '1. Tăng cường tiêu hóa: Rượu absinthe có thể giúp kích thích tiêu hóa.\n\n'
        '2. Chứa thảo dược: Rượu absinthe chứa các thành phần thảo dược có lợi cho sức khỏe.\n\n'
        '3. Thưởng thức hương vị: Rượu absinthe có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 297 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 0g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu brandy',
    value: 'ruou-brandy',
    icon: 'assets/icons/alcohol/ruou-brandy.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu brandy có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu brandy:\n\n'
        '1. Chống oxy hóa: Rượu brandy chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Giải khát: Rượu brandy có thể giúp giải khát và làm mát cơ thể.\n\n'
        '3. Thưởng thức hương vị: Rượu brandy có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 237 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 0g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu cà phê',
    value: 'ruou-ca-phe',
    icon: 'assets/icons/alcohol/ruou-ca-phe.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu cà phê có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu cà phê:\n\n'
        '1. Cung cấp năng lượng: Rượu cà phê chứa caffeine giúp tăng cường sự tỉnh táo và năng lượng.\n\n'
        '2. Chống oxy hóa: Cà phê trong rượu chứa chất chống oxy hóa tốt cho sức khỏe.\n\n'
        '3. Thưởng thức hương vị: Rượu cà phê có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 240 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 20g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn và caffeine. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu gin',
    value: 'ruou-gin',
    icon: 'assets/icons/alcohol/ruou-gin.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu gin có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu gin:\n\n'
        '1. Chứa thảo dược: Rượu gin chứa các thành phần thảo dược có lợi cho sức khỏe.\n\n'
        '2. Kích thích tiêu hóa: Rượu gin có thể giúp kích thích tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Rượu gin có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 263 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 0g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu makgeolli',
    value: 'ruou-makgeolli',
    icon: 'assets/icons/alcohol/ruou-makgeolli.png',
    type: 'alcohol',
    defaultDuration: 7, // Rượu makgeolli nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của rượu makgeolli:\n\n'
        '1. Giàu chất xơ: Rượu makgeolli chứa chất xơ giúp cải thiện tiêu hóa.\n\n'
        '2. Chứa probiotics: Hỗ trợ cân bằng hệ vi sinh đường ruột.\n\n'
        '3. Thưởng thức hương vị: Rượu makgeolli có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 46 kcal\n'
        '* Chất đạm: 0.5g\n'
        '* Chất béo: 0.1g\n'
        '* Carbohydrate: 7.5g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Rượu mezcal',
    value: 'ruou-mezcal',
    icon: 'assets/icons/alcohol/ruou-mezcal.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu mezcal có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu mezcal:\n\n'
        '1. Chống oxy hóa: Rượu mezcal chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Kích thích tiêu hóa: Rượu mezcal có thể giúp kích thích tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Rượu mezcal có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 222 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 0g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu mùi thảo dược',
    value: 'ruou-mui-thao-duoc',
    icon: 'assets/icons/alcohol/ruou-mui-thao-duoc.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu mùi thảo dược có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu mùi thảo dược:\n\n'
        '1. Chứa thảo dược: Rượu mùi thảo dược chứa các thành phần thảo dược có lợi cho sức khỏe.\n\n'
        '2. Kích thích tiêu hóa: Rượu mùi thảo dược có thể giúp kích thích tiêu hóa.\n\n'
        '3. Chống oxy hóa: Giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 300 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 30g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu rum',
    value: 'ruou-rum',
    icon: 'assets/icons/alcohol/ruou-rum.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu rum có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu rum:\n\n'
        '1. Chống oxy hóa: Rượu rum chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Giải khát: Rượu rum có thể giúp giải khát và làm mát cơ thể.\n\n'
        '3. Thưởng thức hương vị: Rượu rum có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 231 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 0g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu sake',
    value: 'ruou-sake',
    icon: 'assets/icons/alcohol/ruou-sake.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu sake có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu sake:\n\n'
        '1. Giàu amino acid: Rượu sake chứa amino acid giúp cải thiện tiêu hóa.\n\n'
        '2. Chống oxy hóa: Rượu sake chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Thưởng thức hương vị: Rượu sake có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 134 kcal\n'
        '* Chất đạm: 0.5g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 5g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu sâm banh',
    value: 'ruou-sam-banh',
    icon: 'assets/icons/alcohol/ruou-sam-banh.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu sâm banh có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của rượu sâm banh:\n\n'
        '1. Chống oxy hóa: Rượu sâm banh chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Giải khát: Rượu sâm banh có thể giúp giải khát và làm mát cơ thể.\n\n'
        '3. Thưởng thức hương vị: Rượu sâm banh có hương vị độc đáo và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 76 kcal\n'
        '* Chất đạm: 0.2g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 1.4g\n\n'
        'Lưu ý: Uống vừa phải để tránh các tác dụng phụ của cồn. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rượu soju',
    value: 'ruou-soju',
    icon: 'assets/icons/alcohol/ruou-soju.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu soju có thể bảo quản được trong 1 năm
  ),
  Category(
    label: 'Rượu tequila',
    value: 'ruou-tequila',
    icon: 'assets/icons/alcohol/ruou-tequila.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu tequila có thể bảo quản được trong 1 năm
  ),
  Category(
    label: 'Rượu vang',
    value: 'ruou-vang',
    icon: 'assets/icons/alcohol/ruou-vang.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu vang có thể bảo quản được trong 1 năm
  ),
  Category(
    label: 'Rượu vermouth',
    value: 'ruou-vermouth',
    icon: 'assets/icons/alcohol/ruou-vermouth.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu vermouth có thể bảo quản được trong 1 năm
  ),
  Category(
    label: 'Rượu vodka',
    value: 'ruou-vodka',
    icon: 'assets/icons/alcohol/ruou-vodka.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu vodka có thể bảo quản được trong 1 năm
  ),
  Category(
    label: 'Rượu whisky',
    value: 'ruou-whisky',
    icon: 'assets/icons/alcohol/ruou-whisky.png',
    type: 'alcohol',
    defaultDuration: 365, // Rượu whisky có thể bảo quản được trong 1 năm
  ),
  Category(
    label: 'Sangria',
    value: 'sangria',
    icon: 'assets/icons/alcohol/sangria.png',
    type: 'alcohol',
    defaultDuration: 7, // Sangria nên dùng trong 1 tuần
  ),
];

List<Category> sauces = [
  Category(
    label: 'Điệu salsa',
    value: 'dieu-salsa',
    icon: 'assets/icons/sauces/dieu-salsa.png',
    type: 'sauces',
    defaultDuration: 7, // Salsa tự làm nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của điệu salsa:\n\n'
        '1. Giàu chất chống oxy hóa: Salsa chứa nhiều rau củ tươi giúp cung cấp chất chống oxy hóa.\n\n'
        '2. Thấp calo: Salsa là lựa chọn tốt cho người muốn giảm cân.\n\n'
        '3. Cải thiện tiêu hóa: Chứa nhiều chất xơ giúp hỗ trợ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 36 kcal\n'
        '* Chất đạm: 1g\n'
        '* Chất béo: 0.2g\n'
        '* Carbohydrate: 7g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Đường',
    value: 'duong',
    icon: 'assets/icons/sauces/duong.png',
    type: 'sauces',
    defaultDuration: 365, // Đường không có hạn sử dụng
    note: 'Lợi ích sức khỏe của đường:\n\n'
        '1. Cung cấp năng lượng: Đường là nguồn năng lượng nhanh chóng cho cơ thể.\n\n'
        '2. Giúp tăng cường tinh thần: Đường có thể giúp cải thiện tâm trạng.\n\n'
        '3. Dễ bảo quản: Đường không có hạn sử dụng và dễ bảo quản.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 387 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 100g\n\n'
        'Lưu ý: Sử dụng đường vừa phải để tránh các vấn đề về sức khỏe. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Gói nước sốt',
    value: 'goi-nuoc-sot',
    icon: 'assets/icons/sauces/goi-nuoc-sot.png',
    type: 'sauces',
    defaultDuration: 180, // Gói nước sốt nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của gói nước sốt:\n\n'
        '1. Tiện lợi: Gói nước sốt dễ dàng sử dụng và bảo quản.\n\n'
        '2. Tăng hương vị món ăn: Gói nước sốt giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '3. Cung cấp năng lượng: Gói nước sốt cung cấp năng lượng cho cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 50-200 kcal (tùy loại nước sốt)\n'
        '* Chất đạm: 0-5g\n'
        '* Chất béo: 0-20g\n'
        '* Carbohydrate: 5-30g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Mật ong',
    value: 'mat-ong',
    icon: 'assets/icons/sauces/mat-ong.png',
    type: 'sauces',
    defaultDuration: 365, // Mật ong không có hạn sử dụng
    note: 'Lợi ích sức khỏe của mật ong:\n\n'
        '1. Chứa chất chống oxy hóa: Mật ong giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '2. Tăng cường miễn dịch: Mật ong có tính kháng khuẩn và kháng viêm.\n\n'
        '3. Cải thiện tiêu hóa: Mật ong giúp làm dịu dạ dày và hỗ trợ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 304 kcal\n'
        '* Chất đạm: 0.3g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 82g\n\n'
        'Lưu ý: Sử dụng mật ong vừa phải để tránh tăng cân. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Muối',
    value: 'muoi',
    icon: 'assets/icons/sauces/muoi.png',
    type: 'sauces',
    defaultDuration: 365, // Muối không có hạn sử dụng
    note: 'Lợi ích sức khỏe của muối:\n\n'
        '1. Cung cấp natri: Muối cung cấp natri cần thiết cho cân bằng điện giải trong cơ thể.\n\n'
        '2. Tăng cường hương vị: Muối giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '3. Bảo quản thực phẩm: Muối được sử dụng để bảo quản thực phẩm lâu dài.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 0 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Natri: 38758mg\n\n'
        'Lưu ý: Sử dụng muối vừa phải để tránh các vấn đề về huyết áp. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Mứt',
    value: 'mut',
    icon: 'assets/icons/sauces/mut.png',
    type: 'sauces',
    defaultDuration: 180, // Mứt nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của mứt:\n\n'
        '1. Cung cấp năng lượng: Mứt chứa đường cung cấp năng lượng nhanh chóng.\n\n'
        '2. Giàu chất xơ: Mứt chứa chất xơ giúp cải thiện tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Mứt có hương vị ngọt ngào và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 250 kcal\n'
        '* Chất đạm: 0.5g\n'
        '* Chất béo: 0.1g\n'
        '* Carbohydrate: 65g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Mù tạt vàng',
    value: 'mu-tat-vang',
    icon: 'assets/icons/sauces/mu-tat-vang.png',
    type: 'sauces',
    defaultDuration: 180, // Mù tạt vàng nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của mù tạt vàng:\n\n'
        '1. Chống viêm: Mù tạt vàng chứa chất chống viêm giúp giảm đau.\n\n'
        '2. Kích thích tiêu hóa: Mù tạt vàng giúp kích thích tiêu hóa và tăng cường trao đổi chất.\n\n'
        '3. Thấp calo: Mù tạt vàng là lựa chọn tốt cho người muốn giảm cân.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 66 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 4g\n'
        '* Carbohydrate: 7g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Mù tạt xanh',
    value: 'mu-tat-xanh',
    icon: 'assets/icons/sauces/mu-tat-xanh.png',
    type: 'sauces',
    defaultDuration: 180, // Mù tạt xanh nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của mù tạt xanh:\n\n'
        '1. Chống viêm: Mù tạt xanh chứa chất chống viêm giúp giảm đau.\n\n'
        '2. Kích thích tiêu hóa: Mù tạt xanh giúp kích thích tiêu hóa và tăng cường trao đổi chất.\n\n'
        '3. Thấp calo: Mù tạt xanh là lựa chọn tốt cho người muốn giảm cân.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 60 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 2g\n'
        '* Carbohydrate: 8g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Mứt sô cô la',
    value: 'mut-so-co-la',
    icon: 'assets/icons/sauces/mut-so-co-la.png',
    type: 'sauces',
    defaultDuration: 180, // Mứt sô cô la nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của mứt sô cô la:\n\n'
        '1. Cung cấp năng lượng: Mứt sô cô la chứa đường và sô cô la cung cấp năng lượng nhanh chóng.\n\n'
        '2. Giàu chất chống oxy hóa: Sô cô la chứa nhiều chất chống oxy hóa tốt cho sức khỏe.\n\n'
        '3. Thưởng thức hương vị: Mứt sô cô la có hương vị ngọt ngào và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 350 kcal\n'
        '* Chất đạm: 2g\n'
        '* Chất béo: 10g\n'
        '* Carbohydrate: 60g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Nước chanh',
    value: 'nuoc-chanh',
    icon: 'assets/icons/sauces/nuoc-chanh.png',
    type: 'sauces',
    defaultDuration: 30, // Nước chanh nên dùng trong 1 tháng
    note: 'Lợi ích sức khỏe của nước chanh:\n\n'
        '1. Giàu vitamin C: Nước chanh cung cấp lượng vitamin C dồi dào, hỗ trợ hệ miễn dịch.\n\n'
        '2. Thải độc cơ thể: Nước chanh giúp thải độc và cải thiện hệ tiêu hóa.\n\n'
        '3. Hỗ trợ giảm cân: Nước chanh ít calo và có thể giúp giảm cảm giác thèm ăn.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 29 kcal\n'
        '* Chất đạm: 0.2g\n'
        '* Chất béo: 0.1g\n'
        '* Carbohydrate: 9g\n'
        '* Vitamin C: 38mg\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tháng.\n\n',
  ),
  Category(
    label: 'Nước sốt BBQ',
    value: 'nuoc-sot-bbq',
    icon: 'assets/icons/sauces/nuoc-sot-bbq.png',
    type: 'sauces',
    defaultDuration: 180, // Nước sốt BBQ nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của nước sốt BBQ:\n\n'
        '1. Tăng hương vị món ăn: Nước sốt BBQ giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '2. Chứa chất chống oxy hóa: Một số thành phần trong nước sốt BBQ có chất chống oxy hóa.\n\n'
        '3. Cung cấp năng lượng: Nước sốt BBQ cung cấp năng lượng cho cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 150 kcal\n'
        '* Chất đạm: 0.5g\n'
        '* Chất béo: 0.2g\n'
        '* Carbohydrate: 35g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Nước sốt cay',
    value: 'nuoc-sot-cay',
    icon: 'assets/icons/sauces/nuoc-sot-cay.png',
    type: 'sauces',
    defaultDuration: 180, // Nước sốt cay nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của nước sốt cay:\n\n'
        '1. Kích thích tiêu hóa: Nước sốt cay giúp kích thích tiêu hóa và tăng cường trao đổi chất.\n\n'
        '2. Chống viêm: Ớt chứa chất chống viêm giúp giảm đau.\n\n'
        '3. Thưởng thức hương vị: Nước sốt cay giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 45 kcal\n'
        '* Chất đạm: 1g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 9g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Nước sốt pesto',
    value: 'nuoc-sot-pesto',
    icon: 'assets/icons/sauces/nuoc-sot-pesto.png',
    type: 'sauces',
    defaultDuration: 7, // Nước sốt pesto tự làm nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của nước sốt pesto:\n\n'
        '1. Chứa chất chống oxy hóa: Pesto chứa các thành phần như húng quế và tỏi có chất chống oxy hóa.\n\n'
        '2. Giàu chất béo tốt: Pesto chứa dầu ô liu cung cấp chất béo không bão hòa có lợi cho tim mạch.\n\n'
        '3. Tăng hương vị món ăn: Pesto giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 300 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 30g\n'
        '* Carbohydrate: 4g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Nước tương',
    value: 'nuoc-tuong',
    icon: 'assets/icons/sauces/nuoc-tuong.png',
    type: 'sauces',
    defaultDuration: 365, // Nước tương có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của nước tương:\n\n'
        '1. Cung cấp protein: Nước tương chứa một lượng nhỏ protein thực vật.\n\n'
        '2. Tăng hương vị món ăn: Nước tương giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '3. Thấp calo: Nước tương là lựa chọn tốt cho người muốn giảm cân.\n\n'
        'Thông tin dinh dưỡng (per 100ml):\n\n'
        '* Calo: 53 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 6g\n'
        '* Natri: 5600mg\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Nước xốt mè rang',
    value: 'nuoc-xot-me-rang',
    icon: 'assets/icons/sauces/nuoc-xot-me-rang.png',
    type: 'sauces',
    defaultDuration: 180, // Nước xốt mè rang nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của nước xốt mè rang:\n\n'
        '1. Giàu chất béo tốt: Nước xốt mè rang chứa dầu mè cung cấp chất béo không bão hòa có lợi cho tim mạch.\n\n'
        '2. Chống viêm: Mè rang chứa chất chống viêm giúp giảm đau.\n\n'
        '3. Tăng hương vị món ăn: Nước xốt mè rang giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 250 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 22g\n'
        '* Carbohydrate: 10g\n'
        '* Chất xơ: 5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Siro',
    value: 'siro',
    icon: 'assets/icons/sauces/siro.png',
    type: 'sauces',
    defaultDuration: 365, // Siro có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của siro:\n\n'
        '1. Cung cấp năng lượng: Siro chứa đường cung cấp năng lượng nhanh chóng.\n\n'
        '2. Thưởng thức hương vị: Siro có hương vị ngọt ngào và thơm ngon.\n\n'
        '3. Tiện lợi: Siro dễ dàng sử dụng và bảo quản.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 250-300 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 60-75g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Siro agave',
    value: 'siro-agave',
    icon: 'assets/icons/sauces/siro-agave.png',
    type: 'sauces',
    defaultDuration: 365, // Siro agave có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của siro agave:\n\n'
        '1. Chỉ số đường huyết thấp: Siro agave có chỉ số đường huyết thấp hơn so với đường thông thường.\n\n'
        '2. Cung cấp năng lượng: Siro agave chứa đường cung cấp năng lượng nhanh chóng.\n\n'
        '3. Thưởng thức hương vị: Siro agave có hương vị ngọt ngào và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 310 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 76g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Siro bắp',
    value: 'siro-bap',
    icon: 'assets/icons/sauces/siro-bap.png',
    type: 'sauces',
    defaultDuration: 365, // Siro bắp có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của siro bắp:\n\n'
        '1. Cung cấp năng lượng: Siro bắp chứa đường cung cấp năng lượng nhanh chóng.\n\n'
        '2. Tiện lợi: Siro bắp dễ dàng sử dụng và bảo quản.\n\n'
        '3. Thưởng thức hương vị: Siro bắp có hương vị ngọt ngào và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 286 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 77g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Siro phong',
    value: 'siro-phong',
    icon: 'assets/icons/sauces/siro-phong.png',
    type: 'sauces',
    defaultDuration: 365, // Siro phong có thể bảo quản được trong 1 năm
    note: 'Lợi ích sức khỏe của siro phong:\n\n'
        '1. Chứa chất chống oxy hóa: Siro phong chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Cung cấp năng lượng: Siro phong chứa đường cung cấp năng lượng nhanh chóng.\n\n'
        '3. Thưởng thức hương vị: Siro phong có hương vị ngọt ngào và thơm ngon.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 260 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 68g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 năm.\n\n',
  ),
  Category(
    label: 'Sốt bít tết',
    value: 'sot-bit-tet',
    icon: 'assets/icons/sauces/sot-bit-tet.png',
    type: 'sauces',
    defaultDuration: 180, // Sốt bít tết nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của sốt bít tết:\n\n'
        '1. Tăng hương vị món ăn: Sốt bít tết giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '2. Chứa chất chống oxy hóa: Một số thành phần trong sốt bít tết có chất chống oxy hóa.\n\n'
        '3. Cung cấp năng lượng: Sốt bít tết cung cấp năng lượng cho cơ thể.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 150 kcal\n'
        '* Chất đạm: 1g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 35g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Sốt hàu',
    value: 'sot-hau',
    icon: 'assets/icons/sauces/sot-hau.png',
    type: 'sauces',
    defaultDuration: 180, // Sốt hàu nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của sốt hàu:\n\n'
        '1. Cung cấp protein: Sốt hàu chứa một lượng nhỏ protein từ hàu.\n\n'
        '2. Tăng hương vị món ăn: Sốt hàu giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '3. Thấp calo: Sốt hàu là lựa chọn tốt cho người muốn giảm cân.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 60 kcal\n'
        '* Chất đạm: 2g\n'
        '* Chất béo: 0.1g\n'
        '* Carbohydrate: 14g\n'
        '* Natri: 2600mg\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Sốt mayonaise',
    value: 'sot-mayonaise',
    icon: 'assets/icons/sauces/sot-mayonaise.png',
    type: 'sauces',
    defaultDuration: 180, // Sốt mayonaise nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của sốt mayonaise:\n\n'
        '1. Cung cấp chất béo: Sốt mayonaise chứa chất béo cần thiết cho cơ thể.\n\n'
        '2. Tăng hương vị món ăn: Sốt mayonaise giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '3. Giàu calo: Sốt mayonaise cung cấp năng lượng nhanh chóng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 680 kcal\n'
        '* Chất đạm: 1g\n'
        '* Chất béo: 75g\n'
        '* Carbohydrate: 2g\n'
        '* Natri: 635mg\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Sốt táo',
    value: 'sot-tao',
    icon: 'assets/icons/sauces/sot-tao.png',
    type: 'sauces',
    defaultDuration: 30, // Sốt táo nên dùng trong 1 tháng
    note: 'Lợi ích sức khỏe của sốt táo:\n\n'
        '1. Giàu chất xơ: Sốt táo chứa chất xơ giúp cải thiện tiêu hóa.\n\n'
        '2. Giàu vitamin C: Sốt táo cung cấp lượng vitamin C dồi dào, hỗ trợ hệ miễn dịch.\n\n'
        '3. Thấp calo: Sốt táo là lựa chọn tốt cho người muốn giảm cân.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 40 kcal\n'
        '* Chất đạm: 0.2g\n'
        '* Chất béo: 0.1g\n'
        '* Carbohydrate: 10g\n'
        '* Chất xơ: 1.5g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tháng.\n\n',
  ),
  Category(
    label: 'Tương cà',
    value: 'tuong-ca',
    icon: 'assets/icons/sauces/tuong-ca.png',
    type: 'sauces',
    defaultDuration: 180, // Tương cà nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của tương cà:\n\n'
        '1. Giàu lycopene: Tương cà chứa lycopene, chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Tăng hương vị món ăn: Tương cà giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '3. Thấp calo: Tương cà là lựa chọn tốt cho người muốn giảm cân.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 100 kcal\n'
        '* Chất đạm: 1.5g\n'
        '* Chất béo: 0.2g\n'
        '* Carbohydrate: 25g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
  Category(
    label: 'Tương ớt',
    value: 'tuong-ot',
    icon: 'assets/icons/sauces/tuong-ot.png',
    type: 'sauces',
    defaultDuration: 180, // Tương ớt nên dùng trong 6 tháng
    note: 'Lợi ích sức khỏe của tương ớt:\n\n'
        '1. Chứa capsaicin: Tương ớt chứa capsaicin, chất giúp giảm đau và chống viêm.\n\n'
        '2. Tăng hương vị món ăn: Tương ớt giúp món ăn thêm đậm đà và ngon miệng.\n\n'
        '3. Kích thích tiêu hóa: Tương ớt giúp kích thích tiêu hóa và tăng cường trao đổi chất.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 50 kcal\n'
        '* Chất đạm: 1g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 10g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 6 tháng.\n\n',
  ),
];

List<Category> spices = [
  Category(
    label: 'Bột ớt',
    value: 'bot-ot',
    icon: 'assets/icons/spices/bot-ot.png',
    type: 'spices',
    defaultDuration: 365, // Bột ớt không có hạn sử dụng
    note: 'Lợi ích sức khỏe của bột ớt:\n\n'
        '1. Chứa capsaicin: Bột ớt chứa capsaicin, chất giúp giảm đau và chống viêm.\n\n'
        '2. Tăng cường tiêu hóa: Bột ớt giúp kích thích tiêu hóa và tăng cường trao đổi chất.\n\n'
        '3. Giàu vitamin C: Bột ớt cung cấp lượng vitamin C dồi dào, hỗ trợ hệ miễn dịch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 282 kcal\n'
        '* Chất đạm: 12g\n'
        '* Chất béo: 15g\n'
        '* Carbohydrate: 54g\n'
        '* Chất xơ: 30g\n\n'
        'Lưu ý: Sử dụng bột ớt vừa phải để tránh các vấn đề về tiêu hóa. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bột cà ri',
    value: 'bot-ca-ri',
    icon: 'assets/icons/spices/bot-ca-ri.png',
    type: 'spices',
    defaultDuration: 365, // Bột cà ri không có hạn sử dụng
    note: 'Lợi ích sức khỏe của bột cà ri:\n\n'
        '1. Chứa chất chống viêm: Bột cà ri chứa nghệ và gừng có tác dụng chống viêm.\n\n'
        '2. Giàu chất chống oxy hóa: Bột cà ri giúp bảo vệ tế bào khỏi tổn thương.\n\n'
        '3. Tăng cường tiêu hóa: Bột cà ri giúp kích thích tiêu hóa và cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 325 kcal\n'
        '* Chất đạm: 12g\n'
        '* Chất béo: 14g\n'
        '* Carbohydrate: 58g\n'
        '* Chất xơ: 53g\n\n'
        'Lưu ý: Sử dụng bột cà ri vừa phải để tránh các vấn đề về tiêu hóa. Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Cây bạc hà',
    value: 'cay-bac-ha',
    icon: 'assets/icons/spices/cay-bac-ha.png',
    type: 'spices',
    defaultDuration: 7, // Cây bạc hà nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của cây bạc hà:\n\n'
        '1. Cải thiện tiêu hóa: Cây bạc hà giúp giảm đầy hơi và khó tiêu.\n\n'
        '2. Giảm căng thẳng: Hương thơm của bạc hà giúp giảm căng thẳng và mệt mỏi.\n\n'
        '3. Làm dịu cổ họng: Cây bạc hà có thể giúp làm dịu cổ họng đau rát.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 70 kcal\n'
        '* Chất đạm: 3.8g\n'
        '* Chất béo: 0.9g\n'
        '* Carbohydrate: 14g\n'
        '* Chất xơ: 8g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Cây bách hoa',
    value: 'cay-bach-hoa',
    icon: 'assets/icons/spices/cay-bach-hoa.png',
    type: 'spices',
    defaultDuration: 7, // Cây bách hoa nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của cây bách hoa:\n\n'
        '1. Chứa chất chống viêm: Cây bách hoa giúp giảm viêm và đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Cây bách hoa có tác dụng kích thích tiêu hóa.\n\n'
        '3. Tăng cường hệ miễn dịch: Cây bách hoa chứa nhiều vitamin và khoáng chất tốt cho sức khỏe.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 50 kcal\n'
        '* Chất đạm: 2g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 10g\n'
        '* Chất xơ: 5g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Cây hồi',
    value: 'cay-hoi',
    icon: 'assets/icons/spices/cay-hoi.png',
    type: 'spices',
    defaultDuration: 365, // Cây hồi không có hạn sử dụng
    note: 'Lợi ích sức khỏe của cây hồi:\n\n'
        '1. Chứa chất chống viêm: Cây hồi giúp giảm viêm và đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Cây hồi có tác dụng kích thích tiêu hóa.\n\n'
        '3. Tăng cường hệ miễn dịch: Cây hồi chứa nhiều vitamin và khoáng chất tốt cho sức khỏe.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 337 kcal\n'
        '* Chất đạm: 18g\n'
        '* Chất béo: 16g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 15g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Cây mê điệt',
    value: 'cay-me-diet',
    icon: 'assets/icons/spices/cay-me-diet.png',
    type: 'spices',
    defaultDuration: 365, // Cây mê điệt không có hạn sử dụng
    note: 'Lợi ích sức khỏe của cây mê điệt:\n\n'
        '1. Chống oxy hóa: Cây mê điệt chứa nhiều chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '2. Chứa chất chống viêm: Cây mê điệt giúp giảm viêm và đau.\n\n'
        '3. Tăng cường hệ miễn dịch: Cây mê điệt chứa nhiều vitamin và khoáng chất tốt cho sức khỏe.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 276 kcal\n'
        '* Chất đạm: 12g\n'
        '* Chất béo: 14g\n'
        '* Carbohydrate: 36g\n'
        '* Chất xơ: 25g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đinh hương',
    value: 'dinh-huong',
    icon: 'assets/icons/spices/dinh-huong.png',
    type: 'spices',
    defaultDuration: 365, // Đinh hương không có hạn sử dụng
    note: 'Lợi ích sức khỏe của đinh hương:\n\n'
        '1. Chống viêm: Đinh hương chứa chất chống viêm giúp giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Đinh hương có tác dụng kích thích tiêu hóa.\n\n'
        '3. Chống oxy hóa: Đinh hương chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 274 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 13g\n'
        '* Carbohydrate: 65g\n'
        '* Chất xơ: 33g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Gừng',
    value: 'gung',
    icon: 'assets/icons/spices/gung.png',
    type: 'spices',
    defaultDuration: 30, // Gừng nên dùng trong 1 tháng
    note: 'Lợi ích sức khỏe của gừng:\n\n'
        '1. Chống viêm: Gừng có tác dụng chống viêm và giảm đau.\n\n'
        '2. Cải thiện tiêu hóa: Gừng giúp kích thích tiêu hóa và giảm buồn nôn.\n\n'
        '3. Tăng cường miễn dịch: Gừng chứa nhiều chất chống oxy hóa giúp tăng cường hệ miễn dịch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 80 kcal\n'
        '* Chất đạm: 1.8g\n'
        '* Chất béo: 0.8g\n'
        '* Carbohydrate: 18g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát. Sử dụng trong vòng 1 tháng.\n\n',
  ),
  Category(
    label: 'Hành khô',
    value: 'hanh-kho',
    icon: 'assets/icons/spices/hanh-kho.png',
    type: 'spices',
    defaultDuration: 365, // Hành khô không có hạn sử dụng
    note: 'Lợi ích sức khỏe của hành khô:\n\n'
        '1. Chống viêm: Hành khô chứa chất chống viêm giúp giảm đau.\n\n'
        '2. Cải thiện tiêu hóa: Hành khô giúp kích thích tiêu hóa.\n\n'
        '3. Tăng cường miễn dịch: Hành khô chứa nhiều chất chống oxy hóa giúp tăng cường hệ miễn dịch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 350 kcal\n'
        '* Chất đạm: 10g\n'
        '* Chất béo: 1g\n'
        '* Carbohydrate: 80g\n'
        '* Chất xơ: 15g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hồ tiêu',
    value: 'ho-tieu',
    icon: 'assets/icons/spices/ho-tieu.png',
    type: 'spices',
    defaultDuration: 365, // Hồ tiêu không có hạn sử dụng
    note: 'Lợi ích sức khỏe của hồ tiêu:\n\n'
        '1. Chống viêm: Hồ tiêu chứa chất chống viêm giúp giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Hồ tiêu giúp kích thích tiêu hóa và tăng cường trao đổi chất.\n\n'
        '3. Chống oxy hóa: Hồ tiêu chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 255 kcal\n'
        '* Chất đạm: 11g\n'
        '* Chất béo: 3g\n'
        '* Carbohydrate: 64g\n'
        '* Chất xơ: 25g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Húng quế',
    value: 'hung-que',
    icon: 'assets/icons/spices/hung-que.png',
    type: 'spices',
    defaultDuration: 365, // Húng quế không có hạn sử dụng
    note: 'Lợi ích sức khỏe của húng quế:\n\n'
        '1. Chống viêm: Húng quế chứa chất chống viêm giúp giảm đau.\n\n'
        '2. Chống oxy hóa: Húng quế chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Cải thiện tiêu hóa: Húng quế giúp kích thích tiêu hóa và cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 22 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 0.6g\n'
        '* Carbohydrate: 2.7g\n'
        '* Chất xơ: 1.6g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Lá nguyệt quế',
    value: 'la-nguyet-que',
    icon: 'assets/icons/spices/la-nguyet-que.png',
    type: 'spices',
    defaultDuration: 365, // Lá nguyệt quế không có hạn sử dụng
    note: 'Lợi ích sức khỏe của lá nguyệt quế:\n\n'
        '1. Chống viêm: Lá nguyệt quế chứa chất chống viêm giúp giảm đau.\n\n'
        '2. Chống oxy hóa: Lá nguyệt quế chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Hỗ trợ tiêu hóa: Lá nguyệt quế giúp kích thích tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 313 kcal\n'
        '* Chất đạm: 7.6g\n'
        '* Chất béo: 8.4g\n'
        '* Carbohydrate: 75g\n'
        '* Chất xơ: 26g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Mùi tây',
    value: 'mui-tay',
    icon: 'assets/icons/spices/mui-tay.png',
    type: 'spices',
    defaultDuration: 365, // Mùi tây không có hạn sử dụng
    note: 'Lợi ích sức khỏe của mùi tây:\n\n'
        '1. Chứa chất chống viêm: Mùi tây giúp giảm viêm và đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Mùi tây có tác dụng kích thích tiêu hóa.\n\n'
        '3. Chống oxy hóa: Mùi tây chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 36 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 0.8g\n'
        '* Carbohydrate: 6g\n'
        '* Chất xơ: 3.3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Nghệ',
    value: 'nghe',
    icon: 'assets/icons/spices/nghe.png',
    type: 'spices',
    defaultDuration: 365, // Nghệ không có hạn sử dụng
    note: 'Lợi ích sức khỏe của nghệ:\n\n'
        '1. Chống viêm: Nghệ có tác dụng chống viêm và giảm đau.\n\n'
        '2. Chống oxy hóa: Nghệ chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Cải thiện tiêu hóa: Nghệ giúp kích thích tiêu hóa và cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 354 kcal\n'
        '* Chất đạm: 7.8g\n'
        '* Chất béo: 9.9g\n'
        '* Carbohydrate: 65g\n'
        '* Chất xơ: 21g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Nghệ tây',
    value: 'nghe-tay',
    icon: 'assets/icons/spices/nghe-tay.png',
    type: 'spices',
    defaultDuration: 365, // Nghệ tây không có hạn sử dụng
    note: 'Lợi ích sức khỏe của nghệ tây:\n\n'
        '1. Chống viêm: Nghệ tây có tác dụng chống viêm và giảm đau.\n\n'
        '2. Chống oxy hóa: Nghệ tây chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Cải thiện tâm trạng: Nghệ tây giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 310 kcal\n'
        '* Chất đạm: 11g\n'
        '* Chất béo: 6g\n'
        '* Carbohydrate: 65g\n'
        '* Chất xơ: 3.9g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Nhục đậu khấu',
    value: 'nhuc-dau-khau',
    icon: 'assets/icons/spices/nhuc-dau-khau.png',
    type: 'spices',
    defaultDuration: 365, // Nhục đậu khấu không có hạn sử dụng
    note: 'Lợi ích sức khỏe của nhục đậu khấu:\n\n'
        '1. Chống viêm: Nhục đậu khấu có tác dụng chống viêm và giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Nhục đậu khấu giúp kích thích tiêu hóa và cải thiện hệ tiêu hóa.\n\n'
        '3. Giảm căng thẳng: Nhục đậu khấu giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 525 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 36g\n'
        '* Carbohydrate: 49g\n'
        '* Chất xơ: 20g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Quả me',
    value: 'qua-me',
    icon: 'assets/icons/spices/qua-me.png',
    type: 'spices',
    defaultDuration: 365, // Quả me không có hạn sử dụng
    note: 'Lợi ích sức khỏe của quả me:\n\n'
        '1. Giàu chất xơ: Quả me chứa chất xơ giúp cải thiện tiêu hóa.\n\n'
        '2. Giàu vitamin C: Quả me cung cấp lượng vitamin C dồi dào, hỗ trợ hệ miễn dịch.\n\n'
        '3. Hỗ trợ giảm cân: Quả me ít calo và có thể giúp giảm cảm giác thèm ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 239 kcal\n'
        '* Chất đạm: 2.8g\n'
        '* Chất béo: 0.6g\n'
        '* Carbohydrate: 62g\n'
        '* Chất xơ: 5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Quế',
    value: 'que',
    icon: 'assets/icons/spices/que.png',
    type: 'spices',
    defaultDuration: 365, // Quế không có hạn sử dụng
    note: 'Lợi ích sức khỏe của quế:\n\n'
        '1. Chống viêm: Quế có tác dụng chống viêm và giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Quế giúp kích thích tiêu hóa và cải thiện hệ tiêu hóa.\n\n'
        '3. Chống oxy hóa: Quế chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 247 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 1.2g\n'
        '* Carbohydrate: 81g\n'
        '* Chất xơ: 53g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Rau kinh giới',
    value: 'rau-kinh-gioi',
    icon: 'assets/icons/spices/rau-kinh-gioi.png',
    type: 'spices',
    defaultDuration: 7, // Rau kinh giới nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của rau kinh giới:\n\n'
        '1. Chống viêm: Rau kinh giới có tác dụng chống viêm và giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Rau kinh giới giúp kích thích tiêu hóa.\n\n'
        '3. Giảm căng thẳng: Rau kinh giới giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 44 kcal\n'
        '* Chất đạm: 3.7g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 7g\n'
        '* Chất xơ: 2.6g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Rau mùi',
    value: 'rau-mui',
    icon: 'assets/icons/spices/rau-mui.png',
    type: 'spices',
    defaultDuration: 7, // Rau mùi nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của rau mùi:\n\n'
        '1. Chống viêm: Rau mùi có tác dụng chống viêm và giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Rau mùi giúp kích thích tiêu hóa.\n\n'
        '3. Giảm căng thẳng: Rau mùi giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 23 kcal\n'
        '* Chất đạm: 2.1g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 3.7g\n'
        '* Chất xơ: 2.8g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Rau răm',
    value: 'rau-ram',
    icon: 'assets/icons/spices/rau-ram.png',
    type: 'spices',
    defaultDuration: 7, // Rau răm nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của rau răm:\n\n'
        '1. Chống viêm: Rau răm có tác dụng chống viêm và giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Rau răm giúp kích thích tiêu hóa.\n\n'
        '3. Giảm căng thẳng: Rau răm giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 24 kcal\n'
        '* Chất đạm: 2.6g\n'
        '* Chất béo: 0.4g\n'
        '* Carbohydrate: 2.6g\n'
        '* Chất xơ: 1.8g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Rau thì là',
    value: 'rau-thi-la',
    icon: 'assets/icons/spices/rau-thi-la.png',
    type: 'spices',
    defaultDuration: 7, // Rau thì là nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của rau thì là:\n\n'
        '1. Chống viêm: Rau thì là có tác dụng chống viêm và giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Rau thì là giúp kích thích tiêu hóa.\n\n'
        '3. Giảm căng thẳng: Rau thì là giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 43 kcal\n'
        '* Chất đạm: 3.4g\n'
        '* Chất béo: 0.9g\n'
        '* Carbohydrate: 7g\n'
        '* Chất xơ: 2.8g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Rau thơm',
    value: 'rau-thom',
    icon: 'assets/icons/spices/rau-thom.png',
    type: 'spices',
    defaultDuration: 7, // Rau thơm nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của rau thơm:\n\n'
        '1. Chống viêm: Rau thơm có tác dụng chống viêm và giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Rau thơm giúp kích thích tiêu hóa.\n\n'
        '3. Giảm căng thẳng: Rau thơm giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 48 kcal\n'
        '* Chất đạm: 3.8g\n'
        '* Chất béo: 0.7g\n'
        '* Carbohydrate: 8g\n'
        '* Chất xơ: 3.1g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Thì là',
    value: 'thi-la',
    icon: 'assets/icons/spices/thi-la.png',
    type: 'spices',
    defaultDuration: 7, // Thì là nên dùng trong 1 tuần
    note: 'Lợi ích sức khỏe của thì là:\n\n'
        '1. Chống viêm: Thì là có tác dụng chống viêm và giảm đau.\n\n'
        '2. Hỗ trợ tiêu hóa: Thì là giúp kích thích tiêu hóa.\n\n'
        '3. Giảm căng thẳng: Thì là giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 44 kcal\n'
        '* Chất đạm: 3.2g\n'
        '* Chất béo: 0.6g\n'
        '* Carbohydrate: 7g\n'
        '* Chất xơ: 2.9g\n\n'
        'Lưu ý: Bảo quản trong tủ lạnh và dùng trong vòng 1 tuần.\n\n',
  ),
  Category(
    label: 'Tỏi',
    value: 'toi',
    icon: 'assets/icons/spices/toi.png',
    type: 'spices',
    defaultDuration: 365, // Tỏi không có hạn sử dụng
    note: 'Lợi ích sức khỏe của tỏi:\n\n'
        '1. Chống viêm: Tỏi có tác dụng chống viêm và giảm đau.\n\n'
        '2. Tăng cường miễn dịch: Tỏi chứa nhiều chất chống oxy hóa giúp tăng cường hệ miễn dịch.\n\n'
        '3. Hỗ trợ tiêu hóa: Tỏi giúp kích thích tiêu hóa và cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 149 kcal\n'
        '* Chất đạm: 6.4g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 33g\n'
        '* Chất xơ: 2.1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Truffle',
    value: 'truffle',
    icon: 'assets/icons/spices/truffle.png',
    type: 'spices',
    defaultDuration: 365, // Truffle không có hạn sử dụng
    note: 'Lợi ích sức khỏe của truffle:\n\n'
        '1. Chứa chất chống viêm: Truffle có tác dụng chống viêm và giảm đau.\n\n'
        '2. Chống oxy hóa: Truffle chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Hỗ trợ tiêu hóa: Truffle giúp kích thích tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 284 kcal\n'
        '* Chất đạm: 9.1g\n'
        '* Chất béo: 0.7g\n'
        '* Carbohydrate: 73g\n'
        '* Chất xơ: 10g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Vanilla',
    value: 'vanilla',
    icon: 'assets/icons/spices/vanilla.png',
    type: 'spices',
    defaultDuration: 365, // Vanilla không có hạn sử dụng
    note: 'Lợi ích sức khỏe của vanilla:\n\n'
        '1. Chống viêm: Vanilla có tác dụng chống viêm và giảm đau.\n\n'
        '2. Chống oxy hóa: Vanilla chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Cải thiện tâm trạng: Vanilla giúp giảm căng thẳng và cải thiện tâm trạng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 288 kcal\n'
        '* Chất đạm: 0.1g\n'
        '* Chất béo: 0.1g\n'
        '* Carbohydrate: 12.7g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Xạ hương',
    value: 'xa-huong',
    icon: 'assets/icons/spices/xa-huong.png',
    type: 'spices',
    defaultDuration: 365, // Xạ hương không có hạn sử dụng
    note: 'Lợi ích sức khỏe của xạ hương:\n\n'
        '1. Chống viêm: Xạ hương có tác dụng chống viêm và giảm đau.\n\n'
        '2. Chống oxy hóa: Xạ hương chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Cải thiện tiêu hóa: Xạ hương giúp kích thích tiêu hóa và cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 276 kcal\n'
        '* Chất đạm: 9g\n'
        '* Chất béo: 7g\n'
        '* Carbohydrate: 63g\n'
        '* Chất xơ: 37g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Xô thơm',
    value: 'xo-thom',
    icon: 'assets/icons/spices/xo-thom.png',
    type: 'spices',
    defaultDuration: 365, // Xô thơm không có hạn sử dụng
    note: 'Lợi ích sức khỏe của xô thơm:\n\n'
        '1. Chống viêm: Xô thơm có tác dụng chống viêm và giảm đau.\n\n'
        '2. Chống oxy hóa: Xô thơm chứa chất chống oxy hóa giúp bảo vệ tế bào.\n\n'
        '3. Cải thiện tiêu hóa: Xô thơm giúp kích thích tiêu hóa và cải thiện hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 315 kcal\n'
        '* Chất đạm: 10.6g\n'
        '* Chất béo: 12.8g\n'
        '* Carbohydrate: 60.7g\n'
        '* Chất xơ: 40.3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
];

List<Category> bread = [
  Category(
    label: 'Bánh con sò',
    value: 'banh-con-so',
    icon: 'assets/icons/bread/banh-con-so.png',
    type: 'bread',
    defaultDuration: 1, // Bánh con sò không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh con sò:\n\n'
        '1. Cung cấp năng lượng: Bánh con sò chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh con sò chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh con sò có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 350 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 18g\n'
        '* Carbohydrate: 45g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh crepe',
    value: 'banh-crepe',
    icon: 'assets/icons/bread/banh-crepe.png',
    type: 'bread',
    defaultDuration: 1, // Bánh crepe không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh crepe:\n\n'
        '1. Cung cấp năng lượng: Bánh crepe chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh crepe chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh crepe có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 200 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 10g\n'
        '* Carbohydrate: 25g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh focaccia',
    value: 'banh-focaccia',
    icon: 'assets/icons/bread/banh-focaccia.png',
    type: 'bread',
    defaultDuration: 1, // Bánh focaccia không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh focaccia:\n\n'
        '1. Cung cấp năng lượng: Bánh focaccia chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh focaccia chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Giàu chất béo không bão hòa: Dầu ô liu trong bánh focaccia cung cấp chất béo tốt cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 250 kcal\n'
        '* Chất đạm: 7g\n'
        '* Chất béo: 10g\n'
        '* Carbohydrate: 35g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh kếp',
    value: 'banh-kep',
    icon: 'assets/icons/bread/banh-kep.png',
    type: 'bread',
    defaultDuration: 1, // Bánh kếp không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh kếp:\n\n'
        '1. Cung cấp năng lượng: Bánh kếp chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh kếp chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh kếp có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 220 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 12g\n'
        '* Carbohydrate: 25g\n'
        '* Chất xơ: 1.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh mì gối',
    value: 'banh-mi-goi',
    icon: 'assets/icons/bread/banh-mi-goi.png',
    type: 'bread',
    defaultDuration: 1, // Bánh mì gối không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh mì gối:\n\n'
        '1. Cung cấp năng lượng: Bánh mì gối chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh mì gối chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh mì gối có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 265 kcal\n'
        '* Chất đạm: 9g\n'
        '* Chất béo: 3.2g\n'
        '* Carbohydrate: 49g\n'
        '* Chất xơ: 2.7g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh mì hoa cúc',
    value: 'banh-mi-hoa-cuc',
    icon: 'assets/icons/bread/banh-mi-hoa-cuc.png',
    type: 'bread',
    defaultDuration: 1, // Bánh mì hoa cúc không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh mì hoa cúc:\n\n'
        '1. Cung cấp năng lượng: Bánh mì hoa cúc chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh mì hoa cúc chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh mì hoa cúc có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 290 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 9g\n'
        '* Carbohydrate: 43g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh mì ổ',
    value: 'banh-mi-o',
    icon: 'assets/icons/bread/banh-mi-o.png',
    type: 'bread',
    defaultDuration: 1, // Bánh mì ổ không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh mì ổ:\n\n'
        '1. Cung cấp năng lượng: Bánh mì ổ chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh mì ổ chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh mì ổ có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 250 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 2.5g\n'
        '* Carbohydrate: 48g\n'
        '* Chất xơ: 2.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh mì Pháp',
    value: 'banh-mi-phap',
    icon: 'assets/icons/bread/banh-mi-phap.png',
    type: 'bread',
    defaultDuration: 1, // Bánh mì Pháp không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh mì Pháp:\n\n'
        '1. Cung cấp năng lượng: Bánh mì Pháp chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh mì Pháp chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh mì Pháp có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 260 kcal\n'
        '* Chất đạm: 9g\n'
        '* Chất béo: 1.5g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh mì roti',
    value: 'banh-mi-roti',
    icon: 'assets/icons/bread/banh-mi-roti.png',
    type: 'bread',
    defaultDuration: 1, // Bánh mì roti không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh mì roti:\n\n'
        '1. Cung cấp năng lượng: Bánh mì roti chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh mì roti chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh mì roti có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 300 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 9g\n'
        '* Carbohydrate: 47g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh mì vòng',
    value: 'banh-mi-vong',
    icon: 'assets/icons/bread/banh-mi-vong.png',
    type: 'bread',
    defaultDuration: 1, // Bánh mì vòng không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh mì vòng:\n\n'
        '1. Cung cấp năng lượng: Bánh mì vòng chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh mì vòng chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh mì vòng có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 270 kcal\n'
        '* Chất đạm: 10g\n'
        '* Chất béo: 1.5g\n'
        '* Carbohydrate: 52g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh nướng',
    value: 'banh-nuong',
    icon: 'assets/icons/bread/banh-nuong.png',
    type: 'bread',
    defaultDuration: 1, // Bánh nướng không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh nướng:\n\n'
        '1. Cung cấp năng lượng: Bánh nướng chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh nướng chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh nướng có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 350 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 18g\n'
        '* Carbohydrate: 40g\n'
        '* Chất xơ: 1.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh nướng xốp',
    value: 'banh-nuong-xop',
    icon: 'assets/icons/bread/banh-nuong-xop.png',
    type: 'bread',
    defaultDuration: 1, // Bánh nướng xốp không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh nướng xốp:\n\n'
        '1. Cung cấp năng lượng: Bánh nướng xốp chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh nướng xốp chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh nướng xốp có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 290 kcal\n'
        '* Chất đạm: 7g\n'
        '* Chất béo: 12g\n'
        '* Carbohydrate: 38g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh quế',
    value: 'banh-que',
    icon: 'assets/icons/bread/banh-que.png',
    type: 'bread',
    defaultDuration: 1, // Bánh quế không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh quế:\n\n'
        '1. Cung cấp năng lượng: Bánh quế chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh quế chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh quế có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 320 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 15g\n'
        '* Carbohydrate: 38g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh quy que',
    value: 'banh-quy-que',
    icon: 'assets/icons/bread/banh-quy-que.png',
    type: 'bread',
    defaultDuration: 1, // Bánh quy que không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh quy que:\n\n'
        '1. Cung cấp năng lượng: Bánh quy que chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh quy que chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh quy que có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 380 kcal\n'
        '* Chất đạm: 9g\n'
        '* Chất béo: 14g\n'
        '* Carbohydrate: 55g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh quy xoắn',
    value: 'banh-quy-xoan',
    icon: 'assets/icons/bread/banh-quy-xoan.png',
    type: 'bread',
    defaultDuration: 1, // Bánh quy xoắn không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh quy xoắn:\n\n'
        '1. Cung cấp năng lượng: Bánh quy xoắn chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh quy xoắn chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh quy xoắn có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 400 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 20g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 1.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh scone',
    value: 'banh-scone',
    icon: 'assets/icons/bread/banh-scone.png',
    type: 'bread',
    defaultDuration: 1, // Bánh scone không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh scone:\n\n'
        '1. Cung cấp năng lượng: Bánh scone chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh scone chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh scone có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 330 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 14g\n'
        '* Carbohydrate: 45g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh sữa nhỏ',
    value: 'banh-sua-nho',
    icon: 'assets/icons/bread/banh-sua-nho.png',
    type: 'bread',
    defaultDuration: 1, // Bánh sữa nhỏ không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh sữa nhỏ:\n\n'
        '1. Cung cấp năng lượng: Bánh sữa nhỏ chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh sữa nhỏ chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh sữa nhỏ có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 310 kcal\n'
        '* Chất đạm: 7g\n'
        '* Chất béo: 10g\n'
        '* Carbohydrate: 45g\n'
        '* Chất xơ: 1.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh sừng bò',
    value: 'banh-sung-bo',
    icon: 'assets/icons/bread/banh-sung-bo.png',
    type: 'bread',
    defaultDuration: 1, // Bánh sừng bò không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh sừng bò:\n\n'
        '1. Cung cấp năng lượng: Bánh sừng bò chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Bánh sừng bò chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh sừng bò có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 406 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 21g\n'
        '* Carbohydrate: 45g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh vòng',
    value: 'banh-vong',
    icon: 'assets/icons/bread/banh-vong.png',
    type: 'bread',
    defaultDuration: 1, // Bánh vòng không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bánh vòng:\n\n'
        '1. Cung cấp năng lượng: Bánh vòng chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Một số loại bánh vòng chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bánh vòng có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 270 kcal\n'
        '* Chất đạm: 10g\n'
        '* Chất béo: 1.5g\n'
        '* Carbohydrate: 52g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bột chua',
    value: 'bot-chua',
    icon: 'assets/icons/bread/bot-chua.png',
    type: 'bread',
    defaultDuration: 1, // Bột chua không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của bột chua:\n\n'
        '1. Cung cấp năng lượng: Bột chua chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa men vi sinh: Bột chua chứa men vi sinh giúp cải thiện tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Bột chua có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 260 kcal\n'
        '* Chất đạm: 9g\n'
        '* Chất béo: 1g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Ciabatta',
    value: 'ciabatta',
    icon: 'assets/icons/bread/ciabatta.png',
    type: 'bread',
    defaultDuration: 1, // Ciabatta không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của ciabatta:\n\n'
        '1. Cung cấp năng lượng: Ciabatta chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Ciabatta chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Ciabatta có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 250 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 2.5g\n'
        '* Carbohydrate: 48g\n'
        '* Chất xơ: 2.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Dorayaki',
    value: 'dorayaki',
    icon: 'assets/icons/bread/dorayaki.png',
    type: 'bread',
    defaultDuration: 1, // Dorayaki không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của dorayaki:\n\n'
        '1. Cung cấp năng lượng: Dorayaki chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Dorayaki chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Dorayaki có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 280 kcal\n'
        '* Chất đạm: 7g\n'
        '* Chất béo: 7g\n'
        '* Carbohydrate: 48g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Quế cuộn',
    value: 'que-cuon',
    icon: 'assets/icons/bread/que-cuon.png',
    type: 'bread',
    defaultDuration: 1, // Quế cuộn không có hạn sử dụng cụ thể
    note: 'Lợi ích sức khỏe của quế cuộn:\n\n'
        '1. Cung cấp năng lượng: Quế cuộn chứa carbohydrate giúp cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chứa chất xơ: Quế cuộn chứa chất xơ, hỗ trợ tiêu hóa.\n\n'
        '3. Thưởng thức hương vị: Quế cuộn có hương vị thơm ngon, dễ ăn.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 340 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 14g\n'
        '* Carbohydrate: 46g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
];

List<Category> desserts = [
  Category(
    label: 'Baklava',
    value: 'baklava',
    icon: 'assets/icons/desserts/baklava.png',
    type: 'desserts',
    defaultDuration: 2, // Baklava: 2 ngày
    note: 'Lợi ích sức khỏe của Baklava:\n\n'
        '1. Nguồn năng lượng: Baklava chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chất béo tốt: Baklava làm từ hạt có chứa chất béo không bão hòa.\n\n'
        '3. Hương vị độc đáo: Baklava có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 540 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 29g\n'
        '* Carbohydrate: 68g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh Brownie',
    value: 'banh-brownie',
    icon: 'assets/icons/desserts/banh-brownie.png',
    type: 'desserts',
    defaultDuration: 3, // Bánh Brownie: 3 ngày
    note: 'Lợi ích sức khỏe của Bánh Brownie:\n\n'
        '1. Nguồn năng lượng: Brownie chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Chất béo: Brownie chứa chất béo cung cấp năng lượng.\n\n'
        '3. Hương vị thơm ngon: Brownie có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 466 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 24g\n'
        '* Carbohydrate: 58g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh cuộn',
    value: 'banh-cuon',
    icon: 'assets/icons/desserts/banh-cuon.png',
    type: 'desserts',
    defaultDuration: 2, // Bánh cuộn: 2 ngày
    note: 'Lợi ích sức khỏe của Bánh cuộn:\n\n'
        '1. Nguồn năng lượng: Bánh cuộn chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh cuộn có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 357 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 18g\n'
        '* Carbohydrate: 46g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh cupcake',
    value: 'banh-cupcake',
    icon: 'assets/icons/desserts/banh-cupcake.png',
    type: 'desserts',
    defaultDuration: 3, // Bánh cupcake: 3 ngày
    note: 'Lợi ích sức khỏe của Bánh cupcake:\n\n'
        '1. Nguồn năng lượng: Cupcake chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Cupcake có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 350 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 16g\n'
        '* Carbohydrate: 48g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh eclair',
    value: 'banh-eclair',
    icon: 'assets/icons/desserts/banh-eclair.png',
    type: 'desserts',
    defaultDuration: 2, // Bánh eclair: 2 ngày
    note: 'Lợi ích sức khỏe của Bánh eclair:\n\n'
        '1. Nguồn năng lượng: Eclair chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Eclair có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 380 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 20g\n'
        '* Carbohydrate: 45g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh gừng',
    value: 'banh-gung',
    icon: 'assets/icons/desserts/banh-gung.png',
    type: 'desserts',
    defaultDuration: 4, // Bánh gừng: 4 ngày
    note: 'Lợi ích sức khỏe của Bánh gừng:\n\n'
        '1. Tăng cường miễn dịch: Gừng có tác dụng kháng viêm và tăng cường hệ miễn dịch.\n\n'
        '2. Hương vị thơm ngon: Bánh gừng có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 320 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 10g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh macaron',
    value: 'banh-macaron',
    icon: 'assets/icons/desserts/banh-macaron.png',
    type: 'desserts',
    defaultDuration: 3, // Bánh macaron: 3 ngày
    note: 'Lợi ích sức khỏe của Bánh macaron:\n\n'
        '1. Nguồn năng lượng: Macaron chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Macaron có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 450 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 20g\n'
        '* Carbohydrate: 65g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh nachos',
    value: 'banh-nachos',
    icon: 'assets/icons/desserts/banh-nachos.png',
    type: 'desserts',
    defaultDuration: 2, // Bánh nachos: 2 ngày
    note: 'Lợi ích sức khỏe của Bánh nachos:\n\n'
        '1. Nguồn năng lượng: Nachos chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Nachos có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 350 kcal\n'
        '* Chất đạm: 7g\n'
        '* Chất béo: 20g\n'
        '* Carbohydrate: 35g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh ngọt',
    value: 'banh-ngot',
    icon: 'assets/icons/desserts/banh-ngot.png',
    type: 'desserts',
    defaultDuration: 3, // Bánh ngọt: 3 ngày
    note: 'Lợi ích sức khỏe của Bánh ngọt:\n\n'
        '1. Nguồn năng lượng: Bánh ngọt chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh ngọt có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 400 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 20g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 1.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh ống khói',
    value: 'banh-ong-khoi',
    icon: 'assets/icons/desserts/banh-ong-khoi.png',
    type: 'desserts',
    defaultDuration: 2, // Bánh ống khói: 2 ngày
    note: 'Lợi ích sức khỏe của Bánh ống khói:\n\n'
        '1. Nguồn năng lượng: Bánh ống khói chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh ống khói có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 360 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 15g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh pudding',
    value: 'banh-pudding',
    icon: 'assets/icons/desserts/banh-pudding.png',
    type: 'desserts',
    defaultDuration: 4, // Bánh pudding: 4 ngày
    note: 'Lợi ích sức khỏe của Bánh pudding:\n\n'
        '1. Nguồn năng lượng: Pudding chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Pudding có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 150 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 7g\n'
        '* Carbohydrate: 19g\n'
        '* Chất xơ: 0.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh quy',
    value: 'banh-quy',
    icon: 'assets/icons/desserts/banh-quy.png',
    type: 'desserts',
    defaultDuration: 3, // Bánh quy: 3 ngày
    note: 'Lợi ích sức khỏe của Bánh quy:\n\n'
        '1. Nguồn năng lượng: Bánh quy chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh quy có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 480 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 22g\n'
        '* Carbohydrate: 68g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh quy may mắn',
    value: 'banh-quy-may-man',
    icon: 'assets/icons/desserts/banh-quy-may-man.png',
    type: 'desserts',
    defaultDuration: 2, // Bánh quy may mắn: 2 ngày
    note: 'Lợi ích sức khỏe của Bánh quy may mắn:\n\n'
        '1. Nguồn năng lượng: Bánh quy may mắn chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh quy may mắn có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 450 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 20g\n'
        '* Carbohydrate: 60g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh quy nho',
    value: 'banh-quy-nho',
    icon: 'assets/icons/desserts/banh-quy-nho.png',
    type: 'desserts',
    defaultDuration: 3, // Bánh quy nho: 3 ngày
    note: 'Lợi ích sức khỏe của Bánh quy nho:\n\n'
        '1. Nguồn năng lượng: Bánh quy nho chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh quy nho có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 430 kcal\n'
        '* Chất đạm: 5g\n'
        '* Chất béo: 18g\n'
        '* Carbohydrate: 60g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh quy quế sô cô la',
    value: 'banh-quy-que-so-co-la',
    icon: 'assets/icons/desserts/banh-quy-que-so-co-la.png',
    type: 'desserts',
    defaultDuration: 4, // Bánh quy quế sô cô la: 4 ngày
    note: 'Lợi ích sức khỏe của Bánh quy quế sô cô la:\n\n'
        '1. Nguồn năng lượng: Bánh quy quế sô cô la chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh quy quế sô cô la có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 470 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 22g\n'
        '* Carbohydrate: 60g\n'
        '* Chất xơ: 3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh trứng',
    value: 'banh-trung',
    icon: 'assets/icons/desserts/banh-trung.png',
    type: 'desserts',
    defaultDuration: 3, // Bánh trứng: 3 ngày
    note: 'Lợi ích sức khỏe của Bánh trứng:\n\n'
        '1. Nguồn năng lượng: Bánh trứng chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh trứng có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 360 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 15g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bánh trung thu',
    value: 'banh-trung-thu',
    icon: 'assets/icons/desserts/banh-trung-thu.png',
    type: 'desserts',
    defaultDuration: 2, // Bánh trung thu: 2 ngày
    note: 'Lợi ích sức khỏe của Bánh trung thu:\n\n'
        '1. Nguồn năng lượng: Bánh trung thu chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bánh trung thu có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 400 kcal\n'
        '* Chất đạm: 7g\n'
        '* Chất béo: 18g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bắp rang bơ',
    value: 'bap-rang-bo',
    icon: 'assets/icons/desserts/bap-rang-bo.png',
    type: 'desserts',
    defaultDuration: 4, // Bắp rang bơ: 4 ngày
    note: 'Lợi ích sức khỏe của Bắp rang bơ:\n\n'
        '1. Nguồn năng lượng: Bắp rang bơ chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bắp rang bơ có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 535 kcal\n'
        '* Chất đạm: 7g\n'
        '* Chất béo: 31g\n'
        '* Carbohydrate: 62g\n'
        '* Chất xơ: 10g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bim bim',
    value: 'bim-bim',
    icon: 'assets/icons/desserts/bim-bim.png',
    type: 'desserts',
    defaultDuration: 3, // Bim bim: 3 ngày
    note: 'Lợi ích sức khỏe của Bim bim:\n\n'
        '1. Nguồn năng lượng: Bim bim chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Bim bim có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 550 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 35g\n'
        '* Carbohydrate: 53g\n'
        '* Chất xơ: 4g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Brioche',
    value: 'brioche',
    icon: 'assets/icons/desserts/brioche.png',
    type: 'desserts',
    defaultDuration: 2, // Brioche: 2 ngày
    note: 'Lợi ích sức khỏe của Brioche:\n\n'
        '1. Nguồn năng lượng: Brioche chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Brioche có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 330 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 15g\n'
        '* Carbohydrate: 40g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Canape',
    value: 'canape',
    icon: 'assets/icons/desserts/canape.png',
    type: 'desserts',
    defaultDuration: 3, // Canape: 3 ngày
    note: 'Lợi ích sức khỏe của Canape:\n\n'
        '1. Nguồn năng lượng: Canape chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Canape có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 380 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 18g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Caramen',
    value: 'caramen',
    icon: 'assets/icons/desserts/caramen.png',
    type: 'desserts',
    defaultDuration: 2, // Caramen: 2 ngày
    note: 'Lợi ích sức khỏe của Caramen:\n\n'
        '1. Nguồn năng lượng: Caramen chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Caramen có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 270 kcal\n'
        '* Chất đạm: 7g\n'
        '* Chất béo: 12g\n'
        '* Carbohydrate: 30g\n'
        '* Chất xơ: 0.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Cracker',
    value: 'cracker',
    icon: 'assets/icons/desserts/cracker.png',
    type: 'desserts',
    defaultDuration: 4, // Cracker: 4 ngày
    note: 'Lợi ích sức khỏe của Cracker:\n\n'
        '1. Nguồn năng lượng: Cracker chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Cracker có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 420 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 18g\n'
        '* Carbohydrate: 55g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đá bào',
    value: 'da-bao',
    icon: 'assets/icons/desserts/da-bao.png',
    type: 'desserts',
    defaultDuration: 3, // Đá bào: 3 ngày
    note: 'Lợi ích sức khỏe của Đá bào:\n\n'
        '1. Giải khát: Đá bào là món tráng miệng giải khát tuyệt vời.\n\n'
        '2. Hương vị thơm ngon: Đá bào có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 100 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 25g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Dango',
    value: 'dango',
    icon: 'assets/icons/desserts/dango.png',
    type: 'desserts',
    defaultDuration: 2, // Dango: 2 ngày
    note: 'Lợi ích sức khỏe của Dango:\n\n'
        '1. Nguồn năng lượng: Dango chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Dango có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 200 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 45g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Gấu gummy',
    value: 'gau-gummy',
    icon: 'assets/icons/desserts/gau-gummy.png',
    type: 'desserts',
    defaultDuration: 3, // Gấu gummy: 3 ngày
    note: 'Lợi ích sức khỏe của Gấu gummy:\n\n'
        '1. Nguồn năng lượng: Gấu gummy chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Gấu gummy có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 330 kcal\n'
        '* Chất đạm: 6g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 78g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Kem',
    value: 'kem',
    icon: 'assets/icons/desserts/kem.png',
    type: 'desserts',
    defaultDuration: 4, // Kem: 4 ngày
    note: 'Lợi ích sức khỏe của Kem:\n\n'
        '1. Giải khát: Kem là món tráng miệng giải khát tuyệt vời.\n\n'
        '2. Hương vị thơm ngon: Kem có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 207 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 11g\n'
        '* Carbohydrate: 24g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Kẹo',
    value: 'keo',
    icon: 'assets/icons/desserts/keo.png',
    type: 'desserts',
    defaultDuration: 3, // Kẹo: 3 ngày
    note: 'Lợi ích sức khỏe của Kẹo:\n\n'
        '1. Nguồn năng lượng: Kẹo chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Kẹo có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 387 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 98g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Kẹo cao su',
    value: 'keo-cao-su',
    icon: 'assets/icons/desserts/keo-cao-su.png',
    type: 'desserts',
    defaultDuration: 2, // Kẹo cao su: 2 ngày
    note: 'Lợi ích sức khỏe của Kẹo cao su:\n\n'
        '1. Giải trí: Kẹo cao su giúp giảm căng thẳng.\n\n'
        '2. Hương vị thơm ngon: Kẹo cao su có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 300 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 100g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Kẹo chíp chíp',
    value: 'keo-chip-chip',
    icon: 'assets/icons/desserts/keo-chip-chip.png',
    type: 'desserts',
    defaultDuration: 3, // Kẹo chíp chíp: 3 ngày
    note: 'Lợi ích sức khỏe của Kẹo chíp chíp:\n\n'
        '1. Nguồn năng lượng: Kẹo chíp chíp chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Kẹo chíp chíp có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 350 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 90g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Kẹo dẻo',
    value: 'keo-deo',
    icon: 'assets/icons/desserts/keo-deo.png',
    type: 'desserts',
    defaultDuration: 2, // Kẹo dẻo: 2 ngày
    note: 'Lợi ích sức khỏe của Kẹo dẻo:\n\n'
        '1. Nguồn năng lượng: Kẹo dẻo chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Kẹo dẻo có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 340 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 85g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Kẹo mút',
    value: 'keo-mut',
    icon: 'assets/icons/desserts/keo-mut.png',
    type: 'desserts',
    defaultDuration: 4, // Kẹo mút: 4 ngày
    note: 'Lợi ích sức khỏe của Kẹo mút:\n\n'
        '1. Giải trí: Kẹo mút giúp giảm căng thẳng.\n\n'
        '2. Hương vị thơm ngon: Kẹo mút có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 400 kcal\n'
        '* Chất đạm: 0g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 100g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Khoai tây chiên',
    value: 'khoai-tay-chien',
    icon: 'assets/icons/desserts/khoai-tay-chien.png',
    type: 'desserts',
    defaultDuration: 3, // Khoai tây chiên: 3 ngày
    note: 'Lợi ích sức khỏe của Khoai tây chiên:\n\n'
        '1. Nguồn năng lượng: Khoai tây chiên chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Khoai tây chiên có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 312 kcal\n'
        '* Chất đạm: 3.4g\n'
        '* Chất béo: 15.3g\n'
        '* Carbohydrate: 41.4g\n'
        '* Chất xơ: 3.8g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Khoai tây chiên dài',
    value: 'khoai-tay-chien-dai',
    icon: 'assets/icons/desserts/khoai-tay-chien-dai.png',
    type: 'desserts',
    defaultDuration: 2, // Khoai tây chiên dài: 2 ngày
    note: 'Lợi ích sức khỏe của Khoai tây chiên dài:\n\n'
        '1. Nguồn năng lượng: Khoai tây chiên dài chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Khoai tây chiên dài có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 322 kcal\n'
        '* Chất đạm: 3.5g\n'
        '* Chất béo: 16g\n'
        '* Carbohydrate: 40g\n'
        '* Chất xơ: 4g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Pavlova',
    value: 'pavlova',
    icon: 'assets/icons/desserts/pavlova.png',
    type: 'desserts',
    defaultDuration: 3, // Pavlova: 3 ngày
    note: 'Lợi ích sức khỏe của Pavlova:\n\n'
        '1. Nguồn năng lượng: Pavlova chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Pavlova có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 280 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 11g\n'
        '* Carbohydrate: 42g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Poutine',
    value: 'poutine',
    icon: 'assets/icons/desserts/poutine.png',
    type: 'desserts',
    defaultDuration: 2, // Poutine: 2 ngày
    note: 'Lợi ích sức khỏe của Poutine:\n\n'
        '1. Nguồn năng lượng: Poutine chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Poutine có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 364 kcal\n'
        '* Chất đạm: 10g\n'
        '* Chất béo: 23g\n'
        '* Carbohydrate: 26g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Sô cô la',
    value: 'so-co-la',
    icon: 'assets/icons/desserts/so-co-la.png',
    type: 'desserts',
    defaultDuration: 4, // Sô cô la: 4 ngày
    note: 'Lợi ích sức khỏe của Sô cô la:\n\n'
        '1. Tăng cường tâm trạng: Sô cô la có chứa chất giúp tăng cường tâm trạng.\n\n'
        '2. Hương vị thơm ngon: Sô cô la có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 546 kcal\n'
        '* Chất đạm: 4.9g\n'
        '* Chất béo: 31g\n'
        '* Carbohydrate: 61g\n'
        '* Chất xơ: 7g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Thanh năng lượng',
    value: 'thanh-nang-luong',
    icon: 'assets/icons/desserts/thanh-nang-luong.png',
    type: 'desserts',
    defaultDuration: 3, // Thanh năng lượng: 3 ngày
    note: 'Lợi ích sức khỏe của Thanh năng lượng:\n\n'
        '1. Nguồn năng lượng: Thanh năng lượng chứa carbohydrate và chất béo, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Thanh năng lượng có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 450 kcal\n'
        '* Chất đạm: 10g\n'
        '* Chất béo: 20g\n'
        '* Carbohydrate: 60g\n'
        '* Chất xơ: 5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Tiramisu',
    value: 'tiramisu',
    icon: 'assets/icons/desserts/tiramisu.png',
    type: 'desserts',
    defaultDuration: 2, // Tiramisu: 2 ngày
    note: 'Lợi ích sức khỏe của Tiramisu:\n\n'
        '1. Nguồn năng lượng: Tiramisu chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Tiramisu có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 240 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 15g\n'
        '* Carbohydrate: 25g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Tổ ong',
    value: 'to-ong',
    icon: 'assets/icons/desserts/to-ong.png',
    type: 'desserts',
    defaultDuration: 3, // Tổ ong: 3 ngày
    note: 'Lợi ích sức khỏe của Tổ ong:\n\n'
        '1. Giải trí: Tổ ong là món tráng miệng thú vị.\n\n'
        '2. Hương vị thơm ngon: Tổ ong có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 150 kcal\n'
        '* Chất đạm: 1g\n'
        '* Chất béo: 0g\n'
        '* Carbohydrate: 39g\n'
        '* Chất xơ: 0g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Tteok',
    value: 'tteok',
    icon: 'assets/icons/desserts/tteok.png',
    type: 'desserts',
    defaultDuration: 2, // Tteok: 2 ngày
    note: 'Lợi ích sức khỏe của Tteok:\n\n'
        '1. Nguồn năng lượng: Tteok chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Tteok có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 220 kcal\n'
        '* Chất đạm: 4g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Yakgwa',
    value: 'yakgwa',
    icon: 'assets/icons/desserts/yakgwa.png',
    type: 'desserts',
    defaultDuration: 4, // Yakgwa: 4 ngày
    note: 'Lợi ích sức khỏe của Yakgwa:\n\n'
        '1. Nguồn năng lượng: Yakgwa chứa carbohydrate và đường, cung cấp năng lượng nhanh chóng.\n\n'
        '2. Hương vị thơm ngon: Yakgwa có hương vị đặc biệt, dễ thưởng thức.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 400 kcal\n'
        '* Chất đạm: 3g\n'
        '* Chất béo: 20g\n'
        '* Carbohydrate: 50g\n'
        '* Chất xơ: 2g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
];

List<Category> nuts = [
  Category(
    label: 'Cacao',
    value: 'cacao',
    icon: 'assets/icons/nuts/cacao.png',
    type: 'nuts',
    defaultDuration: 2, // Cacao: 2 ngày
    note: 'Lợi ích sức khỏe của Cacao:\n\n'
        '1. Chống oxy hóa: Cacao chứa nhiều chất chống oxy hóa giúp ngăn ngừa tổn thương tế bào.\n\n'
        '2. Tăng cường năng lượng: Cacao cung cấp năng lượng nhanh chóng.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 228 kcal\n'
        '* Chất đạm: 19g\n'
        '* Chất béo: 13g\n'
        '* Carbohydrate: 58g\n'
        '* Chất xơ: 33g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đậu phộng',
    value: 'dau-phong',
    icon: 'assets/icons/nuts/dau-phong.png',
    type: 'nuts',
    defaultDuration: 3, // Đậu phộng: 3 ngày
    note: 'Lợi ích sức khỏe của Đậu phộng:\n\n'
        '1. Giàu protein: Đậu phộng là nguồn cung cấp protein dồi dào, tốt cho cơ bắp.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 567 kcal\n'
        '* Chất đạm: 26g\n'
        '* Chất béo: 49g\n'
        '* Carbohydrate: 16g\n'
        '* Chất xơ: 8.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạnh nhân',
    value: 'hanh-nhan',
    icon: 'assets/icons/nuts/hanh-nhan.png',
    type: 'nuts',
    defaultDuration: 2, // Hạnh nhân: 2 ngày
    note: 'Lợi ích sức khỏe của Hạnh nhân:\n\n'
        '1. Giàu vitamin E: Hạnh nhân cung cấp lượng vitamin E dồi dào, tốt cho da.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 579 kcal\n'
        '* Chất đạm: 21g\n'
        '* Chất béo: 50g\n'
        '* Carbohydrate: 22g\n'
        '* Chất xơ: 12g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt bí',
    value: 'hat-bi',
    icon: 'assets/icons/nuts/hat-bi.png',
    type: 'nuts',
    defaultDuration: 4, // Hạt bí: 4 ngày
    note: 'Lợi ích sức khỏe của Hạt bí:\n\n'
        '1. Tốt cho hệ miễn dịch: Hạt bí chứa nhiều kẽm, giúp tăng cường hệ miễn dịch.\n\n'
        '2. Tốt cho hệ tiêu hóa: Hạt bí giàu chất xơ, giúp cải thiện tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 559 kcal\n'
        '* Chất đạm: 30g\n'
        '* Chất béo: 49g\n'
        '* Carbohydrate: 11g\n'
        '* Chất xơ: 6g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt brazil',
    value: 'hat-brazil',
    icon: 'assets/icons/nuts/hat-brazil.png',
    type: 'nuts',
    defaultDuration: 3, // Hạt brazil: 3 ngày
    note: 'Lợi ích sức khỏe của Hạt brazil:\n\n'
        '1. Giàu selenium: Hạt brazil là nguồn cung cấp selenium tuyệt vời, giúp chống oxy hóa.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 656 kcal\n'
        '* Chất đạm: 14g\n'
        '* Chất béo: 66g\n'
        '* Carbohydrate: 12g\n'
        '* Chất xơ: 7.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt dẻ',
    value: 'hat-de',
    icon: 'assets/icons/nuts/hat-de.png',
    type: 'nuts',
    defaultDuration: 2, // Hạt dẻ: 2 ngày
    note: 'Lợi ích sức khỏe của Hạt dẻ:\n\n'
        '1. Giàu vitamin C: Hạt dẻ cung cấp lượng vitamin C dồi dào, tốt cho hệ miễn dịch.\n\n'
        '2. Tăng cường sức khỏe tiêu hóa: Chứa nhiều chất xơ, giúp cải thiện tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 213 kcal\n'
        '* Chất đạm: 2.4g\n'
        '* Chất béo: 2.2g\n'
        '* Carbohydrate: 45g\n'
        '* Chất xơ: 8.1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt dẻ cười',
    value: 'hat-de-cuoi',
    icon: 'assets/icons/nuts/hat-de-cuoi.png',
    type: 'nuts',
    defaultDuration: 2, // Hạt dẻ cười: 2 ngày
    note: 'Lợi ích sức khỏe của Hạt dẻ cười:\n\n'
        '1. Giàu chất chống oxy hóa: Hạt dẻ cười chứa nhiều chất chống oxy hóa, giúp bảo vệ tế bào.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 562 kcal\n'
        '* Chất đạm: 20g\n'
        '* Chất béo: 45g\n'
        '* Carbohydrate: 28g\n'
        '* Chất xơ: 10g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt điều',
    value: 'hat-dieu',
    icon: 'assets/icons/nuts/hat-dieu.png',
    type: 'nuts',
    defaultDuration: 3, // Hạt điều: 3 ngày
    note: 'Lợi ích sức khỏe của Hạt điều:\n\n'
        '1. Giàu magie: Hạt điều cung cấp lượng magie dồi dào, tốt cho xương và răng.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 553 kcal\n'
        '* Chất đạm: 18g\n'
        '* Chất béo: 44g\n'
        '* Carbohydrate: 30g\n'
        '* Chất xơ: 3.3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt hướng dương',
    value: 'hat-huong-duong',
    icon: 'assets/icons/nuts/hat-huong-duong.png',
    type: 'nuts',
    defaultDuration: 2, // Hạt hướng dương: 2 ngày
    note: 'Lợi ích sức khỏe của Hạt hướng dương:\n\n'
        '1. Giàu vitamin E: Hạt hướng dương cung cấp lượng vitamin E dồi dào, tốt cho da.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 584 kcal\n'
        '* Chất đạm: 21g\n'
        '* Chất béo: 51g\n'
        '* Carbohydrate: 20g\n'
        '* Chất xơ: 8.6g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt phỉ',
    value: 'hat-phi',
    icon: 'assets/icons/nuts/hat-phi.png',
    type: 'nuts',
    defaultDuration: 4, // Hạt phỉ: 4 ngày
    note: 'Lợi ích sức khỏe của Hạt phỉ:\n\n'
        '1. Giàu vitamin E: Hạt phỉ cung cấp lượng vitamin E dồi dào, tốt cho da.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 628 kcal\n'
        '* Chất đạm: 15g\n'
        '* Chất béo: 61g\n'
        '* Carbohydrate: 17g\n'
        '* Chất xơ: 10g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt sồi',
    value: 'hat-soi',
    icon: 'assets/icons/nuts/hat-soi.png',
    type: 'nuts',
    defaultDuration: 3, // Hạt sồi: 3 ngày
    note: 'Lợi ích sức khỏe của Hạt sồi:\n\n'
        '1. Giàu chất chống oxy hóa: Hạt sồi chứa nhiều chất chống oxy hóa, giúp bảo vệ tế bào.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 387 kcal\n'
        '* Chất đạm: 7.5g\n'
        '* Chất béo: 24g\n'
        '* Carbohydrate: 45g\n'
        '* Chất xơ: 9g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hạt thông',
    value: 'hat-thong',
    icon: 'assets/icons/nuts/hat-thong.png',
    type: 'nuts',
    defaultDuration: 4, // Hạt thông: 4 ngày
    note: 'Lợi ích sức khỏe của Hạt thông:\n\n'
        '1. Giàu magie: Hạt thông cung cấp lượng magie dồi dào, tốt cho xương và răng.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 673 kcal\n'
        '* Chất đạm: 14g\n'
        '* Chất béo: 68g\n'
        '* Carbohydrate: 13g\n'
        '* Chất xơ: 3.7g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Hồ đào',
    value: 'ho-dao',
    icon: 'assets/icons/nuts/ho-dao.png',
    type: 'nuts',
    defaultDuration: 3, // Hồ đào: 3 ngày
    note: 'Lợi ích sức khỏe của Hồ đào:\n\n'
        '1. Giàu chất chống oxy hóa: Hồ đào chứa nhiều chất chống oxy hóa, giúp bảo vệ tế bào.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 691 kcal\n'
        '* Chất đạm: 9g\n'
        '* Chất béo: 72g\n'
        '* Carbohydrate: 14g\n'
        '* Chất xơ: 9.6g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Macadamia',
    value: 'macadamia',
    icon: 'assets/icons/nuts/macadamia.png',
    type: 'nuts',
    defaultDuration: 4, // Macadamia: 4 ngày
    note: 'Lợi ích sức khỏe của Macadamia:\n\n'
        '1. Giàu chất chống oxy hóa: Macadamia chứa nhiều chất chống oxy hóa, giúp bảo vệ tế bào.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 718 kcal\n'
        '* Chất đạm: 8g\n'
        '* Chất béo: 76g\n'
        '* Carbohydrate: 14g\n'
        '* Chất xơ: 8.6g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Mè',
    value: 'me',
    icon: 'assets/icons/nuts/me.png',
    type: 'nuts',
    defaultDuration: 2, // Mè: 2 ngày
    note: 'Lợi ích sức khỏe của Mè:\n\n'
        '1. Giàu canxi: Mè cung cấp lượng canxi dồi dào, tốt cho xương và răng.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 573 kcal\n'
        '* Chất đạm: 17g\n'
        '* Chất béo: 49g\n'
        '* Carbohydrate: 23g\n'
        '* Chất xơ: 11.8g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Quả óc chó',
    value: 'qua-oc-cho',
    icon: 'assets/icons/nuts/qua-oc-cho.png',
    type: 'nuts',
    defaultDuration: 3, // Quả óc chó: 3 ngày
    note: 'Lợi ích sức khỏe của Quả óc chó:\n\n'
        '1. Giàu omega-3: Quả óc chó cung cấp lượng omega-3 dồi dào, tốt cho sức khỏe não bộ.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất béo không bão hòa có lợi cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 654 kcal\n'
        '* Chất đạm: 15g\n'
        '* Chất béo: 65g\n'
        '* Carbohydrate: 14g\n'
        '* Chất xơ: 6.7g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
];

List<Category> cereals = [
  Category(
    label: 'Bột mì',
    value: 'bot-mi',
    icon: 'assets/icons/cereals/bot-mi.png',
    type: 'cereals',
    defaultDuration: 365, // Bột mì: 365 ngày
    note: 'Lợi ích sức khỏe của Bột mì:\n\n'
        '1. Giàu carbohydrate: Bột mì là nguồn cung cấp năng lượng chính cho cơ thể.\n\n'
        '2. Cung cấp protein: Bột mì chứa một lượng protein khá cao.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 364 kcal\n'
        '* Chất đạm: 12g\n'
        '* Chất béo: 1g\n'
        '* Carbohydrate: 76g\n'
        '* Chất xơ: 2.7g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bột ngô',
    value: 'bot-ngo',
    icon: 'assets/icons/cereals/bot-ngo.png',
    type: 'cereals',
    defaultDuration: 180, // Bột ngô: 180 ngày
    note: 'Lợi ích sức khỏe của Bột ngô:\n\n'
        '1. Giàu carbohydrate: Bột ngô cung cấp năng lượng cho cơ thể.\n\n'
        '2. Không chứa gluten: Bột ngô là lựa chọn tốt cho người không dung nạp gluten.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 365 kcal\n'
        '* Chất đạm: 7.2g\n'
        '* Chất béo: 3.9g\n'
        '* Carbohydrate: 73g\n'
        '* Chất xơ: 7.3g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Bột yến mạch',
    value: 'bot-yen-mach',
    icon: 'assets/icons/cereals/bot-yen-mach.png',
    type: 'cereals',
    defaultDuration: 365, // Bột yến mạch: 365 ngày
    note: 'Lợi ích sức khỏe của Bột yến mạch:\n\n'
        '1. Tốt cho tim mạch: Bột yến mạch giúp giảm cholesterol xấu.\n\n'
        '2. Giàu chất xơ: Bột yến mạch chứa nhiều chất xơ, tốt cho hệ tiêu hóa.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 389 kcal\n'
        '* Chất đạm: 16.9g\n'
        '* Chất béo: 6.9g\n'
        '* Carbohydrate: 66.3g\n'
        '* Chất xơ: 10.6g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đậu cove',
    value: 'dau-cove',
    icon: 'assets/icons/cereals/dau-cove.png',
    type: 'cereals',
    defaultDuration: 180, // Đậu cove: 180 ngày
    note: 'Lợi ích sức khỏe của Đậu cove:\n\n'
        '1. Giàu chất xơ: Đậu cove cung cấp nhiều chất xơ, tốt cho hệ tiêu hóa.\n\n'
        '2. Cung cấp protein: Đậu cove là nguồn cung cấp protein tốt.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 337 kcal\n'
        '* Chất đạm: 23g\n'
        '* Chất béo: 1.2g\n'
        '* Carbohydrate: 60g\n'
        '* Chất xơ: 15g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đậu đen',
    value: 'dau-den',
    icon: 'assets/icons/cereals/dau-den.png',
    type: 'cereals',
    defaultDuration: 365, // Đậu đen: 365 ngày
    note: 'Lợi ích sức khỏe của Đậu đen:\n\n'
        '1. Giàu chất chống oxy hóa: Đậu đen chứa nhiều chất chống oxy hóa, tốt cho sức khỏe.\n\n'
        '2. Cung cấp protein và chất xơ: Đậu đen là nguồn cung cấp protein và chất xơ tuyệt vời.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 341 kcal\n'
        '* Chất đạm: 21g\n'
        '* Chất béo: 0.9g\n'
        '* Carbohydrate: 62.4g\n'
        '* Chất xơ: 15.5g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đậu đỏ',
    value: 'dau-do',
    icon: 'assets/icons/cereals/dau-do.png',
    type: 'cereals',
    defaultDuration: 365, // Đậu đỏ: 365 ngày
    note: 'Lợi ích sức khỏe của Đậu đỏ:\n\n'
        '1. Giàu chất chống oxy hóa: Đậu đỏ chứa nhiều chất chống oxy hóa, tốt cho sức khỏe.\n\n'
        '2. Cung cấp protein và chất xơ: Đậu đỏ là nguồn cung cấp protein và chất xơ tuyệt vời.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 329 kcal\n'
        '* Chất đạm: 19.9g\n'
        '* Chất béo: 0.5g\n'
        '* Carbohydrate: 60g\n'
        '* Chất xơ: 12.7g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đậu lăng',
    value: 'dau-lang',
    icon: 'assets/icons/cereals/dau-lang.png',
    type: 'cereals',
    defaultDuration: 180, // Đậu lăng: 180 ngày
    note: 'Lợi ích sức khỏe của Đậu lăng:\n\n'
        '1. Giàu protein: Đậu lăng là nguồn cung cấp protein dồi dào, tốt cho cơ bắp.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất xơ và chất chống oxy hóa tốt cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 353 kcal\n'
        '* Chất đạm: 25.8g\n'
        '* Chất béo: 1.1g\n'
        '* Carbohydrate: 60g\n'
        '* Chất xơ: 31.1g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đậu nành luộc',
    value: 'dau-nanh-luoc',
    icon: 'assets/icons/cereals/dau-nanh-luoc.png',
    type: 'cereals',
    defaultDuration: 180, // Đậu nành luộc: 180 ngày
    note: 'Lợi ích sức khỏe của Đậu nành luộc:\n\n'
        '1. Giàu protein: Đậu nành luộc là nguồn cung cấp protein dồi dào, tốt cho cơ bắp.\n\n'
        '2. Tăng cường sức khỏe tim mạch: Chứa nhiều chất xơ và chất chống oxy hóa tốt cho tim mạch.\n\n'
        'Thông tin dinh dưỡng (per 100g):\n\n'
        '* Calo: 172 kcal\n'
        '* Chất đạm: 18g\n'
        '* Chất béo: 9g\n'
        '* Carbohydrate: 8g\n'
        '* Chất xơ: 6g\n\n'
        'Lưu ý: Bảo quản nơi khô ráo và thoáng mát.\n\n',
  ),
  Category(
    label: 'Đậu thận',
    value: 'dau-than',
    icon: 'assets/icons/cereals/dau-than.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
  Category(
    label: 'Đậu tương',
    value: 'dau-tuong',
    icon: 'assets/icons/cereals/dau-tuong.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
  Category(
    label: 'Đậu xanh',
    value: 'dau-xanh',
    icon: 'assets/icons/cereals/dau-xanh.png',
    type: 'cereals',
    defaultDuration: 180,
  ),
  Category(
    label: 'Đậu nành',
    value: 'dau-nanh',
    icon: 'assets/icons/cereals/dau-nanh.png',
    type: 'cereals',
    defaultDuration: 180,
  ),
  Category(
    label: 'Hạt chia',
    value: 'hat-chia',
    icon: 'assets/icons/cereals/hat-chia.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
  Category(
    label: 'Hạt diêm mạch',
    value: 'hat-diem-mach',
    icon: 'assets/icons/cereals/hat-diem-mach.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
  Category(
    label: 'Kiều mạch',
    value: 'kieu-mach',
    icon: 'assets/icons/cereals/kieu-mach.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
  Category(
    label: 'Lúa gạo',
    value: 'lua-gao',
    icon: 'assets/icons/cereals/lua-gao.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
  Category(
    label: 'Lúa mạch',
    value: 'lua-mach',
    icon: 'assets/icons/cereals/lua-mach.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
  Category(
    label: 'Lúa mạch đen',
    value: 'lua-mach-den',
    icon: 'assets/icons/cereals/lua-mach-den.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
  Category(
    label: 'Men',
    value: 'men',
    icon: 'assets/icons/cereals/men.png',
    type: 'cereals',
    defaultDuration: 365,
  ),
];

List<Category> etc = [
  Category(
    label: 'Chất đạm',
    value: 'chat-dam',
    icon: 'assets/icons/etc/chat-dam.png',
    type: 'etc',
    defaultDuration: 180, // 6 tháng
  ),
  Category(
    label: 'Dầu cá',
    value: 'dau-ca',
    icon: 'assets/icons/etc/dau-ca.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
  Category(
    label: 'Halal',
    value: 'halal',
    icon: 'assets/icons/etc/halal.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
  Category(
    label: 'Iftar',
    value: 'iftar',
    icon: 'assets/icons/etc/iftar.png',
    type: 'etc',
    defaultDuration: 1, // Ngày
  ),
  Category(
    label: 'Kẹo Halloween',
    value: 'keo-halloween',
    icon: 'assets/icons/etc/keo-halloween.png',
    type: 'etc',
    defaultDuration: 30, // 1 tháng
  ),
  Category(
    label: 'Mặt nạ',
    value: 'mat-na',
    icon: 'assets/icons/etc/mat-na.png',
    type: 'etc',
    defaultDuration: 30, // 1 tháng
  ),
  Category(
    label: 'Mỹ phẩm',
    value: 'my-pham',
    icon: 'assets/icons/etc/my-pham.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
  Category(
    label: 'Probiotic',
    value: 'probiotic',
    icon: 'assets/icons/etc/probiotic.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
  Category(
    label: 'Sữa bột trẻ em',
    value: 'sua-bot-tre-em',
    icon: 'assets/icons/etc/sua-bot-tre-em.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
  Category(
    label: 'Thức ăn trẻ em',
    value: 'thuc-an-tre-em',
    icon: 'assets/icons/etc/thuc-an-tre-em.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
  Category(
    label: 'Thức ăn vật nuôi',
    value: 'thuc-an-vat-nuoi',
    icon: 'assets/icons/etc/thuc-an-vat-nuoi.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
  Category(
    label: 'Thuốc',
    value: 'thuoc',
    icon: 'assets/icons/etc/thuoc.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
  Category(
    label: 'Trứng phục sinh',
    value: 'trung-phuc-sinh',
    icon: 'assets/icons/etc/trung-phuc-sinh.png',
    type: 'etc',
    defaultDuration: 7, // 1 tuần
  ),
  Category(
    label: 'Vitamin',
    value: 'vitamin',
    icon: 'assets/icons/etc/vitamin.png',
    type: 'etc',
    defaultDuration: 365, // 1 năm
  ),
];

List<ItemFood> foods = [
  ItemFood(
    categories: fruits,
    value: 'fruits',
    label: 'Trái cây',
    icon: 'assets/icons/fruits/fruits.png',
  ),
  ItemFood(
    categories: meats,
    value: 'meats',
    label: 'Thịt',
    icon: 'assets/icons/meats/meats.png',
  ),
  ItemFood(
    categories: vegetables,
    value: 'vegetables',
    label: 'Rau',
    icon: 'assets/icons/vegetables/vegetables.png',
  ),
  ItemFood(
    categories: dairyProducts,
    value: 'dairy_products',
    label: 'Sản phẩm từ sữa',
    icon: 'assets/icons/dairy_products/dairy_products.png',
  ),
  ItemFood(
    categories: dishes,
    value: 'dishes',
    label: 'Món ăn',
    icon: 'assets/icons/dishes/dishes.png',
  ),
  ItemFood(
    categories: seafood,
    value: 'seafood',
    label: 'Hải sản',
    icon: 'assets/icons/seafood/seafood.png',
  ),
  ItemFood(
    categories: drinks,
    value: 'drinks',
    label: 'Đồ uống',
    icon: 'assets/icons/drinks/drinks.png',
  ),
  ItemFood(
    categories: alcohol,
    value: 'alcohol',
    label: 'Rượu',
    icon: 'assets/icons/alcohol/alcohol.png',
  ),
  ItemFood(
    categories: sauces,
    value: 'sauces',
    label: 'Nước xốt',
    icon: 'assets/icons/sauces/sauces.png',
  ),
  ItemFood(
    categories: spices,
    value: 'spices',
    label: 'Gia vị',
    icon: 'assets/icons/spices/spices.png',
  ),
  ItemFood(
    categories: bread,
    value: 'bread',
    label: 'Bánh mì',
    icon: 'assets/icons/bread/bread.png',
  ),
  ItemFood(
    categories: desserts,
    value: 'desserts',
    label: 'Tráng miệng',
    icon: 'assets/icons/desserts/desserts.png',
  ),
  ItemFood(
    categories: nuts,
    value: 'nuts',
    label: 'Quả hạch',
    icon: 'assets/icons/nuts/nuts.png',
  ),
  ItemFood(
    categories: cereals,
    value: 'cereals',
    label: 'Ngũ cốc',
    icon: 'assets/icons/cereals/cereals.png',
  ),
  ItemFood(
    categories: etc,
    value: 'etc',
    label: 'Vân vân.',
    icon: 'assets/icons/etc/etc.png',
  ),
];

List<Category> allCategories = [
  ...fruits,
  ...meats,
  ...vegetables,
  ...dairyProducts,
  ...dishes,
  ...seafood,
  ...drinks,
  ...alcohol,
  ...sauces,
  ...spices,
  ...bread,
  ...desserts,
  ...nuts,
  ...cereals,
  ...etc
];
List<Item> reactions = [
  Item(
    value: 'delicious',
    label: 'Delicious',
    icon: 'assets/icons/i16/eat.png',
  ),
  Item(
    value: 'love',
    label: 'Yêu thích',
    icon: 'assets/icons/i16/heart.png',
  ),
  Item(
    value: 'like',
    label: 'Thích',
    icon: 'assets/icons/i16/vo-tay.png',
  ),
];

Map<int, Item> feels = {
  1: reactions[0],
  2: reactions[1],
  3: reactions[2],
};

List<Item> positions = [
  Item(
    value: '1',
    label: 'Tủ lạnh',
  ),
  Item(
    value: '2',
    label: 'Tủ đông',
  ),
  Item(
    value: '3',
    label: 'Bếp',
  ),
  Item(
    value: '4',
    label: 'Danh sách mua sắm',
  )
];
