import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/utiltes/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract final class MostRecentSurasPrefs {
  static const suraKey = "suras";

  static List<SuraDM> surasList = [];

 static Future loadSurasList() async { ///شرح دا كلو بالتفصيل تتحت بالحرف
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> currentSurasList = prefs.getStringList(suraKey) ?? [];
    surasList = currentSurasList
        .map((string) => AppConstants.suras[int.parse(string) -1 ])
        .toList().reversed.toList(); ///reversed بتعكس الليستة يعني الي مكتوبة في الاخر تبقا في الاول
  }

  static Future addSuraToPrefs(SuraDM sura) async {///دية هيا لما المستخدم يدوس علي السورة والمفروض تتحفظ
    ////ودا كمان شرح دا كلو بالتفصيل تتحت بالحرف
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> oldSuras = prefs.getStringList(suraKey) ?? [];
    if(oldSuras.contains((sura.index.toString()))){
      oldSuras.remove(sura.index.toString());
      oldSuras.add(sura.index.toString());
    }else{
      oldSuras.add(sura.index.toString());
    }

    prefs.setStringList(suraKey, oldSuras);
    await loadSurasList(); ///انا هنا بعد الاد بقولوا حمللي اليستة تاني من جواة شير بريفرنسيس
  }
}
///شرح تفصيلي للانا عملتوة
///static loadSurasList() async { انا كتبتها لية عشان اعرف استخدم الفانكشن دية ونفس الكلام في التانية static
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String> currentSurasList = prefs.getStringList(suraKey) ?? [];
//   surasList = currentSurasList
//       .map((string) => AppConstants.suras[int.parse(string)])
//       .toList();
// }

/// الشرح التفصيلي
// async
// يجعل الدالة تُرجِع Future ويتيح استخدام await.

// await SharedPreferences.getInstance()
// يحصل على Singleton من SharedPreferences (فتح الملف المخزَّن على الجهاز).

// prefs.getStringList(suraKey)
// يقرأ قيمة مفتاح suras، المتوقَّع أن تكون List<String> (مثل ["0","2","5"]).

// ?? []
// إذا كانت القيمة null (أي لم يُحفظ شيء بعد)، استخدم قائمة فارغة كافتراضي.

// .map(...)
// يحوِّل كل String (مثلاً "5") إلى كائن SuraDM من المصفوفة الثابتة AppConstants.suras عن طريق int.parse.

// .toList()
// يعيد النتيجة كـ List<SuraDM> تُخزَّن في المتغيّر الساكن surasList

///------------------------------------

///static addSuraToPrefs(SuraDM sura) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String> oldSuras = prefs.getStringList(suraKey) ?? [];
//
//   oldSuras.add(sura.index.toString());
//
//   prefs.setStringList(suraKey, oldSuras);
// }
///الشرح التفصيلي
// 1
// addSuraToPrefs(SuraDM sura) async {
// دالة اسمها addSuraToPrefs تستقبل كائن SuraDM يمثّل السورة التي اختارها المستخدم. الكلمة async تعني أن الدالة ستُرجِع Future ونستطيع بداخلها استخدام await.

// 2
// final SharedPreferences prefs = await SharedPreferences.getInstance();
// 1️⃣ نستدعي SharedPreferences.getInstance() للحصول على النسخة الوحيدة المسؤولة عن القراءة/الكتابة في ملف التخزين.2️⃣ نكتب await لأن العملية تستغرق بعض أجزاء من الثانية للوصول للملف.3️⃣ نحفظ النسخة في متغيّر prefs.

// 3
// List<String> oldSuras = prefs.getStringList(suraKey) ?? [];
// 1️⃣ نطلب من prefs أن يعطينا القيمة المخزَّنة تحت المفتاح suraKey (قيمته "suras").2️⃣ المتوقّع أن تكون قائمة نصوص (List<String>).3️⃣ لو المفتاح غير موجود (أول مرة)، الدالة ترجع null؛ نضع بعده ?? [] يعني “استبدل بـ قائمة فارغة”.

// 4
// oldSuras.add(sura.index.toString());
// 1️⃣ sura.index هو رقم السورة (مثل 0 لسورة الفاتحة).2️⃣ نحوله إلى نصّ "0"؛ لأن SharedPreferences لا يقبل إلا النصوص في القوائم.3️⃣ نضيف هذا الرقم في نهاية القائمة oldSuras.

// 5
// prefs.setStringList(suraKey, oldSuras);
// 1️⃣ الآن لدينا القائمة المحدَّثة (oldSuras).2️⃣ نستدعي setStringList لكتابة القائمة كاملة تحت نفس المفتاح suras داخل الملف.3️⃣ الدالة نفسها ترجع Future<bool> (نجاح/فشل)، لكن الكود الأصلي لم ينتظر النتيجة—وهذا مسموح لأن العملية صارت في الخلفية.

// 6
// }
// نهاية الدالة. بمجرد اكتمال السطر 5 تكون القائمة الجديدة قد حُفِظت، وسيقرأها التطبيق في المرات القادمة