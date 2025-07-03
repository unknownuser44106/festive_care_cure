class FestiveItem {
  final String name;
  final String description;
  final List<String> imageUrls;
  final double price;
  final List<String> items;
  final String icon;

  FestiveItem({
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.price,
    required this.items,
    required this.icon,
  });
}

List<FestiveItem> itemsFest = [
  FestiveItem(
    name: "Ugadi",
    icon: 'assets/picture/ugadi_icon.jpg',
    description:
        '''1.Decorating doorways with mango leaves, called toranas, is a common custom during Ugadi. This tradition is believed to bring good luck and happiness into the home.
    Fresh mango leaves represent new beginnings and the arrival of spring.
    2.During Ugadi, people make colorful patterns on the floor called rangoli or muggu. These designs are created using colored powders to welcome guests and gods. 
    They are believed to bring good luck and positive energy into the home.
    3.Lighting oil lamps, or deepas, during Ugadi represents the dispelling of darkness and ignorance, ushering in light and knowledge. 
    This practice aligns with the festival's theme of new beginnings and enlightenment.
    4.Consuming a mixture of neem and jaggery, known as Bevu Bella in Kannada, is a unique Ugadi tradition. This combination embodies the different experiences of life—bitterness
     from neem and sweetness from jaggery—reminding individuals to embrace all aspects of life in the coming year.
     ''',
    imageUrls: [
      "assets/picture/ugadi_one.jpg",
      "assets/picture/ugadi_two.jpg",
      "assets/picture/ugadi_three.jpg",
      "assets/picture/ugadi_four.jpg"
    ],
    price: 300,
    items: [
      'Mango leaves Torana',
      'Rangoli Colours',
      'Deepas',
      'Neem and Jagry'
    ],
  ),
  FestiveItem(
    name: "Holi",
    icon: 'assets/icons/holy.jpg',
    description:
        ''' 1.Rangoli is a traditional Indian art form where people create intricate patterns on the ground using colored powders, rice, or flower petals. These designs are believed to bring good luck and are a way to welcome guests and deities into the home.
    Rangoli is commonly made during festivals like Diwali and Pongal
    2.Hanging mango leaves at the entrance of homes during festivals like Ugadi is a traditional practice in Hindu culture. These fresh green leaves are considered auspicious and symbolize prosperity. They represent renewal and are believed to invite positive energy into the household.
    This custom of decorating with natural elements like leaves and flowers is mentioned in various Hindu rituals, emphasizing purity and the welcoming of deities
    3.Lighting oil lamps during Diwali, also called the festival of lights, represents the victory of good (light) over evil (darkness) and wisdom (knowledge) over ignorance. Lighting diyas in homes is believed to remove negativity and bring prosperity.
      In Hindu traditions, light is often used in rituals to show the presence of the divine and symbolize purity.
    4.Decorating deities and homes with garlands of flowers like marigolds and jasmine during festivals shows respect, purity, and reminds us of how life is temporary.
     Flowers are offered to the divine as a symbol of beauty.
    5.''',
    imageUrls: [
      "assets/picture/holi_one.jpg",
      "assets/picture/ugadi_one.jpg",
      "assets/picture/ugadi_three.jpg",
      "assets/picture/holi_two.jpg",
    ],
    price: 400,
    items: [
      ' Rangoli (Kolam) ',
      'Mango Leaf Toranas',
      'Diyas (Oil Lamps)',
      'Floral Garlands'
    ],
  ),
  FestiveItem(
    name: "Diwali",
    icon: 'assets/picture/devali_icon.jpg',
    description:
        '''  1. Diyas (Oil Lamps): Lighting small lamps (diyas) is a key tradition during Deepavali. These lamps represent the victory of light over darkness and good over evil. They are also believed to bring wealth and remove ignorance.
    Although the Puranas don't directly mention diyas during Deepavali, their meaning fits well with the festival's spirit.
     
   2 .Rangoli (Kolam): Rangoli is a beautiful art of making patterns on the floor using colors, rice, or flowers. It's thought to bring good energy into the home and welcome guests and gods. Even though the Puranas don't talk about Rangoli,
      it fits with the festival's focus on beauty and good fortune.
    
    3 .Torans (Door Hangings): Torans are decorative garlands made from marigold flowers and mango leaves, hung on doorways. They symbolize good luck and are believed to keep bad spirits away. 
    Though not mentioned in the Puranas, using natural decorations like this is common in Hindu culture.

    4 .Goddess Lakshmi and Ganesha Idols: During Deepavali, people worship idols of Goddess Lakshmi (goddess of wealth) and Lord Ganesha (god who removes obstacles). While the Puranas don't specifically talk about these idols during Deepavali,
    they are important because they represent prosperity and good luck.
      
      ''',
    imageUrls: [
      "assets/picture/ugadi_three.jpg",
      "assets/picture/ugadi_two.jpg",
      "assets/picture/ugadi_one.jpg",
      "assets/picture/holi_two.jpg",
      "assets/picture/ganesh.webp",
    ],
    price: 500,
    items: [
      'Diyas (Oil Lamps)',
      'Rangoli (Kolam):',
      'Torans (Door Hangings)',
      'flowers',
      'Goddess Lakshmi and Ganesha Idols',
    ],
  ),
  FestiveItem(
    name: "Makar Sankranti",
    icon: 'assets/icons/sankranti.jpg',
    description:
        '''  1. Beautiful floor patterns crafted with rice flour, colored powders, or flower petals around the home and temple entrance, often shaped like suns, geometric motifs, or footprints. These designs are believed to invite divine grace—especially Lakṣmī—and delight the solar deity, aligning with the festival’s theme of surya-prāpti (receiving the sun), symbolizing purity, good fortune, and spiritual illumination
     
    2 .Strings of mango or banana leaves interspersed with marigold, jasmine, or turmeric blossoms hang across thresholds. In Vedic and temple-sāṁskṛta traditions, torans sanctify and energize the entrance, acting as auspicious barriers against negativity and welcoming prosperity into the home .
    3 .Earthen or brass oil lamps (often with sesame oil), fairy lights, lanterns, or floating candles brighten spaces. Fire is sacred to Agni and Surya—illuminating the path of wisdom (jñāna), purifying both mind and space, and representing the triumph of light over darkness as Sankranti ushers in Uttarāyaṇa .

    4 .Piles of harvested produce—sugarcane stalks, rice, wheat, turmeric, coconuts, bananas—are arranged near the puja area. These offerings express thanksgiving for the Rabi harvest and carry on the agrarian Vedic tradition of bali (offering) during homa and yajña rituals
    5 .Decorative kites, strings, or kite-themed wall–hangings are common, especially in western India. They reflect the joyous tradition of kite flying, symbolizing spiritual elevation and freedom, joyful participation in Uttarāyaṇa, and the communal spirit of celebration 
      ''',
    imageUrls: [
      "assets/picture/holi_one.jpg",
      "assets/picture/ugadi_one.jpg",
      "assets/picture/ugadi_three.jpg",
      "assets/picture/sugercane.jpg",
      "assets/picture/kite.jpg",
    ],
    price: 600,
    items: ['Rangoli', 'Torans ', 'Deepas', 'Sugarcane', 'Kite Motifs '],
  ),
  FestiveItem(
    name: "Maha Shivartri",
    icon: "assets/picture/shiva_intro.jpg",
    description:
        '''  1.entral to the festival, the Liṅga is bathed (abhishek) with water, milk, yogurt, honey, and ghee in ritual chants—seen in the Śiva Purāṇa and Linga Purāṇa as the cosmic pillar of light and the union of Shiva–Parvati energies.It symbolizes infinite divine consciousness (Lingodbhava) and transcendent power.
    2 .Used for purifying the Liṅga and sacred space; this water—often from the Ganges—is believed to cleanse sins and uplift spiritual awareness as per tradition
    3 .Tri‑leafed Bel leaves are the most sacred offering for Shiva, representing his three eyes. Their repeated use in ritual emphasizes purity and divine favor
    4 .Chosen for purity and spiritual elevation, these flowers are traditional favorites for Shiva puja, symbolizing devotion and inner cleansing 
    5 .Decorative kites, strings, or kite-themed wall–hangings are common, especially in western India. They reflect the joyous tradition of kite flying, symbolizing spiritual elevation and freedom, joyful participation in Uttarāyaṇa, and the communal spirit of celebration 
    6 .Sprinkled on the Liṅga and applied by devotees, Vibhūti evokes Shiva’s ascetic identity and symbolizes purity, spiritual protection, and forgiveness .
    7 .Worn especially on Mahāśivarātri to deepen meditation and spiritual focus, these beads are linked to Shiva’s tears and enhance mindfulness on this potent night
      ''',
    imageUrls: [
      "assets/picture/linga.jpeg",
      "assets/picture/gangajala.jpeg",
      "assets/picture/leaves.jpeg",
      "assets/picture/white flowers.webp",
      "assets/picture/leaves.jpeg",
      "assets/picture/sacredash.webp",
      "assets/picture/rudraksha.jpeg"
    ],
    price: 700,
    items: [
      ' Siva‑Linga',
      'Ganga‑jala ',
      ' Bīlva Leaves',
      ' White Flowers (Dhatura, Madar, Lotus)',
      'Sacred Ash (Vibhūti/Bhasma)',
      ' Rudrākṣa Mala'
    ],
  ),
  FestiveItem(
    name: "Ganesha Chaturti",
    icon: "assets/picture/ganeshicon.jpg",
    description:
        '''  1.Devotees install a beautifully crafted clay or eco‑friendly idol of Lord Ganesh—representing the remover of obstacles and the embodiment of wisdom and new beginnings—usually placed on a raised chowki draped in a red cloth for elevated and respectful worship 
    2 .Fresh marigold, hibiscus, lotus, and jasmine flowers, along with durvā grass garlands, adorn the murti and altar. Marigold’s bright hues symbolize energy and purity; hibiscus and lotus mirror devotion; durvā—favored by Ganesha—quenches inner heat, relating to a legend in the Ganesha Purana
    3 .Rows of lighted oil or ghee lamps and camphor, along with incense sticks, purify the surroundings and invoke divine presence, signifying the removal of inner darkness and sustaining sacred atmosphere for recitation of Ganapati Atharvashirsha and Vedic hymns
    4 .Three‑blade durvā grass holds deep mythological significance: it calmed Ganesha’s fiery internal energy after defeating a demon. It is still offered in knot‑garlands as a key symbol of healing, purification, and divine protection 
    
      ''',
    imageUrls: [
      "assets/picture/idol.jpeg",
      "assets/picture/holi_two.jpg",
      "assets/picture/ugadi_three.jpg",
      "assets/picture/duleaves.webp"
    ],
    price: 1000,
    items: [
      'Ganesha Idol',
      'flowers',
      'deepas',
      'Durva Grass & Leaves',
    ],
  ),
  FestiveItem(
    name: "Krishna Janmhastami",
    icon: 'assets/picture/krishnaicon.jpg',
    description:
        '''  1.A lovingly adorned idol of infant Krishna (Bal Gopal) is placed on a decorative jhūlā, surrounded by silk or velvet draping and tiny cushions. It evokes Yashoda’s cradle, expressing tender devotion and the arrival of the divine child
    2 .Fresh marigold, hibiscus, lotus, and jasmine flowers, along with durvā grass garlands, adorn the murti and altar. Marigold’s bright hues symbolize energy and purity; hibiscus and lotus mirror devotion; durvā—favored by Ganesha—quenches inner heat, relating to a legend in the Ganesha Purana
    3 .Display miniature flutes and vibrant peacock feathers (mayūr pankh)—echoing Krishna’s iconic flute-playing and attire. These visually evoke his divine charm and musical grace
    4 .Fresh Tulsi leaves—beloved by Krishna—along with betel leaves and areca nuts enrich the offering platter, symbolizing purity and devotion in Vaishnava puja traditions 
    
      ''',
    imageUrls: [
      "assets/picture/kidol.jpeg",
      "assets/picture/holi_two.jpg",
      "assets/picture/fr.webp",
      "assets/picture/tl.jpeg"
    ],
    price: 1000,
    items: [
      'krishna idol',
      'Floral Torans',
      'Peacock Feather',
      'Tulsi Leaves',
    ],
  ),
  FestiveItem(
    name: "Dasara",
    icon: 'assets/picture/dai.jpg',
    description:
        '''  1 .In Karnataka and Tamil Nadu, decorative Gombe or Golu dolls depict gods, myth scenes, social life, and festive tableaux. This storytelling reflects cultural continuity and offerings of creativity and devotion
    2 .Fresh marigold, hibiscus, lotus, and jasmine flowers, along with durvā grass garlands, adorn the murti and altar. Marigold’s bright hues symbolize energy and purity; hibiscus and lotus mirror devotion; durvā—favored by Ganesha—quenches inner heat, relating to a legend in the Ganesha Purana
    3 .Rows of lighted oil or ghee lamps and camphor, along with incense sticks, purify the surroundings and invoke divine presence, signifying the removal of inner darkness and sustaining sacred atmosphere for recitation of Ganapati Atharvashirsha and Vedic hymns

      ''',
    imageUrls: [
      "assets/picture/dg.jpeg",
      "assets/picture/holi_2.jpg",
      "assets/picture/holi_two.jpg",
    ],
    price: 1000,
    items: ['Gombe', 'Floral Garlands & Torans', 'deepas'],
  ),
  FestiveItem(
    name: "Hanuman Jayanti",
    icon: 'assets/picture/boss.jpg',
    description:
        '''  1 .Fresh red flowers—like hibiscus and marigold—are used to creatively decorate the altar and the idol itself. These vibrant flowers signify courage and devotion, invoking Hanuman’s praised attributes .
    2 .Devotees apply red sindoor to the idol (and sometimes on themselves), honoring Hanuman’s legendary act of covering himself in Sītā’s sindoor—symbolizing immense love and undying devotion 
    3 .Oil lamps (diya), camphor flame aarti, incense sticks, sambrani cups, and dhoop fill the puja area with light and divine fragrance—cleansing the space and elevating the spiritual atmosphere
    4 .A copy of the Hanuman Chalisa or Rudra mantra, plus a Hanuman Yantra, is present near the idol for continuous chanting and spiritual focus throughout the celebrations
      ''',
    imageUrls: [
      "assets/picture/holi_two.jpg",
      "assets/picture/hsindur.jpeg",
      "assets/picture/ugadi_three.jpg",
      "assets/picture/hanumanchalis.jpeg"
    ],
    price: 1000,
    items: [' Flowers ', ' Sindoor (Vermilion)', 'deepas', 'Hanuman Chalisa'],
  ),
];
