import '../../import.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageProvider? homePageProvider;

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        const HomePageBackgroundWiget(),
        SizedBox(
          width: double.maxFinite,
          height: 750,
          child: Column(
            children: [
              const Expanded(flex: 1, child: TypingStyleWidget()),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const EasyText(text: "Download Resume"),
                ),
              )
            ],
          ),
        ),
        
        
      ],
    );
  }
}
