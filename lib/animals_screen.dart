
import 'package:flutter/material.dart';
import 'category_details_screen.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({super.key});

  static const Map<String, List<String>> animalTypes = {

    'Wild Animals': [
      'Lion',
      'Tiger',
      'Elephant',
      'Giraffe',
      'Zebra',
      'Leopard',
      'Bear',
      'Wolf',
      'Fox',
      'Deer',
    ],

    'Pet Animals': [
      'Dog',
      'Cat',
      'Rabbit',
      'Hamster',
      'Guinea Pig',
      'Parrot',
      'Budgerigar',
      'Goldfish',
      'Turtle',
      'Ferret',
    ],

    'Farm Animals': [
      'Cow',
      'Buffalo',
      'Goat',
      'Sheep',
      'Horse',
      'Donkey',
      'Camel',
      'Chicken',
      'Duck',
      'Turkey',
    ],

    'Birds': [
      'Eagle',
      'Sparrow',
      'Peacock',
      'Parrot',
      'Pigeon',
      'Owl',
      'Kingfisher',
      'Flamingo',
      'Penguin',
      'Crow',
    ],

    'Reptiles': [
      'Snake',
      'Crocodile',
      'Alligator',
      'Lizard',
      'Gecko',
      'Chameleon',
      'Tortoise',
      'Turtle',
      'Iguana',
      'Monitor Lizard',
    ],

    'Aquatic Animals': [
      'Dolphin',
      'Whale',
      'Shark',
      'Octopus',
      'Jellyfish',
      'Sea Turtle',
      'Seahorse',
      'Starfish',
      'Clownfish',
      'Stingray',
    ],

    'Insects': [
      'Butterfly',
      'Honey Bee',
      'Ant',
      'Ladybug',
      'Dragonfly',
      'Grasshopper',
      'Beetle',
      'Mosquito',
      'Housefly',
      'Moth',
    ],

    'Amphibians': [
      'Frog',
      'Toad',
      'Salamander',
      'Newt',
      'Tree Frog',
      'Bullfrog',
      'Poison Dart Frog',
      'Axolotl',
      'Caecilian',
      'Fire Salamander',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Categories'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          categoryItem(
            context,
            'Wild Animals',
            'https://images.openai.com/static-rsc-4/_iWvX2Spo5KLatUY1686_Di9WlNOBpTBgvOZanpfZ1lAHBxBjXoT48OTAx-MubDKizBYuvHEYnTC6ZtCDqHKETCM6mVil3FjVeiHkSmqQy0Ka4xWawhDqpiuDSzbBbN7cLft6ylac7E4b5FFAW3YTi6_KW_Gsna6EVagkf9xZ5TvJXdLhh0Buxx0a24cNom3?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Pet Animals',
            'https://images.openai.com/static-rsc-4/VGB9WnWThbIQZA_QigMVY3kKKdGMtIX_0DF5xlDy1Uhbo9D9RVyrw3s1Ang3YThOJBalscrUE-Kd7UlD1PQPC3uUFUwvtpUcN1shFNNPpWquUV87Bq2vYBSzVF4cOmqik5IW4MxQph1pbk5xs8q4SovkmYK-s38szqXabUjLS48?purpose=inline',
          ),

          categoryItem(
            context,
            'Farm Animals',
            'https://images.openai.com/static-rsc-4/zmwCF_FwVOyFf5o_iTd4TbAcZ8GUv6TDeVFubnt5nV4C8Kjo6oEMxSUCvTuJVcCwTXAL7h001IfJk8Gvm8J4U54hg2fwXt0Tz7JVicIcdyDXfsZJF_85gpj7jYN8bDJyDfm7Uzr58nOT5EoBNigNvR_7BLxTuSF30fO1LrJVH4XeUqIaH3oW3OjiKZsLGhLD?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Birds',
            'https://images.openai.com/static-rsc-4/3mfSq5ma1QM7ZTZxBml0Qt2DF4Y2L63omMNkB6_YwYh_cqGk0ogcU51TNdwzz-cBL88OhjrYPUF4FGZ-UM7R3TQHt3gaaUrsO0ncAqGntLy92wyaYPh0mue466FqBe-cfweHkYxBm523VjStc4UKa-4t507TY5lma_t-kiIb1F0?purpose=inline',
          ),

          categoryItem(
            context,
            'Reptiles',
            'https://images.openai.com/static-rsc-4/cZs2Vz5CBdJN4CJU7N3nMNiGipQnmuZPwnmtOt1y_y1HnmxMe4MKJYo_RdOA4vQz9Ftmj0qB2LNmyXSnNNfehxZaT_n-Ok1EWY5mFbN1S8rv8kA5rsLIEeMUSuhoMY-Vi5YxMHpybnlj8B_oHKP0rtua259h2XUM79_6iHb8F3mA1UA8uJB3m-B02Dj-me3U?purpose=fullsize',
          ),

          categoryItem(
            context,
            'Aquatic Animals',
            'https://images.openai.com/static-rsc-4/rDaWPjXu9cX4vIN_8KxQaMGv3ZNK4EQRJoGA_N0djAgd8lOif98sCPIM5uSDiX5CqZV2FFV7zxvlSLmzotevdzQFiyyGoaGgcM5W3ACIrpwvjHvlhkpY6AUtMbMUDZmoOfjbrHQcxgiOgH6Byu2dnKWbKi2OEyF5t1Tos-OWsEY?purpose=inline',
          ),

          categoryItem(
            context,
            'Insects',
            'https://images.unsplash.com/photo-1516548935905-c010645ff21d?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
          ),

          categoryItem(
            context,
            'Amphibians',
            'https://images.unsplash.com/photo-1559253664-ca249d4608c6?w=800',
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
                items: animalTypes[name]!,
                isPlant: false,
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
