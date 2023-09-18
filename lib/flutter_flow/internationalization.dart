import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tr', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? trText = '',
    String? esText = '',
  }) =>
      [enText, trText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'rjxzfjdo': {
      'en': 'Login',
      'es': 'Acceso',
      'tr': 'Giriş yap',
    },
    '6hwqpr4s': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'tr': 'E-posta Adresi',
    },
    'ng797kod': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
      'tr': 'E-postanızı giriniz...',
    },
    '49kwpsau': {
      'en': 'Password',
      'es': 'Contraseña',
      'tr': 'Şifre',
    },
    'yw81a0wz': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
      'tr': 'Şifrenizi girin...',
    },
    'pusmxw83': {
      'en': 'Login',
      'es': 'Acceso',
      'tr': 'Giriş yapmak',
    },
    '3p9thjid': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'tr': 'Parolanızı mı unuttunuz',
    },
    'qluvqy9q': {
      'en': 'Continue as Guest',
      'es': 'Continua como invitado',
      'tr': 'Misafir olarak devam et',
    },
    '0uti8oue': {
      'en': 'Register',
      'es': 'Registro',
      'tr': 'Kayıt olmak',
    },
    'yete8jm1': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'tr': 'E-posta Adresi',
    },
    '98m04toi': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
      'tr': 'E-postanızı giriniz...',
    },
    'i6nfxcb9': {
      'en': 'Password',
      'es': 'Contraseña',
      'tr': 'Şifre',
    },
    'fjoi8cpj': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
      'tr': 'Şifrenizi girin...',
    },
    'yh3sw7d0': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'tr': 'Şifreyi Onayla',
    },
    'sprv21m9': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
      'tr': 'Şifrenizi girin...',
    },
    'uwlu7pmj': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'tr': 'Hesap oluşturmak',
    },
    'gtpj9avf': {
      'en': 'Continue as Guest',
      'es': 'Continua como invitado',
      'tr': 'Misafir olarak devam et',
    },
    '9orssama': {
      'en': 'Home',
      'es': 'Hogar',
      'tr': 'Ev',
    },
  },
  // completeProfile
  {
    '4szfbclm': {
      'en': 'Complete Profile',
      'es': 'Perfil completo',
      'tr': 'Profilini Tamamla',
    },
    'kcdoerlb': {
      'en': 'Upload a photo for us to easily identify you.',
      'es': 'Sube una foto para que podamos identificarte fácilmente.',
      'tr': 'Sizi kolayca tanıyabilmemiz için bir fotoğraf yükleyin.',
    },
    'fdkp6uts': {
      'en': 'Your Name',
      'es': 'Su nombre',
      'tr': 'Adınız',
    },
    'tzpcynot': {
      'en': 'Please enter a valid number...',
      'es': 'Por favor ingrese un número valido...',
      'tr': 'Lütfen geçerli bir numara girin...',
    },
    'd1j2pbz6': {
      'en': 'Your Age',
      'es': 'Su edad',
      'tr': 'Yaşınız',
    },
    'hae37tl9': {
      'en': 'i.e. 34',
      'es': 'es decir 34',
      'tr': 'yani 34',
    },
    '0n662f5y': {
      'en': 'Ailments',
      'es': 'Dolencias',
      'tr': 'rahatsızlıklar',
    },
    'xp49ods4': {
      'en': 'What types of allergies do you have..',
      'es': '¿Qué tipos de alergias tienes?',
      'tr': 'Ne tür alerjileriniz var?',
    },
    'adsfg8mx': {
      'en': 'Your Birth Sex',
      'es': 'Tu sexo de nacimiento',
      'tr': 'Doğduğunuz Cinsiyet',
    },
    '9piwoeg7': {
      'en': 'Male',
      'es': 'Masculino',
      'tr': 'Erkek',
    },
    'e05bs03c': {
      'en': 'Female',
      'es': 'Femenino',
      'tr': 'Dişi',
    },
    'fm8rnp2u': {
      'en': 'Undisclosed',
      'es': 'No revelado',
      'tr': 'Açıklanmadı',
    },
    'j483zjmu': {
      'en': 'Add Another Profile',
      'es': 'Agregar otro perfil',
      'tr': 'Başka Profil Ekle',
    },
    '1z5cqncy': {
      'en': 'Complete Profile',
      'es': 'Perfil completo',
      'tr': 'Profilini Tamamla',
    },
    '2qxmwub4': {
      'en': 'Home',
      'es': 'Hogar',
      'tr': 'Ev',
    },
  },
  // forgotPassword
  {
    'a6910f6y': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'tr': 'Parolanızı mı unuttunuz',
    },
    's8ve9aes': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'es':
          'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
      'tr':
          'Hesabınızla ilişkili e-postayı girin, size bir doğrulama kodu göndereceğiz.',
    },
    '5aypqiyy': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'tr': 'E-posta Adresi',
    },
    'qmlaw5se': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
      'tr': 'E-postanızı giriniz...',
    },
    'z5x127rm': {
      'en': 'Send Reset Link',
      'es': 'Enviar enlace de reinicio',
      'tr': 'Sıfırlama Bağlantısı Gönder',
    },
    'hgzuntva': {
      'en': 'Home',
      'es': 'Hogar',
      'tr': 'Ev',
    },
  },
  // addAnotherProfile
  {
    'x286nnli': {
      'en': 'Add Another Profile',
      'es': 'Agregar otro perfil',
      'tr': 'Başka Profil Ekle',
    },
    'qj7w550j': {
      'en': 'Upload a photo for us to easily identify this person.',
      'es':
          'Sube una foto para que podamos identificar fácilmente a esta persona.',
      'tr': 'Bu kişiyi kolayca tanımlayabilmemiz için bir fotoğraf yükleyin.',
    },
    'ppcg48ne': {
      'en': 'Persons Name',
      'es': 'Nombre de persona',
      'tr': 'Kişinin adı',
    },
    'rl8gbb00': {
      'en': 'Official name here...',
      'es': 'Nombre oficial aquí...',
      'tr': 'Resmi adı burada...',
    },
    'uveo6dts': {
      'en': 'Persons Age',
      'es': 'Personas Edad',
      'tr': 'Kişilerin Yaşı',
    },
    't42uffvf': {
      'en': 'i.e. 34',
      'es': 'es decir 34',
      'tr': 'yani 34',
    },
    '6idyviva': {
      'en': 'Persons Ailments',
      'es': 'Enfermedades de las personas',
      'tr': 'Kişilerin Rahatsızlıkları',
    },
    'h2b3wwst': {
      'en': 'What types of allergies do they have..',
      'es': '¿Qué tipos de alergias tienen?',
      'tr': 'Ne tür alerjileri var?',
    },
    'qjv1xn2x': {
      'en': 'Location',
      'es': 'Ubicación',
      'tr': 'Konum',
    },
    '37kiajmy': {
      'en': 'Please enter a valid email...',
      'es':
          'Por favor introduzca una dirección de correo electrónico válida...',
      'tr': 'Lütfen geçerli eposta adresini giriniz...',
    },
    '4owsketa': {
      'en': 'Persons Birth Sex',
      'es': 'Personas Nacimiento Sexo',
      'tr': 'Kişinin Doğum Cinsiyeti',
    },
    'dnxq6h8e': {
      'en': 'Male',
      'es': 'Masculino',
      'tr': 'Erkek',
    },
    'lqaik9g9': {
      'en': 'Female',
      'es': 'Femenino',
      'tr': 'Dişi',
    },
    'ai82vgpi': {
      'en': 'Undisclosed',
      'es': 'No revelado',
      'tr': 'Açıklanmadı',
    },
    '5hph7san': {
      'en': 'Complete Profile',
      'es': 'Perfil completo',
      'tr': 'Profilini Tamamla',
    },
    'w7wyoduv': {
      'en': 'Home',
      'es': 'Hogar',
      'tr': 'Ev',
    },
  },
  // onboarding
  {
    'aqwginwj': {
      'en': 'Stay in Touch',
      'es': 'Mantente en contacto',
      'tr': 'İletişimde Kalın',
    },
    '1drvldft': {
      'en': 'Always have your medical office at your fingertips.',
      'es': 'Tenga siempre su consultorio médico a su alcance.',
      'tr': 'Tıbbi ofisiniz her zaman parmaklarınızın ucunda olsun.',
    },
    'nfmgq9q7': {
      'en': 'Schedule Appointments',
      'es': 'Programar citas',
      'tr': 'Randevu Planla',
    },
    'ro0ew1yl': {
      'en':
          'Easily schedule appointments for checkups,  routine procedures, etc.',
      'es':
          'Programe fácilmente citas para chequeos, procedimientos de rutina, etc.',
      'tr':
          'Kontroller, rutin prosedürler vb. için randevuları kolayca planlayın.',
    },
    'd4c7hcyy': {
      'en': 'Doctor in your pocket',
      'es': 'Doctor en tu bolsillo',
      'tr': 'Cebinizdeki doktor',
    },
    '3nkxrw54': {
      'en': 'Easily find symptoms and common factors that affect you daily.',
      'es':
          'Encuentre fácilmente síntomas y factores comunes que le afectan a diario.',
      'tr':
          'Sizi her gün etkileyen semptomları ve ortak faktörleri kolayca bulun.',
    },
    'eazhskgm': {
      'en': 'Continue',
      'es': 'Continuar',
      'tr': 'Devam etmek',
    },
    'zfe652qz': {
      'en': 'Home',
      'es': 'Hogar',
      'tr': 'Ev',
    },
  },
  // homePage
  {
    'wfnlyhng': {
      'en': 'Good Morning',
      'es': 'Buen día',
      'tr': 'Günaydın',
    },
    'd4eqdo55': {
      'en': 'Your next appointment',
      'es': 'Tu próxima cita',
      'tr': 'Bir sonraki randevunuz',
    },
    'p1xdq1w5': {
      'en': 'For',
      'es': 'Para',
      'tr': 'İçin',
    },
    'fqc3ae8c': {
      'en': 'Book Appointment',
      'es': 'Reservar una cita',
      'tr': 'Kitap randevusu',
    },
    '8k76sxy5': {
      'en': 'Schedule an appointment with our licensed professional.',
      'es': 'Programe una cita con nuestro profesional autorizado.',
      'tr': 'Lisanslı uzmanımızla randevu ayarlayın.',
    },
    'vroaai5s': {
      'en': 'Call the Office',
      'es': 'Llame a la oficina',
      'tr': 'Ofisi arayın',
    },
    'asnphbd0': {
      'en': 'Give us a call in order to schedule your appointment.',
      'es': 'Llámanos para programar tu cita.',
      'tr': 'Randevunuzu planlamak için bizi arayın.',
    },
    'h7hgtm16': {
      'en': 'Email Us',
      'es': 'Envíanos un correo electrónico',
      'tr': 'Bize e-posta gönderin',
    },
    'xhauubu2': {
      'en': 'Send us an email and we will get back to you within 2 days.',
      'es':
          'Envíenos un correo electrónico y nos comunicaremos con usted dentro de 2 días.',
      'tr':
          'Bize bir e-posta gönderin; 2 gün içinde size geri dönüş yapacağız.',
    },
    'hce0pet8': {
      'en': '•',
      'es': '•',
      'tr': '•',
    },
  },
  // myAppointments
  {
    '9gxc3y0n': {
      'en': 'Appointments',
      'es': 'Equipo',
      'tr': 'Randevular',
    },
    'ybok20v5': {
      'en': 'My Appointments',
      'es': 'Mis citas',
      'tr': 'Randevularım',
    },
    'bnfv53s9': {
      'en': '•',
      'es': '•',
      'tr': '•',
    },
  },
  // appointmentDetails
  {
    'hwj53pno': {
      'en': 'Details',
      'es': 'Detalles',
      'tr': 'Detaylar',
    },
    'gqp7wlno': {
      'en': 'Type of Appointment',
      'es': 'Tipo de cita',
      'tr': 'Randevu Türü',
    },
    'sdmwyze7': {
      'en': 'What’s the problem?',
      'es': '¿Cuál es el problema?',
      'tr': 'Sorun ne?',
    },
    'tdodmx6l': {
      'en': 'For',
      'es': 'Para',
      'tr': 'İçin',
    },
    'ku5bwwey': {
      'en': 'When',
      'es': 'Cuando',
      'tr': 'Ne zaman',
    },
    'z51n3081': {
      'en': 'Reschedule',
      'es': 'Reprogramar',
      'tr': 'Yeniden planlamak',
    },
    'fen7xnfr': {
      'en': 'Cancel Appointment',
      'es': 'Cancelar cita',
      'tr': 'Randevu iptal',
    },
    'pjz5oekr': {
      'en': 'Home',
      'es': 'Hogar',
      'tr': 'Ev',
    },
  },
  // profilePage
  {
    'szzhnesf': {
      'en': 'Ailments',
      'es': 'Dolencias',
      'tr': 'rahatsızlıklar',
    },
    '113qvkrh': {
      'en': 'Next Appointment',
      'es': 'Próxima cita',
      'tr': 'Sonraki Randevu',
    },
    'xqms4vqm': {
      'en': 'Aug 20, 2021',
      'es': '20 de agosto de 2021',
      'tr': '20 Ağu 2021',
    },
    'cjklq6oq': {
      'en': 'Switch to Dark Mode',
      'es': 'Cambiar al modo oscuro',
      'tr': 'Karanlık Moda Geç',
    },
    '4qawf52f': {
      'en': 'Switch to Light Mode',
      'es': 'Cambiar al modo de luz',
      'tr': 'Işık Moduna Geç',
    },
    'mrdegy2s': {
      'en': 'Past Appointments',
      'es': 'Citas pasadas',
      'tr': 'Geçmiş Randevular',
    },
    'aszbyxlt': {
      'en': 'For',
      'es': 'Para',
      'tr': 'İçin',
    },
    'tbgjihje': {
      'en': '•',
      'es': '•',
      'tr': '•',
    },
  },
  // editProfile
  {
    'wkur6kao': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'tr': 'Profili Düzenle',
    },
    '5amc3ume': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
      'tr': 'Fotoğrafı değiştir',
    },
    'tqtck46y': {
      'en': 'Your Name',
      'es': 'Su nombre',
      'tr': 'Adınız',
    },
    '60u63eg8': {
      'en': 'Please enter a valid number...',
      'es': 'Por favor ingrese un número valido...',
      'tr': 'Lütfen geçerli bir numara girin...',
    },
    '2lw46a5h': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'tr': 'E-posta Adresi',
    },
    '9f1ph39q': {
      'en': 'Your email',
      'es': 'Tu correo electrónico',
      'tr': 'E-posta adresiniz',
    },
    'r0r3vha2': {
      'en': 'Your Age',
      'es': 'Su edad',
      'tr': 'Yaşınız',
    },
    'irtd2lfw': {
      'en': 'i.e. 34',
      'es': 'es decir 34',
      'tr': 'yani 34',
    },
    'sz0f6f95': {
      'en': 'Ailments',
      'es': 'Dolencias',
      'tr': 'rahatsızlıklar',
    },
    '7veyg2yc': {
      'en': 'What types of allergies do you have..',
      'es': '¿Qué tipos de alergias tienes?',
      'tr': 'Ne tür alerjileriniz var?',
    },
    'tsdnk9j3': {
      'en': 'Your Birth Sex',
      'es': 'Tu sexo de nacimiento',
      'tr': 'Doğduğunuz Cinsiyet',
    },
    'vlw0iqeo': {
      'en': 'Male',
      'es': 'Masculino',
      'tr': 'Erkek',
    },
    'jwkjak7t': {
      'en': 'Female',
      'es': 'Femenino',
      'tr': 'Dişi',
    },
    '580faoq8': {
      'en': 'Undisclosed',
      'es': 'No revelado',
      'tr': 'Açıklanmadı',
    },
    'vdligr80': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'tr': 'Değişiklikleri Kaydet',
    },
    'w7ufpq6d': {
      'en': 'Home',
      'es': 'Hogar',
      'tr': 'Ev',
    },
  },
  // findSymptoms
  {
    'eu5cgai8': {
      'en': 'Symptoms',
      'es': 'Síntomas',
      'tr': 'Belirtiler',
    },
    'd85bv38a': {
      'en': 'Search symptoms…',
      'es': 'Síntomas de búsqueda…',
      'tr': 'Arama belirtileri…',
    },
    'ci75fubx': {
      'en': 'Headache, heartburn etc...',
      'es': 'Dolor de cabeza, acidez de estómago, etc...',
      'tr': 'Baş ağrısı, mide yanması vs...',
    },
    '8j8w2byz': {
      'en': '[Symptom Name]',
      'es': '[Nombre del síntoma]',
      'tr': '[Belirti Adı]',
    },
    'l4r0f32f': {
      'en':
          'Convulsive disorder that does something and extra content goes here because that is where it goes okay, don’t question.',
      'es':
          'Trastorno convulsivo que hace algo y contenido extra va aquí porque ahí es donde va bien, no cuestiones.',
      'tr':
          'Bir şeyler yapan konvülsif bozukluk ve ekstra içerik buraya geliyor çünkü oraya gidiyor tamam, sorgulamayın.',
    },
    'flrt5wmr': {
      'en': '[Symptom Name]',
      'es': '[Nombre del síntoma]',
      'tr': '[Belirti Adı]',
    },
    'omh0wx8c': {
      'en':
          'Convulsive disorder that does something and extra content goes here because that is where it goes okay, don’t question.',
      'es':
          'Trastorno convulsivo que hace algo y contenido extra va aquí porque ahí es donde va bien, no cuestiones.',
      'tr':
          'Bir şeyler yapan konvülsif bozukluk ve ekstra içerik buraya geliyor çünkü oraya gidiyor tamam, sorgulamayın.',
    },
    '4z6dquf4': {
      'en': '[Symptom Name]',
      'es': '[Nombre del síntoma]',
      'tr': '[Belirti Adı]',
    },
    'qh2g03ax': {
      'en':
          'Convulsive disorder that does something and extra content goes here because that is where it goes okay, don’t question.',
      'es':
          'Trastorno convulsivo que hace algo y contenido extra va aquí porque ahí es donde va bien, no cuestiones.',
      'tr':
          'Bir şeyler yapan konvülsif bozukluk ve ekstra içerik buraya geliyor çünkü oraya gidiyor tamam, sorgulamayın.',
    },
    'cshu3e8n': {
      'en': '[Symptom Name]',
      'es': '[Nombre del síntoma]',
      'tr': '[Belirti Adı]',
    },
    'ebbys3hu': {
      'en':
          'Convulsive disorder that does something and extra content goes here because that is where it goes okay, don’t question.',
      'es':
          'Trastorno convulsivo que hace algo y contenido extra va aquí porque ahí es donde va bien, no cuestiones.',
      'tr':
          'Bir şeyler yapan konvülsif bozukluk ve ekstra içerik buraya geliyor çünkü oraya gidiyor tamam, sorgulamayın.',
    },
    'awiuze8y': {
      'en': '•',
      'es': '•',
      'tr': '•',
    },
  },
  // appointmentDetailsProfile
  {
    'uvwm8bko': {
      'en': 'Details',
      'es': 'Detalles',
      'tr': 'Detaylar',
    },
    'sjsa5vwz': {
      'en': 'Type of Appointment',
      'es': 'Tipo de cita',
      'tr': 'Randevu Türü',
    },
    'v64xosb0': {
      'en': 'What’s the problem?',
      'es': '¿Cuál es el problema?',
      'tr': 'Sorun ne?',
    },
    'yods3wcg': {
      'en': 'For',
      'es': 'Para',
      'tr': 'İçin',
    },
    'q4jofkm1': {
      'en': 'When',
      'es': 'Cuando',
      'tr': 'Ne zaman',
    },
    '07u64zlt': {
      'en': 'Remove Appointment',
      'es': 'Quitar cita',
      'tr': 'Randevuyu Kaldır',
    },
    'u6rm6u4t': {
      'en': 'Home',
      'es': 'Hogar',
      'tr': 'Ev',
    },
  },
  // bookAppointment
  {
    'qnyh8i62': {
      'en': 'Book Appointment',
      'es': 'Reservar una cita',
      'tr': 'Kitap randevusu',
    },
    'ytys8p4m': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'es':
          'Complete la información a continuación para programar su cita con nuestra oficina.',
      'tr':
          'Ofisimizden randevu alabilmek için aşağıdaki bilgileri doldurunuz.',
    },
    'b4id5qqh': {
      'en': 'Emails will be sent to:',
      'es': 'Los correos electrónicos se enviarán a:',
      'tr': 'E-postalar şu adrese gönderilecektir:',
    },
    'ovau1s7z': {
      'en': 'Booking For',
      'es': 'Reserva para',
      'tr': 'Rezervasyon',
    },
    '6bxakxch': {
      'en': 'Doctors Visit',
      'es': 'visita al medico',
      'tr': 'Doktor Ziyareti',
    },
    'hdjzqi73': {
      'en': 'Routine Checkup',
      'es': 'Chequeo de rutina',
      'tr': 'Rutin kontrol',
    },
    'hze6wx5q': {
      'en': 'Scan/Update',
      'es': 'Escanear/Actualizar',
      'tr': 'Tara/Güncelle',
    },
    '9cey38kn': {
      'en': 'Type of Appointment',
      'es': 'Tipo de cita',
      'tr': 'Randevu Türü',
    },
    '89tohxhn': {
      'en': 'What\'s the problem?',
      'es': '¿Cuál es el problema?',
      'tr': 'Sorun ne?',
    },
    'g9ustdlo': {
      'en': 'Choose Date & Time',
      'es': 'Elija fecha y hora',
      'tr': 'Tarih ve Saati Seçin',
    },
    'k7w75sqh': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'tr': 'İptal etmek',
    },
    'ltvialmp': {
      'en': 'Book Now',
      'es': 'Reservar ahora',
      'tr': 'Şimdi Rezervasyon Yapın',
    },
  },
  // bookingOld
  {
    '2v9qn0f1': {
      'en': 'Book Appointment',
      'es': 'Reservar una cita',
      'tr': 'Kitap randevusu',
    },
    '95dc8qqx': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'es':
          'Complete la información a continuación para programar su cita con nuestra oficina.',
      'tr':
          'Ofisimizden randevu alabilmek için aşağıdaki bilgileri doldurunuz.',
    },
    'he4sew96': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'tr': 'E-posta Adresi',
    },
    'ta0j8xvs': {
      'en': 'Booking For',
      'es': 'Reserva para',
      'tr': 'Rezervasyon',
    },
    'pkwd7oek': {
      'en': 'Doctors Visit',
      'es': 'visita al medico',
      'tr': 'Doktor Ziyareti',
    },
    'klhvxjwa': {
      'en': 'Routine Checkup',
      'es': 'Chequeo de rutina',
      'tr': 'Rutin kontrol',
    },
    'i07qap7m': {
      'en': 'Scan/Update',
      'es': 'Escanear/Actualizar',
      'tr': 'Tara/Güncelle',
    },
    'hf61avap': {
      'en': 'Type of Appointment',
      'es': 'Tipo de cita',
      'tr': 'Randevu Türü',
    },
    'syt1xg5l': {
      'en': 'What\'s the problem?',
      'es': '¿Cuál es el problema?',
      'tr': 'Sorun ne?',
    },
    'i7dad0nu': {
      'en': 'Choose Date',
      'es': 'Elige fecha',
      'tr': 'Tarih Seçin',
    },
    '2oo86u84': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'tr': 'İptal etmek',
    },
    'k6q1a7b0': {
      'en': 'Book Now',
      'es': 'Reservar ahora',
      'tr': 'Şimdi Rezervasyon Yapın',
    },
  },
  // editBooking
  {
    'cvwbjjqp': {
      'en': 'Edit Appointment',
      'es': 'Editar cita',
      'tr': 'Randevuyu Düzenle',
    },
    'saz3p3bp': {
      'en': 'Edit the fields below in order to change your appointment.',
      'es': 'Edite los campos a continuación para cambiar su cita.',
      'tr': 'Randevunuzu değiştirmek için aşağıdaki alanları düzenleyin.',
    },
    'nrp3fday': {
      'en': 'Emails will be sent to:',
      'es': 'Los correos electrónicos se enviarán a:',
      'tr': 'E-postalar şu adrese gönderilecektir:',
    },
    '50u0qipy': {
      'en': 'Booking For',
      'es': 'Reserva para',
      'tr': 'Rezervasyon',
    },
    'kcosmjah': {
      'en': 'Type of Appointment',
      'es': 'Tipo de cita',
      'tr': 'Randevu Türü',
    },
    'cztvmb2l': {
      'en': 'Doctors Visit',
      'es': 'visita al medico',
      'tr': 'Doktor Ziyareti',
    },
    'z2076pj2': {
      'en': 'Routine Checkup',
      'es': 'Chequeo de rutina',
      'tr': 'Rutin kontrol',
    },
    'a4v2ota8': {
      'en': 'Scan/Update',
      'es': 'Escanear/Actualizar',
      'tr': 'Tara/Güncelle',
    },
    'bfv1najn': {
      'en': 'What\'s the problem?',
      'es': '¿Cuál es el problema?',
      'tr': 'Sorun ne?',
    },
    'n2qukzxu': {
      'en': 'Choose Date',
      'es': 'Elige fecha',
      'tr': 'Tarih Seçin',
    },
    '6cu9a60j': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'tr': 'İptal etmek',
    },
    '80fa9p4i': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'tr': 'Değişiklikleri Kaydet',
    },
  },
  // EmptyList
  {
    'gwef034a': {
      'en': 'No Appointments!',
      'es': '¡Sin citas!',
      'tr': 'Randevu Yok!',
    },
    'vtwufqnf': {
      'en':
          'You are all caught! No appointments scheduled, need an appointment? Schedule one now.',
      'es':
          '¡Estáis todos atrapados! No hay citas programadas, ¿necesita una cita? Programe uno ahora.',
      'tr':
          'Hepiniz yakalandınız! Randevu planlanmadı, randevuya mı ihtiyacınız var? Şimdi bir tane planlayın.',
    },
    'drw4o6p0': {
      'en': 'Schedule',
      'es': 'Cronograma',
      'tr': 'Takvim',
    },
  },
  // Miscellaneous
  {
    '1p6bnz83': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'amzud9k2': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'tuaim7dm': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'cn5dk7o7': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'slk1nosv': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'fz0fcw17': {
      'en': '',
      'es': '',
      'tr': '',
    },
    '2lrsmzuj': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'c9vfvhb8': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'x9u8t8fq': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'v8ug2ua2': {
      'en': '',
      'es': '',
      'tr': '',
    },
    '67bdimt8': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'r6c2slfk': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'tuvxeznl': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'urw970o0': {
      'en': '',
      'es': '',
      'tr': '',
    },
    '4qps4cce': {
      'en': '',
      'es': '',
      'tr': '',
    },
    't8j7vldz': {
      'en': '',
      'es': '',
      'tr': '',
    },
    '5fo1bmhd': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'rnvd70s5': {
      'en': '',
      'es': '',
      'tr': '',
    },
    's41mwwnr': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'wabu8k2a': {
      'en': '',
      'es': '',
      'tr': '',
    },
    '51ra0q2w': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'xo2ur012': {
      'en': '',
      'es': '',
      'tr': '',
    },
    '827ewqhq': {
      'en': '',
      'es': '',
      'tr': '',
    },
    '75q6jbfo': {
      'en': '',
      'es': '',
      'tr': '',
    },
    'i0mwh63w': {
      'en': '',
      'es': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
