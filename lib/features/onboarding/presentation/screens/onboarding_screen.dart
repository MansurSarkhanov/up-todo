import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Resimdeki gibi siyah arka plan
      body: SafeArea(
        child: Column(
          children: [
            // Üst Kısım: SKIP Butonu
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    _controller.jumpToPage(contents.length - 1);
                  },
                  child: Text(
                    "SKIP",
                    style: TextStyle(color: Colors.white.withOpacity(0.5)),
                  ),
                ),
              ),
            ),

            // Orta Kısım: PageView (Resim ve Metinler)
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(contents[i].image, height: 300),
                        SizedBox(height: 40),
                        // İndikatörler (Çizgiler)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Alt Kısım: BACK ve NEXT/GET STARTED Butonları
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: currentIndex == 0
                        ? null
                        : () {
                            _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                    child: Text(
                      "BACK",
                      style: TextStyle(
                        color: currentIndex == 0
                            ? Colors.transparent
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        // Son sayfada yapılacak işlem
                      }
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8875FF), // Mor renk
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      currentIndex == contents.length - 1
                          ? "GET STARTED"
                          : "NEXT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // İndikatör Çizgisi Oluşturucu
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 4,
      width: 25,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: currentIndex == index
            ? Colors.white
            : Colors.white.withOpacity(0.3),
      ),
    );
  }
}

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> contents = [
  OnboardingModel(
    image: 'assets/images/board1.png',
    title: 'Manage your tasks',
    description:
        'You can easily manage all of your daily tasks in DoMe for free',
  ),
  OnboardingModel(
    image: 'assets/images/board2.png',
    title: 'Create daily routine',
    description:
        'In Uptodo you can create your personalized routine to stay productive',
  ),
  OnboardingModel(
    image: 'assets/images/board3.png',
    title: 'Organize your tasks',
    description:
        'You can organize your daily tasks by adding your tasks into separate categories',
  ),
];
