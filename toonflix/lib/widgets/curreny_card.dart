import 'package:flutter/material.dart';

class CurrenyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;  // 아이콘 색상 반전
  final int order;

  final Color blackColor =  const Color(0xFF1F2123);

  const CurrenyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order
  });

  @override
  Widget build(BuildContext context) =>
      Transform.translate(
        offset: Offset(0, order * -20),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isInverted ? blackColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyle(
                        color: isInverted ? Colors.white : blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Text(amount,
                          style: TextStyle(
                            color: isInverted ? Colors.white : blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(code,
                          style: TextStyle(
                            color: isInverted ? Colors.white.withOpacity(0.8) : blackColor.withOpacity(0.8),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 2.2,
                  child: Transform.translate(
                      offset: const Offset(-5, 15),
                      child: Icon(
                        icon,
                        color: isInverted ? Colors.white : blackColor,
                        size: 88,
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}