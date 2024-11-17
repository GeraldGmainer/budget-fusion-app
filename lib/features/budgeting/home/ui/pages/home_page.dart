import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../home.dart';

class HomePage extends StatefulWidget {
  static const String route = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    context.read<BookingPeriodBloc>().add(BookingPeriodEvent.load(PeriodMode.month));
  }

  void _onBookingPeriodLoaded(BuildContext context, List<BookingPeriod> periods) {
    context.read<BookingViewBloc>().add(BookingViewEvent.load(ViewMode.chart, periods));
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldProvider = Provider.of<ScaffoldProvider>(context, listen: false);

    return ChangeNotifierProvider(
      create: (_) => LeftDrawerMenuState(),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('main.title', style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.kaushanScript().fontFamily)).tr(),
              Text("account.all_accounts", style: TextStyle(fontSize: 13, color: AppColors.secondaryTextColor)).tr(),
            ],
          ),
          leading: LeftDrawerButton(),
          actions: [RefreshButton(), RightDrawerButton()],
        ),
        primary: true,
        endDrawer: RightDrawer(),
        body: Builder(builder: (ctx) {
          scaffoldProvider.setScaffoldContext((ctx));
          return _buildPage(child: _buildPeriod());
        }),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TransferButton(),
            SizedBox(width: AppDimensions.horizontalPadding),
            CreateBookingButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required Widget child}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.verticalPadding, horizontal: AppDimensions.horizontalPadding),
          child: Column(
            children: [
              Expanded(child: child),
            ],
          ),
        ),
        LeftDrawer(),
      ],
    );
  }

  Widget _buildPeriod() {
    return BlocConsumer<BookingPeriodBloc, BookingPeriodState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (periods) {
            _onBookingPeriodLoaded(context, periods);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (accountGroups) => _buildView(),
          error: (error) => ErrorText(message: error, onReload: _load),
          orElse: () => LoadingIndicator(),
        );
      },
    );
  }

  Widget _buildView() {
    return BlocBuilder<BookingViewBloc, BookingViewState>(
      builder: (context, state) {
        return state.maybeWhen(
          chartLoaded: (charts) => ChartView(charts: charts),
          error: (error) => ErrorText(message: error, onReload: _load),
          orElse: () => LoadingIndicator(),
        );
      },
    );
  }
}
