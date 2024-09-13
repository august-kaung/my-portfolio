import '../import.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  HomePageProvider? homePageProvider;
  final ScrollController scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey skillKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey blogKey = GlobalKey();
  List<GlobalKey>? keyList;
  List<Widget> pageList = [
    const HomePage(),
    const SkillPage(),
    const ProjectPage(),
    const ContactPage(),
    const BlogPage()
  ];
  List<String> optionList = [
    "Home",
    "Skill",
    "Project",
    "Contact",
    "Blog",
  ];
  @override
  void initState() {
    super.initState();
    keyList = [
      homeKey,
      skillKey,
      projectKey,
      contactKey,
      blogKey,
    ];
    homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
    homePageProvider!.startTyping();
  }

  @override
  void dispose() {
    homePageProvider!.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          ListView.separated(
            separatorBuilder: (context, index) => const VerticalDivider(
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
              thickness: 2,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: optionList.length,
            itemBuilder: (context, index) => TextButton(
                onPressed: () {
                  homePageProvider!.scrollToSection(keyList![index]);
                },
                child: Text(optionList[index])),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            HomePage(
              key: homeKey,
            ),
            SkillPage(
              key: skillKey,
            ),
            ProjectPage(key: projectKey),
            ContactPage(key: contactKey),
            BlogPage(key: blogKey)
          ],
        ),
      ),
    );
  }
}
