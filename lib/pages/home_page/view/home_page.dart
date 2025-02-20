import 'package:auto_route/auto_route.dart';
import 'package:code_base/bloc/tab_bloc/tab_bloc.dart';
import 'package:code_base/core/di/injection.dart';
import 'package:code_base/core/enums/home_page_type.dart';
import 'package:code_base/core/extension/color_extension.dart';
import 'package:code_base/core/helpers/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bloc/tab_bloc/tab_state.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabBloc = getIt<TabBloc>();
  final _pageController = PageController();
  final homePageType = HomePageType.home;

  List<Widget> get _page => [
        Container(child: Center(child: Text("Home Page"))),
        Container(),
        Container(),
        Container(),
        Container(),
      ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      bloc: _tabBloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeHelper.white(context),
          body: PageView.builder(
            itemCount: _page.length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return _page[index];
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _tabBloc.selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _tabBloc.selectedIndex = index;
              _pageController.jumpToPage(index);
            },
            selectedLabelStyle: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
            selectedItemColor: ThemeHelper.buttonColorPrimary(context),
            unselectedItemColor: ThemeHelper.textColorDefaultTab(context),
            unselectedLabelStyle: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
            items: HomePageType.values.map((e) => _buildBottomNavigationBarItem(e)).toList(),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(HomePageType type) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 24.r,
        height: 24.r,
        child: SvgPicture.asset(
          _tabBloc.selectedIndex == type.index ? type.selectedIcon : type.unselectedIcon,
          colorFilter: _tabBloc.selectedIndex == type.index
              ? ThemeHelper.textHighlight(context).toSvgColor
              : ThemeHelper.textPlaceHolder(context).toSvgColor,
        ),
      ),
      label: type.title,
    );
  }
}
