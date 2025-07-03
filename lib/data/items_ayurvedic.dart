class AyurvedicItem {
  final String name;
  final String description;
  final List<String> imageUrls;
  final double price;
  final List<String> items;
  final String icon;

  AyurvedicItem({
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.price,
    required this.items,
    required this.icon,
  });
}

// Example data for Ayurvedic items
List<AyurvedicItem> ayurvedicItems = [
  AyurvedicItem(
    name: "Ashwagandha",
    icon: 'assets/picture/ashwa.jpeg',
    description:
        "Ashwagandha (Withania somnifera), also known as Indian ginseng or winter cherry, is a small shrub native to India, the Middle East, and parts of Africa. For over 6,000 years, its root has been a cornerstone of Ayurvedic medicine—praised for balancing mind, body, and spirit. The name “ashwagandha” combines the Sanskrit words for “horse” (ashwa) and “smell” (gandha), a nod to the root’s distinctive aroma and the strength it's said to bestow upon those who use it, much like a hors",
    imageUrls: [
      'assets/picture/ashwa.jpeg',
    ],
    price: 1000,
    items: ['tabcd ef der', 'tor123445ana', 'deepas', 'flowrs', 'powders'],
  ),
  AyurvedicItem(
    name: "Tulsi",
    icon: 'assets/icons/tulasi_icon.jpg',
    description:
        "Tulasi, commonly called holy basil (Ocimum tenuiflorum), is far more than just a fragrant herb—it’s one of the most sacred plants in Hinduism, weaving together profound spiritual, medicinal, and cultural dimensions. Its relevance stretches back into the Rig Veda (c. 1500 BCE), where it’s praised for its sanctifying properties, and classical Ayurvedic texts like the Charaka and Sushruta Samhitas highlight its healing virtues .",
    imageUrls: ["assets/picture/tpacked.jpeg"],
    price: 2000,
    items: [
      'tureici klmn jahsdfbhjk  egfgfgdfseder',
      'torana',
      'deepas',
      'flowrs',
      'powders'
    ],
  ),
];
