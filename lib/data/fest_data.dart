class Festival {
  final String name;
  final String icon;
  final String month;
  final List<String> imageUrls;
  final String importance;
  final String puranicNarratives;
  final String storyBehindFest;

  Festival({
    required this.name,
    required this.icon,
    required this.month,
    required this.imageUrls,
    required this.importance,
    required this.puranicNarratives,
    required this.storyBehindFest,
  });
}

List<Festival> festivals = [
  Festival(
      name: 'Makar Sankranti',
      icon: 'assets/icons/sankranti.jpg',
      imageUrls: [
        'assets/picture/sankranti_info.jpg',
        'assets/picture/sankranti_info.jpg'
      ],
      storyBehindFest:
          '''Makar Sankranti, especially on the third day known as Kanuma, it is customary to decorate and honor cattle and other domestic animals.
             This practice is prevalent in regions like Andhra Pradesh and Telangana. On Kanuma, cattle are adorned with colorful decorations, offered special meals, and worshipped as a mark of respect and gratitude for their role in agriculture.''',
      importance:
          '''Makar Sankranti celebrates the Sun moving into the Capricorn zodiac sign (Makara), marking the end of winter and the beginning of longer days.

This time, called Uttarayana, is considered very lucky in Hindu tradition. 
The festival happens when the Sun moves from the southern to the northern hemisphere which holds deep spiritual meaning.
              ''',
      puranicNarratives:
          '''The Puranas describe that on Makar Sankranti, the Sun visits the house of his son, Shani (Saturn), who is the lord of Capricorn. This annual visit symbolizes the importance of the father-son relationship and is considered a time for reconciliation and harmony.  ''',
      month: 'January'),
  Festival(
      name: 'Shivaratri',
      icon: 'assets/picture/shiva_intro.jpg',
      imageUrls: [
        'assets/picture/shiva_one.jpg',
        'assets/picture/shiva_two.jpg',
        'assets/picture/shiva_three.jpg',
        'assets/picture/shiva_four.jpg',
      ],
      storyBehindFest:
          ''' Marriage of Shiva and Parvati: One prominent legend narrates that Maha Shivaratri marks the divine marriage between Lord Shiva and Goddess Parvati. This union symbolizes the harmonious balance between the masculine and feminine energies of the universe. 

Shiva's Cosmic Dance: Another legend describes Maha Shivaratri as the night when Lord Shiva performed the cosmic dance of creation, preservation, and destruction, known as the Tandava. This dance represents the continuous cycle of the universe. 

Overcoming Darkness and Ignorance: Maha Shivaratri is also seen as a time to overcome darkness and ignorance in one's life. Devotees engage in fasting, meditation, and prayers to seek spiritual enlightenment and liberation.''',
      importance:
          '''Maha Shivaratri is considered an auspicious night for spiritual awakening and the purging of past sins. Devotees observe fasts, perform rituals, and engage in prayers to seek blessings from Lord Shiva. 
The night is believed to be a time when the universe is in a state of balance, making it ideal for meditation and self-reflection. 
. ''',
      puranicNarratives:
          '''Maha Shivaratri is mentioned in several Puranas, particularly the Skanda Purana, Linga Purana, and Padma Purana. 
These texts present different versions associated with this festival, such as fasting and offering reverence to a lingam—an emblematic figure of Shiva.
      
In essence, Maha Shivaratri is a time for devotees to seek blessings from Lord Shiva, engage in self-reflection, and strive for spiritual advancement.
       ''',
      month: 'February'),
  Festival(
      name: 'Ugadi(The New Year)',
      icon: 'assets/picture/ugadi_icon.jpg',
      imageUrls: [
        'assets/picture/ugadi_icon.jpg',
      ],
      storyBehindFest:
          '''Historically, the festival aligns with the Śālivāhana Śaka era, established around 78 CE by Śālivāhana (Gautamiputra Satakarni), marking the victory of a righteous dynasty—and this triumph is celebrated annually on Ugādi ''',
      importance:
          '''Falling just after the spring equinox and the sun’s entry into Aries (Mesha Saṅkrānti), Ugādi harmonizes celestial motion with seasonal rebirth. It aligns with the reawakening of nature, fresh harvests, and the cycle of planting . ''',
      puranicNarratives:
          '''  In the Vishnu Purāṇa and Mahābhārata, it’s narrated that when Lord Krishna departed at the close of the Dvāpara Yuga, Kaliyuga commenced—highlighting the cycle of time and moral transitions  ''',
      month: 'April'),
];
