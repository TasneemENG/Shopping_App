import 'package:flutter/material.dart';
import '../../../data/models/Products.dart';

class WidgetDetails extends StatefulWidget {
  final Products product;

  const WidgetDetails({super.key, required this.product});

  @override
  State<WidgetDetails> createState() => _WidgetDetailsState();
}

class _WidgetDetailsState extends State<WidgetDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              /*boxShadow: [
                BoxShadow(
                  color: Colors.orangeAccent.withOpacity(0.25), // Shadow color
                  offset: Offset(0, 4), // Horizontal and vertical offset of the shadow
                  blurRadius: 10, // Blur radius
                  spreadRadius: 2, // Spread radius
                ),
              ],*/
            ),
            child: Image.network(
              widget.product.images?.first ?? 'https://via.placeholder.com/150',
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.title ?? 'Product Title', // Placeholder if title is null
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                Text("\$${widget.product.price?.toStringAsFixed(2) ?? '0.00'}", // Placeholder if price is null
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.product.description ?? 'Product description',maxLines: 2,overflow: TextOverflow.ellipsis, // Placeholder if title is null
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black26,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),),
          ),
          SizedBox(height: 7,),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("Brand:",style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900),),
                SizedBox(width: 5,),
                Text(
                  widget.product.brand ?? 'Product brand', // Placeholder if title is null
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),),
              ],
            ),
          ),
          SizedBox(height: 7,),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("DisCount:",style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900),),
                SizedBox(width: 5,),
                Text(
                  "${widget.product.discountPercentage?.toStringAsFixed(2)} %" ?? '0.0', // Placeholder if title is null
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),),
              ],
            ),
          ),
          SizedBox(height: 8,),
      InkWell(
        onTap: (){

        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 30,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.black,
              ),
            ),
            Center(child: Text("Add To Card",style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.normal, fontSize: 15,),))
          ],

        ),
      ),
        ],
      ),
    );
  }
}