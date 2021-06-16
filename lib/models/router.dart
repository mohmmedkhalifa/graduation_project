import 'package:auto_route/auto_route_annotations.dart';
import 'package:graduation_project/screens/0splash.dart';
import 'package:graduation_project/screens/10emptyCart.dart';
import 'package:graduation_project/screens/11cart.dart';
import 'package:graduation_project/screens/12payment.dart';
import 'package:graduation_project/screens/13orderDetails.dart';
import 'package:graduation_project/screens/14.0chatMessages.dart';
import 'package:graduation_project/screens/15profile.dart';
import 'package:graduation_project/screens/16favorite.dart';
import 'package:graduation_project/screens/17shippingAddress.dart';
import 'package:graduation_project/screens/18openStore.dart';
import 'package:graduation_project/screens/19storePage.dart';
import 'package:graduation_project/screens/20validationProcess.dart';
import 'package:graduation_project/screens/21addProduct.dart';
import 'package:graduation_project/screens/22addProductDetails.dart';
import 'package:graduation_project/screens/23addAddress.dart';
import 'package:graduation_project/screens/4login.dart';
import 'package:graduation_project/screens/5.0userType.dart';
import 'package:graduation_project/screens/5register.dart';
import 'package:graduation_project/screens/6.0HomeNavigator.dart';
import 'package:graduation_project/screens/6homePage.dart';
import 'package:graduation_project/screens/7categories.dart';
import 'package:graduation_project/screens/8allProducts.dart';
import 'package:graduation_project/screens/9productDetails.dart';
import 'package:graduation_project/screens/admin/complaints.dart';
import 'package:graduation_project/screens/admin/controlPanel.dart';
import 'package:graduation_project/screens/admin/cp.dart';
import 'package:graduation_project/screens/admin/members.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: Splash, initial: true),
    MaterialRoute(page: Login),
    MaterialRoute(page: Register),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: Categories),
    MaterialRoute(page: AllProducts),
    MaterialRoute(page: ProductDetails),
    MaterialRoute(page: EmptyCart),
    MaterialRoute(page: Cart),
    MaterialRoute(page: Payment),
    MaterialRoute(page: OrderDetails),
    MaterialRoute(page: HomeNavigator),
    MaterialRoute(page: Favorite),
    MaterialRoute(page: ShippingAddress),
    MaterialRoute(page: UserType),
    MaterialRoute(page: OpenStore),
    MaterialRoute(page: StorePage),
    MaterialRoute(page: ValidationProcess),
    MaterialRoute(page: Profile),
    MaterialRoute(page: ControlPanel),
    MaterialRoute(page: MembersRequests),
    MaterialRoute(page: AddProduct),
    MaterialRoute(page: AddProductDetails),
    MaterialRoute(page: AddAddress),
  //  MaterialRoute(page: ChatMessagesPage),
    MaterialRoute(page: ControlPanelel),
    MaterialRoute(page: Complaints),

  ],
)
class $CustomRouter {}


//flutter packages pub run build_runner watch