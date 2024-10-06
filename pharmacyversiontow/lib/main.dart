import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/accounts/view/screen/addaccount.dart';
import 'package:pharmacyversiontow/accounts/view/screen/update.dart';
import 'package:pharmacyversiontow/accounts/view/screen/viewaccounts.dart';
import 'package:pharmacyversiontow/backup/view/home_backup.dart';
import 'package:pharmacyversiontow/core/localization/change_local.dart';
import 'package:pharmacyversiontow/core/localization/translation.dart';
import 'package:pharmacyversiontow/core/midelware/midelwaer.dart';
import 'package:pharmacyversiontow/core/midelware/workermedileware.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/core/theme/app_theme.dart';
import 'package:pharmacyversiontow/homepage/view/screens/buypage.dart';
import 'package:pharmacyversiontow/homepage/view/screens/homepage.dart';
import 'package:pharmacyversiontow/homepage/view/screens/sellpage.dart';
import 'package:pharmacyversiontow/homepage/view/screens/view_almost_expier_medicin.dart';
import 'package:pharmacyversiontow/homepage/view/screens/view_day_buy_medicin.dart';
import 'package:pharmacyversiontow/homepage/view/screens/view_day_purche_medicin.dart';
import 'package:pharmacyversiontow/homepage/view/screens/view_expire_medicin.dart';
import 'package:pharmacyversiontow/homepage/workers/view/view_pharmacy_workers.dart';
import 'package:pharmacyversiontow/pharmacylogin/view/createaccount.dart';
import 'package:pharmacyversiontow/pharmacylogin/view/pharmacyloginview.dart';
import 'package:pharmacyversiontow/purchas/view/screen/add_new_purchase.dart';
import 'package:pharmacyversiontow/purchas/view/screen/country/addcountry.dart';
import 'package:pharmacyversiontow/purchas/view/screen/country/updatecountry.dart';
import 'package:pharmacyversiontow/purchas/view/screen/country/viewcountry.dart';
import 'package:pharmacyversiontow/purchas/view/screen/supplier/addsupplier.dart';
import 'package:pharmacyversiontow/purchas/view/screen/supplier/updatesuplier.dart';
import 'package:pharmacyversiontow/purchas/view/screen/supplier/viewsupplier.dart';
import 'package:pharmacyversiontow/purchas/view/screen/updatepurchas.dart';
import 'package:pharmacyversiontow/purchas/view/screen/viewpurchas.dart';
import 'package:pharmacyversiontow/sales/view/screen/addsales.dart';
import 'package:pharmacyversiontow/sales/view/screen/salesview.dart';
import 'package:pharmacyversiontow/sales/view/screen/updatesales.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/add_supplier_medicin.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/main_supplier.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/update_supplier_medicin.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/view_medicin.dart';
import 'package:pharmacyversiontow/supplierlogin/view/create_supplier_account.dart';
import 'package:pharmacyversiontow/supplierlogin/view/supplierloginview.dart';
import 'package:pharmacyversiontow/worker/view/screen/activate_worker_accunte_page.dart';
import 'package:pharmacyversiontow/worker/view/screen/main_worker.dart';
import 'package:pharmacyversiontow/worker/view/screen/main_worker_sell_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocalController localController = Get.put(LocalController());
    final AppTheme appThemeController=Get.put(AppTheme());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: localController.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:appThemeController.appTheme ,
      /*ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(103, 58, 183, 1)),
        useMaterial3: true,
      ),*/
      //home: HomePage(),
      //home: SupplierLoginView(),
      initialRoute: "/supplierloginview",
      getPages: [
        GetPage(name: "/CreateAccount", page: () => CreateAccount()),
        GetPage(name: "/pharmacyloginview", page: () => PharmacyLoginView()),
        GetPage(
            name: "/supplierloginview",
            page: () => SupplierLoginView(),
            middlewares: [MidelWare()]),
        GetPage(name: "/homepage", page: () => HomePage()),
        GetPage(name: "/buypage", page: () => Buypage()),
        GetPage(name: "/sellpage", page: () => SellPage()),
        GetPage(name: "/ViewPurchas", page: () => ViewPurchas()),
       // GetPage(name: "/addpurchas", page: () => AddPurchas()),
        GetPage(name: "/ViewSles", page: () => ViewSles()),
        GetPage(name: "/ViewAccount", page: () => ViewAccount()),
        GetPage(name: "/AddAccount", page: () => AddAccount()),
        GetPage(name: "/UpdateAccount", page: () => UpdateAccount()),
        GetPage(name: "/ViewSuppliers", page: () => ViewSuppliers()),
        GetPage(name: "/ViewCountry", page: () => ViewCountry()),
        GetPage(name: "/AddCountry", page: () => AddCountry()),
        GetPage(name: "/UpdateCountry", page: () => UpdateCountry()),
        GetPage(name: "/AddSupplier", page: () => AddSupplier()),
        GetPage(name: "/UpdateSupplier", page: () => UpdateSupplier()),
        GetPage(name: "/UpdatePurchas", page: () => UpdatePurchas()),
        GetPage(name: "/AddSalse", page: () => AddSalse()),
        GetPage(name: "/UpdateSalse", page: () => UpdateSalse()),
        GetPage(
            name: "/CreateSupplierAccount",
            page: () => CreateSupplierAccount()),
        GetPage(name: "/ViewMedicin", page: () => const ViewMedicin()),
        GetPage(name: "/MainSupplier", page: () => MainSupplier()),
        GetPage(name: "/AddSupplierMedicin", page: () => AddSupplierMedicin()),
        GetPage(
            name: "/UpdateSupplierMedicin",
            page: () => UpdateSupplierMedicin()),
        GetPage(name: "/ViewExpireMedicin", page: () => const ViewExpireMedicin()),
        GetPage(
            name: "/ViewAlmostExpireMedicin",
            page: () => const ViewAlmostExpireMedicin()),
        GetPage(name: "/ViewDayBuy", page: () => const ViewDayBuy()),
        GetPage(name: "/ViewDayPurchas", page: () => const ViewDayPurchas()),
        GetPage(name: "/HomeBackup", page: () => const HomeBackup()),
        GetPage(name: "/MainWorker", page: () => const MainWorker()),
        GetPage(name: "/MainWorkerViewSles", page: () => MainWorkerViewSles()),
        GetPage(
            name: "/ActivateWorkerAccuntePage",
            page: () => const ActivateWorkerAccuntePage(),
            middlewares: [WorkerMidelWare()]),
            GetPage(name: "/ViewPharmacyWrkers", page: ()=>const ViewPharmacyWrkers()),
            GetPage(name: "/AddNewPurchase", page: ()=>AddNewPurchase())
      ],
    );
  }
}

