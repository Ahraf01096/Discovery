import 'package:discovery/discovery%20chat/firebase_provider.dart';
import 'package:discovery/view_models/favourite/favourite_view_model.dart';
import 'package:discovery/view_models/post/posts_view_model.dart';
import 'package:discovery/view_models/reel/reels_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:discovery/view_models/auth/login_view_model.dart';
import 'package:discovery/view_models/auth/register_view_model.dart';
import 'package:discovery/view_models/profile/edit_profile_view_model.dart';
import 'package:discovery/view_models/theme/theme_view_model.dart';
import 'package:discovery/view_models/user/user_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => RegisterViewModel()),
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => PostsViewModel()),
  ChangeNotifierProvider(create: (_) => ReelsViewModel()),
  ChangeNotifierProvider(create: (_) => EditProfileViewModel()),
  ChangeNotifierProvider(create: (_) => UserViewModel()),
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => WishlistProvider()),
  ChangeNotifierProvider(create: (_) => FirebaseProvider()),



];
