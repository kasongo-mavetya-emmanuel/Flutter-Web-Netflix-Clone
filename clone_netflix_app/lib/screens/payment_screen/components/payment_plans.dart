import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/providers/products/product_provider.dart';
import 'package:clone_netflix_app/providers/products/product_state.dart';
import 'package:clone_netflix_app/providers/subscription/pay_subscription_provider.dart';
import 'package:clone_netflix_app/providers/subscription/pay_subscription_state.dart';
import 'package:clone_netflix_app/utils/error_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'as fbAuth;
import 'package:provider/provider.dart';


class PaymentPlans extends StatefulWidget {
  const PaymentPlans({Key? key}) : super(key: key);

  @override
  State<PaymentPlans> createState() => _PaymentPlansState();
}

class _PaymentPlansState extends State<PaymentPlans> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loadProducts();
  }
  // loadProducts()async{
  //   try{
  //     WidgetsBinding.instance!.addPostFrameCallback((_) async {
  //       await context.read<ProductProvider>().getProduct();
  //     });
  //
  //   }on CustomError catch(e){
  //     errorDialog(context, e);
  //   }
  //
  // }
  @override
  Widget build(BuildContext context) {
    final products= context.watch<ProductProvider>().state;
    print('rvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv${products}');
    final paySubscription= context.watch<PaySubscriptionProvider>().state;

    if(products.productStatus==ProductStatus.loading){
      return Center(child: CircularProgressIndicator(),);
    }else if(products.productStatus== ProductStatus.error){
      errorDialog(context, products.error!);
    }

    return Row(
        children: List.generate(products.Products.length, (index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            width: 300,
            height: 600,
            child: paymentPlan(context, products, index, paySubscription),
            decoration: BoxDecoration(
              color: Colors.black54.withOpacity(0.8),
            ),
          );
        }
        )
    );
  }

  _submit(String priceId)async{
    try{
      await context.read<PaySubscriptionProvider>().paySubscription(priceId,);

    }on CustomError catch(e){
      errorDialog(context, e);
    }

  }


  Widget paymentPlan(BuildContext context, ProductState products, int index, paySubscription){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('/${products.Products[index].period}', style: Theme
            .of(context)
            .textTheme
            .headline2!
            .copyWith(fontWeight: FontWeight.w600),),
        SizedBox(height: 20,),
        Text('${products.Products[index].price.toString()} ${products.Products[index].currency}',style:Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w600)),
        SizedBox(height: 100,),
        Center(
          child: TextButton(
              onPressed: paySubscription.paySubscriptionStatus== PaySubscriptionStatus.submiting?null: ()async{
               await _submit(products.Products[index].id);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent[700],
                padding:EdgeInsets.symmetric(vertical: 25,horizontal: 25),
              ),
              child: Text('Pay Now', style:Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),)),
        ),
        SizedBox(height: 5,),

      ],
    );
  }
}
