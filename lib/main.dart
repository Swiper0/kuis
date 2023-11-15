import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 205, 0, 0),
          title: const Text("Godrej"),
          toolbarHeight: 60,
        ),
        body: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              height: 170,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 100, // Sesuaikan lebar gambar dengan kebutuhan Anda
                    height: 100, // Sesuaikan tinggi gambar dengan kebutuhan Anda
                    margin: EdgeInsets.all(10), // Sesuaikan margin dengan kebutuhan Anda
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://imgs.search.brave.com/BTlQguNrZj9Xj3o4eGiaq1RHslHbpHWi1n0ZzV4YXDo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9sb2dv/c3ZlY3Rvci5uZXQv/d3AtY29udGVudC91/cGxvYWRzLzIwMTIv/MTAvZ29kcmVqLWxv/Z28tdmVjdG9yLnBu/Zw',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika tombol di sini
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                            side: BorderSide(color: Colors.blue),
                          ),
                          child: const Text('Mengikuti'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            MyCarousel(),
          ],
        ),
      ),
    );
  }
}

class MyCarousel extends StatefulWidget {
  const MyCarousel({Key? key}) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            _buildSliderContainer('https://imgs.search.brave.com/vRDYQdECI2PF97cBFg_Zk321olPZ3ukPZgdmn5daPvY/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hbGZh/bWFydC5jby5pZC9z/dG9yYWdlL3BhZ2Uv/T2N0b2JlcjIwMjMv/QVhZSnBvM1hEWFpt/d29ITUFpZ1cuanBn'),
            _buildSliderContainer('https://imgs.search.brave.com/F6MEfbi5MlnaVM2k87mTbjLijqjyzGTkghzTteh7TLQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9hbGZh/bWFydC5jby5pZC9z/dG9yYWdlL3BhZ2Uv/T2N0b2JlcjIwMjMv/SzRvZmlBVHd3emFE/YkVSelp1eUkucG5n'),
            _buildSliderContainer('https://imgs.search.brave.com/eJ9SNDLGHBQHfRTWBmGZvCy15F4j1RJfR17n67aSG50/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9hbGZh/bWFydC5jby5pZC9z/dG9yYWdlL3BhZ2Uv/U2VwdGVtYmVyMjAy/My8weXRWUkRSdWxV/WHB3WjVaSE11OC5w/bmc'),
            _buildSliderContainer('https://imgs.search.brave.com/_6bWZgi56z3sjd9pdRNju9NX6KX--IBChwi2aqK5OvY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9hbGZh/bWFydC5jby5pZC9z/dG9yYWdlL3BhZ2Uv/U2VwdGVtYmVyMjAy/My9jaFQ0MmJGbG9S/QlVWdkZ3WUZWQy5q/cGc'),
          ],
          options: CarouselOptions(
            height: 120.0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            viewportFraction: 0.9,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          carouselController: _carouselController,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return InkWell(
              onTap: () {
                _carouselController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
              },
              child: Container(
                width: 15.0,
                height: 15.0,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentIndex ? Colors.white : Colors.grey,
                  border: Border.all(color: Colors.grey),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSliderContainer(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text('Slider', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
