# One Dose Health Flutter Tech Task

## Kullanılan Kütüphaneler

- [Bloc(State Management](https://pub.dev/packages/flutter_bloc)
- [Get It(Dependency Injection)](https://pub.dev/packages/get_it)
- [Dio(Network Transactions)](https://pub.dev/packages/dio)
- [CI/CD(Fastlane)](https://fastlane.tools/https://fastlane.tools/)
- [Flutter Version Management(FVM)](https://fvm.app/)
- [Code Analysis(Very Good Analysis)](https://pub.dev/packages/very_good_analysis)
- [Code Analysis(SonarQube)](https://www.sonarsource.com/)
- [Device Network Connectivity Information](https://pub.dev/packages/connectivity_plus)
- [Logger](https://pub.dev/packages/logger)
- [Network Request Logger](https://pub.dev/packages/pretty_dio_logger)
- [Network Request Local Logger(Chucker)](https://pub.dev/packages/chucker_flutter)
- [Flutter EasyLoading](https://pub.dev/packages/flutter_easyloading)
- [Splash Screen](https://pub.dev/packages/flutter_native_splash)
- [Screen Information](https://pub.dev/packages/flutter_screenutil)
- [Caching](https://pub.dev/packages/hive/versions/4.0.0-dev.2)
- [Localization(Easy Localization)](https://pub.dev/packages/easy_localization)
- [Assets(Fluttergen)](https://pub.dev/packages/flutter_gen)
- [Model-Entity(Freezed)](https://pub.dev/packages/freezed)
- [Routing(GoRouter)](https://pub.dev/packages/go_router)
- [Test(Mockito)](https://pub.dev/packages/mockito)
- [Generate(Build Runner)](https://pub.dev/packages/build_runner)
- [Run Pubspec Script(RPS))](https://pub.dev/packages/rps)
- [Push Notification(Local))](https://pub.dev/packages/flutter_local_notifications)
- [Push Notification(Remote))](https://pub.dev/packages/firebase_messaging)



## Boilerplate

## Tasarım yaklaşımı

- Kullanılan Widget'ların parçalanması ve gerekli yerlerde tekrar kullanılmasını amaçlayan Atomic Design yaklaşımı referans alınmıştır.
Amaç; Kod Okunabilirliği, Widgeti'ların tekrar tekrar kullanılabilme opsiyonu ve dinamikleştirmek.Atomic Design için örnek döküman;
- [Atomic Design](https://itnext.io/atomic-design-with-flutter-11f6fcb62017)
- Kullanılan Widget'lar UI bazlı veya Uygulama geneli olma durumuna göre View dosyasının altında veya Core Katmanına eklendi

## Architecture

- Katmanlı mimari alt yapısı kullanılarak her katmanın kendi işini yapması amacıyla, kod okunabilirliği açısından ve sonra ki süreçte yapılan uygulamanın değişime direnç göstermemesi amacıyla Clean Architecture ve Repository Design Pattern kullanılmıştır.

- Architecture; 
    - "Core ": Proje bağımsız yapıların tutulduğu ve her yerde kullanılabilir yapılar bulunur(Cache, Constants, Enums, Initialize Methods, Network Client, Router, Utils).
    - "Common": Proje geneli kullanılan ancak başka projelerde kullanılmama durumu olabilecek yapılar bulunur(Widgets, Base, Global Extensions, Global Functions).
    - "Generated": Dil metinleri, Assets dosyaları gibi constant yapıların otomatik oluşturulması sonrası pathlerinin bulunduğu yapıdır(Localization Keys, Fonts, Assets).
    - "Helper": Hem proje geneli hemde başka projelerde kullanılabilecek yardımcı yapılar bulunur genelde static yada Singleton yapılar görülür.(Deep Link Helper,Firebase Notification Helper, Local Notification Helper, Internet Connection Checker Helper, App Environment Helper, Device Information Helper )
    - Features: Uygulamanın ana işlevinin bulunduğu katmandır. Clean Architecture ve Repository Pattern en çok burda kullanılır.(Views, Widgets, Mixins, State Management, Models, Entitites vb. )
        - "Features" Katmanı kendi içerisinde 3 ana katmandan oluşur(Data, Domain, Presentation)
            
            - "Data" katmanı kendi içerisinde 3 alt katmandan oluşur(Models, Repositories, Services)
                - "Models": Veri kaynağından gelen verinin uygulama tarafındaki anlaşılabilir karşılığıdır.
                - "Repositories": Veri kaynağından gelen verinin uygulama tarafında kullanılacak "Entity" yapısına dönüştürüldüğü, aynı zaman da da hangi veri kaynağına gidileceğinin verildiği katmandır(Local , Remote). Bu katmanda Repositoryler "Abstract" yani soyut olarak bulunurlar. "Service" katmanına bu soyut yapı üzerinden erişilir. Sadece imzalı methodlar bulunur.
                - "Services": Veri kaynağından veriyi uygulamamıza getirmemizi sağlayan uygulamanın en dış katmanıdır. Bu katmanda API, Local DB, Cache, Storage giri veri kaynaklarına erişim sağlanır. JSON, SOAP(XML) gibi veri tiplerini uygulamanın anlayabileceği "Model" yapılarına dönüştürür. Bu katmanda hem Abstract hemde Concrete yapılar bulunur. Diğer katmanlar Abstract üzerinden erişim sağlarlar ve Concrete yapı Abstract tarafından imzalanan methodları kullanmaktadır.
            
            - "Domain" katmanı kendi içerisinde 2 alt katmandan oluşur(Entities, Repositories)
                - Entities: Veri kaynağından(Bazı durumlarda veri kaynağından bağımsız uygulama içerisinde kullanılacak yapılarda olabilir) gelen verinin, uygulama içerisinde kullanılacak yapısal karşılığıdır. Uygulama "Entity"'ler ile çalışılar. Veri kaynağından gelen verinin birebir aynı karşılığı olmak ile beraber kullanım durumlarına göre ihtiyaç olmayan "Model" property'lerini barındırmayadabilirler.
                - "Repositories": "Data" katmanında bulunan "Abstract" class'ının Concrete somut halidir. Kodlamaların yapıldığı ve "Service" katmanına erişildiği yapıldır. "Service" katmanından gelen veriler "Model"'den "Entity"'ye burda maplenirler. Abstract class'ından implemente edilirler ve Abstractta bulunan imzalanmmış methodların kodlanması burda yapılır.
            - "Presentation": Uygulamanın ana işlevlerinin bulunduğu katmandır. kendi içerisinde 4 alt katmandan oluşur.(View, Mixin, Widgets, State Management(Cubit))
                - "View": Kullanıcının görmüş olduğu uygulama ekranlarının bulunduğu katmandır. Ana ekranlar Stateful olarak yapılandırılırlar. Çok ufak UI Business'ları dışında Business kodları bulunmamalıdır.
                - "Mixin": İlgili Ekranlar ile birlikte kullanılırlar ortak bir yapı oldukları için "View" katmanından direk erişilebilirler. UI Business kodları burda bulunur(Text Editing Contoller, Form validation, vb.) State Management(Cubit) yapısı ile "View" yapısını birbirine bağlayan katmandır.
                - "Widgets": "Common" katmanında bulunan "Widgets"'lardan bağımsız olarak sadece ilgili ekran özelindeki Widget'ların bulunduğu katmandır.
                - "Cubit(State Management)": UI ve UI bağımsız business kodlarının bulunduğu katmandır. UI'ı kontrol etmekte ve yenileme ihtiyacını karşılarlar. Aynı zaman da da "Repository" Katmanına erişilir(Abstract class üzerinden).


    - Katmanlar arasında haberleşme ve bağımlılık azaltımı için Dependency Injection(Constructor Injection) prensibi kullanılır. İlgili katmanların Abstract(soyut) yapıları bulunmaktadır. Injection sırasında Abstract yapı inject edilir. Abstract inject için instance üretimi sırasında Abstract class istenme durumu için Contrete class verilir. Bu sayede ileride olabilecek değişikliklerde kod silmek, kodları güncellemek yerine aynı Abstract yapı için yeni bir concrete verildiğinde uygulama iş akışına müdahale etmeden değiştirilmiş aynı zamanda da SOLID Prensiplerine uygun bir geliştirme olmuş olur. Örn: (i_book_repository.dart,book_repository.dart), (i_book_service.dart, book_service.dart), home_cubit.dart

    - Instance üretimi ve yönetimi için genelde Singleton yapılar kullanılmaktadır. Private constructor ve instance null chek işlemi ile manuel olarak yapılabilir. Get_it gibi yardımcı kütüphaneler ile bu süreç otomatik halede getirilebilir. Örn: service_locator.dart

    - 


  İş akışı;
   View --> Mixin --> Cubit --> Repository --> Service (Helper, Common ve Core katmanı iş akışına göre bu katmanlar genelinde kullanılmaktadır.)

  ya da
   View <-- Mixin <-- Cubit <-- Repository <-- Service (Helper, Common ve Core katmanı iş akışına göre bu katmanlar genelinde kullanılmaktadır.)















