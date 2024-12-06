import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageScreen extends StatelessWidget {
  const CachedNetworkImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CachedNetworkImage Screen'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl:
              'https://scontent.fsgn5-5.fna.fbcdn.net/v/t39.30808-1/418732454_3477145589263333_2109172459057679183_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=108&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeHpXq6c_SeWLmLNrEJAa2J3FhFvrwm164QWEW-vCbXrhFh6TRD75ke-tlUZ2I0Nsv_g4bDdfKPKT0grZuOtJxj2&_nc_ohc=8p_dMk8dgy4Q7kNvgEHylSE&_nc_zt=24&_nc_ht=scontent.fsgn5-5.fna&_nc_gid=Ah_Dc-Rv9UktrRPoCAeelpU&oh=00_AYBdH1C9Uy6LUa8NFVJJDI3CgVqaRQw0IxTGWcSYGId8vw&oe=675923F4', // Đường dẫn hình ảnh từ mạng
          placeholder: (context, url) =>
              const CircularProgressIndicator(), // Hiển thị khi đang tải
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            size: 50,
            color: Colors.red,
          ), // Hiển thị khi xảy ra lỗi
          fadeInDuration:
              const Duration(milliseconds: 500), // Hiệu ứng xuất hiện
          width: 200, // Kích thước hình ảnh
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
