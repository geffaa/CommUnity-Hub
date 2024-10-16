import 'package:community_hub/presentation/views/community/community_screen.dart';
import 'package:community_hub/presentation/views/map/map_screen.dart';
import 'package:community_hub/presentation/views/marketplace/marketplace_screen.dart';
import 'package:community_hub/presentation/widgets/app_sidebar.dart';
import 'package:community_hub/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:community_hub/presentation/views/home/home_screen.dart';
import 'package:community_hub/presentation/views/onboarding/onboarding_screen.dart';
import 'package:community_hub/presentation/views/auth/auth_wrapper.dart';
import 'package:community_hub/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: _authService.user,
      initialData: null,
      child: MaterialApp(
        title: 'CommUnity Hub',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4CAF50),
            secondary: const Color(0xFF2196F3),
          ),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User?>(
      builder: (context, user, _) {
        print('AuthenticationWrapper: Current user: ${user?.uid}');

        if (user != null) {
          print('AuthenticationWrapper: User authenticated, navigating to MainScreen');
          return MainScreen();
        }

        print('AuthenticationWrapper: User not authenticated, checking onboarding status');
        return FutureBuilder<bool>(
          future: _checkOnboardingStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == true) {
                print('AuthenticationWrapper: Onboarding completed, showing AuthWrapper');
                return AuthWrapper();
              } else {
                print('AuthenticationWrapper: Onboarding not completed, showing OnboardingScreen');
                return OnboardingScreen();
              }
            }
            print('AuthenticationWrapper: Checking onboarding status...');
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          },
        );
      },
    );
  }

  Future<bool> _checkOnboardingStatus() async {
    // Implement your logic to check if onboarding has been completed
    await Future.delayed(Duration(milliseconds: 500)); // Simulating a short delay
    print('AuthenticationWrapper: Onboarding status checked');
    return true;
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    MapScreen(),
    MarketplaceScreen(),
    CommunityScreen(),
  ];

  final List<String> _titles = [
    'CommUnity Hub',
    'Peta Komunitas',
    'Marketplace',
    'Komunitas',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex], style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      drawer: AppSidebar(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}