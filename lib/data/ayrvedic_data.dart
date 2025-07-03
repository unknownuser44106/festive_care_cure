class AyurvedicMedicine {
  final String name;
  final String image;
  // final String description;
  final List<String> imageUrls;
  final String importance;
  final String curingProperties;

  AyurvedicMedicine(
      {required this.name,
      required this.image,
      // required this.description,
      required this.imageUrls,
      required this.importance,
      required this.curingProperties});
}

List<AyurvedicMedicine> ayurvedicMedicines = [
  AyurvedicMedicine(
      name: 'Tulsi',
      image: 'assets/picture/tulasi_icon.jpg',
      imageUrls: [
        'assets/picture/tulasi_one.jpg',
      ],
      importance:
          ''' Religious Significance: In Hindu tradition, tulsi is considered a sacred plant, often associated with the goddess Lakshmi.
       It is commonly grown in courtyards and temples, symbolizing purity and spiritual well-being. The plant is worshipped daily, especially by women, 
       and is believed to bring prosperity and divine blessings to the household.''',
      curingProperties: ''' Respiratory Health:

Tulsi is commonly used to alleviate respiratory issues like bronchitis and asthma. It acts as an expectorant, helping to clear mucus and ease breathing. 
FORTIS HEALTHCARE

Stress Relief:

Known as an adaptogen, tulsi helps the body cope with stress. Regular consumption may promote mental clarity and relaxation. 
CLEVELAND CLINIC

Anti-Inflammatory and Pain Relief:

Tulsi has natural anti-inflammatory properties, which can help reduce swelling and pain in the body. 
HEALTHLINE

Antimicrobial Activity:

The plant possesses antimicrobial qualities, aiding in the fight against infections and boosting the immune system. 
MERCK MANUALS

Metabolic Benefits:

Tulsi may help lower blood sugar levels and improve cholesterol, supporting overall metabolic health. 
CLEVELAND CLINIC

Incorporating tulsi into your daily routine, such as drinking tulsi tea, can offer these health benefits. However, it's advisable to consult with a healthcare professional before starting any new herbal regimen. '''),
  AyurvedicMedicine(
      name: 'Ashwagandha',
      image: 'assets/picture/ashwa.jpeg',
      imageUrls: [
        'assets/picture/ashwa.jpeg',
      ],
      importance:
          '''  Ashwagandha stands as a cornerstone herb in traditional Ayurvedic practice, revered primarily for its status as an adaptogen—a botanical that helps the body stabilize physiological processes and resist stressors. Its significance lies in its ability to modulate the HPA axis, the body’s stress response network. By lowering cortisol levels, it calms anxious minds and supports mental equilibrium, addressing modern-day stress and anxiety across diverse lifestyle
      ''',
      curingProperties: '''  Stress Reduction & Sleep Enhancement
Ashwagandha’s most celebrated clinical effect is in reducing stress and enhancing sleep. Studies have shown it lowers cortisol levels substantially, relieves anxiety symptoms, and improves sleep quality. One randomized trial reported a 72% improvement in sleep among users versus placebo .

Neuroprotection & Cognitive Support
Its withanolides serve as antioxidants in the brain—protecting neurons, reducing inflammation, and promoting memory, focus, and mental resilience. Clinical studies in healthy adults revealed significant improvements in memory and reaction time after consistent supplementation 
herbioom.com
+4
perfectbodyshape.co.uk
+4
radianthealthproject.org
+4
.

Physical Endurance & Muscle Recovery
Athletic individuals often turn to ashwagandha for its role in boosting energy, enhancing VO₂ max, and accelerating muscular recovery. Research confirms increases in muscle strength and size when combined with resistance training, likely fueled by both stress reduction and improved mitochondrial function 
reddit.com
+11
fullscript.com
+11
healingtravelers.com
+11
.

Anti-inflammatory & Antioxidant Action
Burning chronic inflammation underlies many modern diseases. Ashwagandha’s withaferin A compounds and other actives suppress inflammation and oxidative stress by inhibiting pro-inflammatory cytokines and neutralizing free radicals 
perfectbodyshape.co.uk
+3
pmc.ncbi.nlm.nih.gov
+3
reddit.com
+3
.

Hormonal Balance & Reproductive Health
The herb gently normalizes hormone levels: it has been shown to raise testosterone and luteinizing hormone in men, improve sperm health, and balance thyroid function in cases of hypothyroidism . Women also benefit from hormonal support through stress reduction and improved endocrine resilience .

Immune Modulation & Metabolic Support
Clinical and laboratory studies affirm ashwagandha’s ability to strengthen immune function—enhancing white blood cell activity and calming inflammatory overreactions. It also supports metabolic health by lowering blood sugar, managing lipid profiles, and stabilizing blood pressure—providing foundational wellness support .'''),
];
