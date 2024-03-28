import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/layouts/private/user/job_detail/widgets/company_description.dart';
import 'package:job_app/src/layouts/private/user/job_detail/widgets/header_detail.dart';
import 'package:job_app/src/layouts/private/user/job_detail/widgets/job_description.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(
        title: Text('Chi tiết công việc',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        showBackground: true,
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JJobDetailHeader(),
              SizedBox(height: JSizes.spaceBtwSections),
              JSectionHeading(title: "Thông tin doanh nghiệp"),
              SizedBox(height: JSizes.spaceBtwItems),
              JCompanyDescription(
                companyName: 'Công ty TNHH CP',
                companyTaxCode: '010231241',
                companyAddress: '567 Lê Duẩn, BMT, Đắk Lắk',
                companyHotline: '0915 975 198',
                companyEmail: 'seanobita08@gmail.com',
              ),
              SizedBox(height: JSizes.spaceBtwItems / 2),
              JJobDescription(
                requirements:
                    '''Tốt nghiệp Đại học chuyên ngành Công nghệ thông tin, Khoa học máy tính hoặc chuyên ngành có liên quan.
Có ít nhất 3 năm kinh nghiệm làm lập trình viên.
Khả năng lập trình bằng các ngôn ngữ như C++, Java (J2EE), XML, Python,…  
Thành thạo các công cụ Visual Studio 2005 trở lên, Netbeans, JCreator, SQL Server 2005, IIS, Adobe Photoshop, các phần mềm quản trị mã nguồn và dự án,...
Kiến thức xuất sắc với các dữ liệu liên quan, các công nghệ SQL và ORM  
Kỹ năng tư duy logic và thuật toán tốt.
Nắm bắt được công nghệ mới và xu hướng phát triển công nghệ web.
Có khả năng đọc hiểu tiếng Anh chuyên ngành.
Năng động, có khả năng tự giải quyết công việc mà không cần giám sát nhiều, làm việc độc lập hoặc theo nhóm, chịu được áp lực của công việc.
Độ tuổi từ 23 - 40 tuổi.''',
                salary: '''
MỨC LƯƠNG:
  - Mức lương khởi điểm: 10.000.000 (có thể cao hơn dựa vào trình độ).
  - Xét duyệt lại lương sau mỗi 3 tháng làm việc.
  - Mức lương tối đa có thể đạt được: 20.000.000
PHÚC LỢI:
  - ... ''',
                description: '''Phân tích nhu cầu, vấn đề của người sử dụng. 
Sử dụng ngôn ngữ lập trình để tạo nên chương trình, phần mềm, ứng dụng dựa theo yêu cầu của doanh nghiệp và khách hàng.
Nâng cấp tính năng mới cho ứng dụng, phần mềm dựa trên nhu cầu phát sinh của người sử dụng. 
Sửa chữa lỗi nhằm đảm bảo ứng dụng và phần mềm luôn hoạt động trơn tru.
Kiểm thử phần mềm, cộng tác với chuyên gia máy tính để đảm bảo phần mềm luôn đạt chất lượng cao.
Tìm tòi, nghiên cứu, cải tiến các công nghệ, tính năng mới cho sản phẩm công nghệ của mình.''',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          width: double.infinity,
          child:
              ElevatedButton(onPressed: () {}, child: const Text('Ứng tuyển'))),
    );
  }
}
