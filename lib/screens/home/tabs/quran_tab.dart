import 'package:flutter/material.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/screens/home/widgets/recently_item.dart';
import 'package:islami/screens/sura_details/sura_details_screen.dart';
import '../../../core/cache_helper.dart';
import '../widgets/sura_item.dart';
import '../../../core/app_colors.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    super.initState();
    createSurasList();
    filteredSuras = allSuras;
  }

  List<String> surasName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];

  List<String> surasNameEnglish = [
    "Al-Fatihah",
    "Al-Baqarah",
    "Aal Imran",
    "An-Nisa",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajdah",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiyah",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'ah",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahanah",
    "As-Saff",
    "Al-Jumu'ah",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Layl",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyinah",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'ah",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas",
  ];

  List<int> surasVersesCount = [
    7, // Al-Fatihah
    286, // Al-Baqarah
    200, // Aal Imran
    176, // An-Nisa
    120, // Al-Maidah
    165, // Al-An'am
    206, // Al-A'raf
    75, // Al-Anfal
    129, // At-Tawbah
    109, // Yunus
    123, // Hud
    111, // Yusuf
    43, // Ar-Ra'd
    52, // Ibrahim
    99, // Al-Hijr
    128, // An-Nahl
    111, // Al-Isra
    110, // Al-Kahf
    98, // Maryam
    135, // Ta-Ha
    112, // Al-Anbiya
    78, // Al-Hajj
    118, // Al-Mu'minun
    64, // An-Nur
    77, // Al-Furqan
    227, // Ash-Shu'ara
    93, // An-Naml
    88, // Al-Qasas
    69, // Al-Ankabut
    60, // Ar-Rum
    34, // Luqman
    30, // As-Sajdah
    73, // Al-Ahzab
    54, // Saba
    45, // Fatir
    83, // Ya-Sin
    182, // As-Saffat
    88, // Sad
    75, // Az-Zumar
    85, // Ghafir
    54, // Fussilat
    53, // Ash-Shura
    89, // Az-Zukhruf
    59, // Ad-Dukhan
    37, // Al-Jathiyah
    35, // Al-Ahqaf
    38, // Muhammad
    29, // Al-Fath
    18, // Al-Hujurat
    45, // Qaf
    60, // Adh-Dhariyat
    49, // At-Tur
    62, // An-Najm
    55, // Al-Qamar
    78, // Ar-Rahman
    96, // Al-Waqi'ah
    29, // Al-Hadid
    22, // Al-Mujadila
    24, // Al-Hashr
    13, // Al-Mumtahanah
    14, // As-Saff
    11, // Al-Jumuah
    11, // Al-Munafiqun
    18, // At-Taghabun
    12, // At-Talaq
    12, // At-Tahrim
    30, // Al-Mulk
    52, // Al-Qalam
    52, // Al-Haqqah
    44, // Al-Ma'arij
    28, // Nuh
    28, // Al-Jinn
    20, // Al-Muzzammil
    56, // Al-Muddathir
    40, // Al-Qiyamah
    31, // Al-Insan
    50, // Al-Mursalat
    40, // An-Naba
    46, // An-Nazi'at
    42, // Abasa
    29, // At-Takwir
    19, // Al-Infitar
    36, // Al-Mutaffifin
    25, // Al-Inshiqaq
    22, // Al-Buruj
    17, // At-Tariq
    19, // Al-A'la
    26, // Al-Ghashiyah
    30, // Al-Fajr
    20, // Al-Balad
    15, // Ash-Shams
    21, // Al-Layl
    11, // Ad-Duha
    8, // Ash-Sharh
    8, // At-Tin
    19, // Al-Alaq
    5, // Al-Qadr
    8, // Al-Bayyinah
    8, // Az-Zalzalah
    11, // Al-Adiyat
    11, // Al-Qari'ah
    8, // At-Takathur
    3, // Al-Asr
    9, // Al-Humazah
    5, // Al-Fil
    4, // Quraysh
    7, // Al-Ma'un
    3, // Al-Kawthar
    6, // Al-Kafirun
    3, // An-Nasr
    5, // Al-Masad
    4, // Al-Ikhlas
    5, // Al-Falaq
    6, // An-Nas
  ];

  List<SuraModel> allSuras = [];
  List<SuraModel> filteredSuras = [];

  void createSurasList() {
    for (int i = 0; i < surasName.length; i++) {
      allSuras.add(
        SuraModel(
          versesCount: surasVersesCount[i],
          nameEn: surasNameEnglish[i],
          nameAr: surasName[i],
          suraIndex: i + 1,
        ),
      );
    }
  }

  void filterSuras(String query) {
    if (query.isEmpty) {
      filteredSuras = allSuras;
    } else {
      filteredSuras = allSuras.where((model) {
        return model.nameAr.contains(query) ||
            model.nameEn.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<int> displayMostRecent = CacheHelper.getList("items");
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 192),
            TextField(
              controller: searchController,
              onChanged: (value) {
                filterSuras(value);
              },
              cursorColor: AppColors.primary,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                prefixIcon: Image.asset(
                  'assets/images/ic_quran.png',
                  color: AppColors.primary,
                ),
                hintText: "Sura Name",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (displayMostRecent.isNotEmpty) ...[
              Text(
                "Most Recently",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: displayMostRecent.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return RecentlyItem(
                      model: SuraModel(
                        versesCount: surasVersesCount[displayMostRecent[index]],
                        nameEn: surasNameEnglish[displayMostRecent[index]],
                        nameAr: surasName[displayMostRecent[index]],
                        suraIndex: displayMostRecent[index] + 1,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
            ],
            Text(
              "Suras List",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => Divider(color: Colors.white, endIndent: 44, indent: 44),
                itemCount: filteredSuras.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      await CacheHelper.saveList(index);
                      setState(() {});
                      Navigator.pushNamed(
                        context,
                        SuraDetailsScreen.routeName,
                        arguments: filteredSuras[index],
                      );
                    },
                    child: SuraItem(model: filteredSuras[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
