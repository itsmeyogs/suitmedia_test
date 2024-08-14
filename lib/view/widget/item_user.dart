
import 'package:flutter/material.dart';

class ItemUser extends StatelessWidget {
  const ItemUser(
      {super.key,
      required this.fullName,
      required this.email,
      required this.imageUrl});

  final String fullName;
  final String email;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, top: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xFFE2E3E4))
        )
      ),
      child: Row(
        children: [
          const SizedBox(width: 16,),
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 25,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF686777),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
