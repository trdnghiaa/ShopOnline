import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopvippro_demo/themes/colors.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({super.key});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
//quantity
  int quantityCount = 0;
//decrement Quantity
  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

//increment Quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of item details
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                //image
                Image.network(
                  'https://media3.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/October2023/Ao_ni_oversize_basic_84RISING_-_mau_Xanh_duongshoadw2_copy.jpg',
                  height: 400,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 5,
                ),
                //rate
                Row(
                  children: [
                    //star icon
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //number
                    Text(
                      '4.9',
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //name item
                Text(
                  'Áo Mùa Hè Cao Cấp',
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                const SizedBox(
                  height: 20,
                ),
                //description
                Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '#oversize #unisex #freesize #streetwear #aothunnamnu #bbr #aothuncaocap #aothunamnudep #aothunnam  #aothunbestquality  #aothun #aothunnam #aothunnu #aothunnamnu #aothununisex #aohottrend   #ao #aothun #nam #nu #form #aothunstreetwear #aothunburberrynam #aothunburberrynu  #bbr #aoburberrynam #aoburberrynu #aoburberry #aophongnam #aophongnu #aoburberry',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 14, height: 2),
                ),
                // const SizedBox(height: 20,)
              ],
            ),
          )),
          Container(
            color: primaryColor,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "\$ " + '149.000 VNĐ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            color: Colors.white,
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                            onPressed: incrementQuantity,
                          ),
                        )
                        //quantity count

                        //plus button
                      ],
                    )
                    // quantity
                  ],
                ),
                //add to cart button
                ElevatedButton(onPressed: () {}, child: Text('Add to cart'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
