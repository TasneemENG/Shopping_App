import 'package:animal_app/features/Home/presentation/views/Screens/cart_view.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import '../../../data/models/Products.dart';

class WidgetDetails extends StatefulWidget {
   Products product;


  WidgetDetails({super.key, required this.product});

  @override
  State<WidgetDetails> createState() => _WidgetDetailsState();
}

class _WidgetDetailsState extends State<WidgetDetails> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.arrow_back_ios,color: Colors.orange,),
                  ),
                ],
              ))
          ,
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
              
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  widget.product.title ?? 'Product Title', // Placeholder if title is null
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                SizedBox(height: 10,),
                Text("\$${widget.product.price?.toStringAsFixed(2) ?? '0.00'}", // Placeholder if price is null
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.orange,
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
              Cart_widgrt.addFavorite(

                 Products(id:widget.product.id,
                   title:widget.product.title,
                   description:widget.product.description,
                   category:widget.product.category,
                   price:widget.product.price,
                   discountPercentage:widget.product.price,
                   rating:widget.product.rating,
                   stock:widget.product.stock,
                   tags:widget.product.tags,
                   brand:widget.product.brand,
                   sku:widget.product.sku,
                   weight:widget.product.weight,
                   dimensions:widget.product.dimensions,
                   warrantyInformation:widget.product.warrantyInformation,
                   shippingInformation:widget.product.shippingInformation,
                   availabilityStatus:widget.product.availabilityStatus,
                   reviews:widget.product.reviews,
                   returnPolicy:widget.product.returnPolicy,
                   minimumOrderQuantity:widget.product.minimumOrderQuantity,
                   meta:widget.product.meta,
                   images:widget.product.images,
                   thumbnail:widget.product.thumbnail,));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart_view()));

            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 30,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.orange,
                  ),
                ),
                Center(child: Text("Add To Card",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15,),)),

              ],

            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}