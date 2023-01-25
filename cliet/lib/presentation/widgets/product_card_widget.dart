import 'package:flutter/material.dart';
import 'package:shop/data/models/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.transparent),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                image: DecorationImage(
                  image: Image.network(
                    'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0347d890-b837-475f-a1eb-850d09e7bd28/air-force-1-07-shoes-x9rqBh.png',
                  ).image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: const TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            product.description,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
