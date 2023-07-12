import 'package:flutter/material.dart';

final shimmerGradient = LinearGradient(
  colors: [
    Colors.grey[400]!,
    Colors.grey[200]!,
    Colors.grey[400]!,
  ],
  stops: const [
    0.4,
    0.5,
    0.6,
  ],
  begin: const Alignment(-1.0, -0.3),
  end: const Alignment(1.0, 0.3),
);
