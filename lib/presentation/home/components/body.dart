import 'package:flutter/material.dart';
import 'package:smart_home_app/presentation/home/components/custom_header.dart';
import 'package:smart_home_app/utils/app_colors.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import 'temperature_humidity_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
        child: Padding(
            padding: padding10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(),
                const TemperatureHumidityWidget(temp: 23, humd: 43),
                Padding(
                    padding: padding30,
                    child: TabBar(
                      unselectedLabelColor: Colors.black.withOpacity(0.4),
                      labelColor: primaryColor,
                      tabs: const [
                        Tab(
                          text: 'Devices',
                        ),
                        Tab(
                          text: 'Rooms',
                        )
                      ],
                      controller: tabController!,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: primaryColor,
                      indicatorPadding: padding10,
                      labelPadding: EdgeInsets.zero,
                    )),
                Expanded(
                  child: TabBarView(
                    children: const [
                         DevicesGridView()
                      
                      
                       RoomsGridView(),
                    ],
                    controller: tabController,
                  ),
                ),
              ],
            )));
  }
}
