
import 'package:flutter/material.dart';
import 'category_details_screen.dart';

class PlantsScreen extends StatelessWidget {
  const PlantsScreen({super.key});

  static const Map<String, List<String>> plantTypes = {
    'Indoor Plants': [
      'Money Plant',
      'Snake Plant',
      'Peace Lily',
      'Spider Plant',
      'Areca Palm',
      'ZZ Plant',
      'Aloe Vera',
      'Rubber Plant',
      'Boston Fern',
      'Jade Plant',
    ],

    'Outdoor Plants': [
      'Rose',
      'Hibiscus',
      'Bougainvillea',
      'Jasmine',
      'Marigold',
      'Petunia',
      'Sunflower',
      'Lavender',
      'Ixora',
      'Chrysanthemum',
    ],

    'Medicinal Plants': [
      'Neem',
      'Tulsi',
      'Aloe Vera',
      'Mint',
      'Ashwagandha',
      'Turmeric',
      'Ginger',
      'Lemongrass',
      'Amla',
      'Giloy',
    ],

    'Fruit Plants': [
      'Mango',
      'Apple',
      'Guava',
      'Lemon',
      'Orange',
      'Pomegranate',
      'Banana',
      'Papaya',
      'Grapes',
      'Strawberry',
    ],

    'Vegetable Plants': [
      'Tomato',
      'Potato',
      'Onion',
      'Brinjal',
      'Cucumber',
      'Chili',
      'Spinach',
      'Carrot',
      'Cabbage',
      'Cauliflower',
    ],

    'Cactus & Succulents': [
      'Saguaro Cactus',
      'Barrel Cactus',
      'Bunny Ear Cactus',
      'Christmas Cactus',
      'Aloe Vera',
      'Echeveria',
      'Jade Plant',
      'Haworthia',
      'Sedum',
      'String of Pearls',
    ],

    'Flowering Plants': [
      'Rose',
      'Sunflower',
      'Marigold',
      'Hibiscus',
      'Jasmine',
      'Tulip',
      'Lily',
      'Orchid',
      'Daisy',
      'Petunia',
    ],

    'Trees': [
      'Neem Tree',
      'Banyan Tree',
      'Peepal Tree',
      'Oak Tree',
      'Maple Tree',
      'Pine Tree',
      'Cedar Tree',
      'Eucalyptus Tree',
      'Coconut Tree',
      'Date Palm',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Categories'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          categoryItem(
            context,
            'Indoor Plants',
            'https://images.openai.com/static-rsc-4/H4drrei2CZ5BKvhUDUp734NrZ1iZVmPuq8fQNwYZ-8W42BK_XkUj2TLpwIv3zeXre9Y-Ni4K4qFPRJBLtw2X36j58Sw51RfgyO3FJnWqBO5yKReM2Ipo-Rd_RuBUECnGAzAKglcK0zqL5E_pUpDI0doQ0P0Bare41E71yKb7KoyZidRyEEn4Tc0SKGp7SInK?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Outdoor Plants',
            'https://images.openai.com/static-rsc-4/WkIiU699fHsCDPrV1OLtsSR53xGexoq2QV0BpECMGwUfVO1WYLuEU8HRFLWbz-6bGRTZpm7va5ldm0bXAneTNgC290L-wBSaQEoVD-7LtE1bHyAr1BiuOsQPLeUegYO9cLLLJUOhlxDKw232HKm4TWFX-u8Kp2mK7JwryXkfSg2oMuoKK3l4tTUVZzrFsiPA?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Medicinal Plants',
            'https://images.openai.com/static-rsc-4/hTs3v1De9qtE0WzyTJ4Ikd9PUpVJNL8ZU7vkoX2T7-X5BMikREQQX4LdFcU_zWqRF-ufNaqoBHmZxb36QxSbarKz155akytIsoQKHeNfqSRcBEkVu6nPbkcoxKFBXzstCeu4LbYS54e86zPiAKgO1wEyKdAK-VmaO114_VM6w6sj30BPMuBlhNPmBmr9YiFE?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Fruit Plants',
            'https://images.openai.com/static-rsc-4/bxBWeAIF0Nqcbn2lvzrw-wl9irMbirfbGyIrQfjembkO_PyebiW_uQjxg-NsZk6eBVYL2ycrtOkG3J-MUMXrAgCgM2V5R5SniPMr1NB_KpaML8Da9pkJ002p_vlIPaTpARepJEa2v7mwxjaBF4h_WZerDTPVkJ3Jt62F31HNKJhmf7zjPvywwRDaH_ONrrpb?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Vegetable Plants',
            'https://images.openai.com/static-rsc-4/C5MuHr8EHpPXhvrOTo1wYaiXT7gkHeXlP7gbdBwoKDojPapOw1GCg44zerZwaaX0Nmm30IVsMRHQzU7stO0EkoyivCcpQfQ3RorRWLOkt3Qkgms54_AR_lkkKphPKPOs-Rb-NrMDp7ZNEHYjsQssN0yEHPsM19NtTX6caYiNvafyY9_FYcWvenvWRdC6L3ek?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Cactus & Succulents',
            'https://images.openai.com/static-rsc-4/19xZLW13i9EjG-oAtUzemH3kOAZakCcj0v-uafN9IhAFv7gmdrtn7SmHrUuHl3tOBtjRuOemfaub8werH2BIN0E0NOcf9o9JGYfeMWgMWCAT8VBnldmZnQQBGJ4-MbcOcRWv8hQ9gpqpye4G1N86O7jkub2CWVL1NmqalY8cRGpBLR6E1NOL7ltJ7pjBEUwE?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Flowering Plants',
            'https://images.openai.com/static-rsc-4/HDfvK7Mh1P0qQymxT5u8WtSCCwsTGCQyqLoDW3pQOUTdd2SAL7UJmy5J0h4B_KfngdtpKpnbsCnF8Mip9x70aRIrNDkpUsh4yvrV9AVJC_lHd9oNCOndQ8JJC_dx-EYzsP_zff6eWI51qyvmV9chcgCZvZ5sqIEKkObMtOUrGls?purpose=inline',
          ),

          categoryItem(
            context,
            'Trees',
            'https://images.openai.com/static-rsc-4/2TnA_kgFqg8BktmO1XkZ_tV7fcuPorJe7qDk9lIbrSM8DjqS1c1uIESlMw4NjmbAN7gl9Epqn4YSF_NSAzdZRtfKg2Nnwn0LRh40Tk7YkwPXBSqr-fvnMouA2woZgcyjgYDo9TyaSNWQwr8QomaYPrsQKDC0JEUVYuF1nRsieKM?purpose=inline',
          ),

        ],
      ),
    );
  }

  Widget categoryItem(
      BuildContext context,
      String name,
      String url,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailsScreen(
                title: name,
                items: plantTypes[name]!,
                isPlant: true,
              ),
            ),
          );
        },

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.network(
              url,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 180,
                  child: Center(
                    child: Text('Image failed to load'),
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
