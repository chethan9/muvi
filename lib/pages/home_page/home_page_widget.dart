import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/listview/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    required this.movieselected,
    this.moviesearched,
  }) : super(key: key);

  final String? movieselected;
  final String? moviesearched;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.animation = false;
      });
      _model.searchresul = await OnethreeCall.call(
        tor: widget.movieselected,
      );
      if ((_model.searchresul?.succeeded ?? true)) {
        setState(() {
          _model.animation = true;
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('No result'),
              content: Text('Unable to find any valid links :('),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        setState(() {
          _model.animation = true;
        });
        context.safePop();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 125.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF00B894),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.arrow_circle_left_outlined,
                                color: Color(0xFFFDFDFD),
                                size: 50.0,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Back',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 25.0,
                                  ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 100.0, 0.0),
                              child: Text(
                                'Choose the desired quality below ⇩',
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 25.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_model.animation == false)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Lottie.asset(
                                  'assets/lottie_animations/lf30_fup2uejx.json',
                                  width: 150.0,
                                  height: 130.0,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              ),
                            ),
                          if (_model.animation == false)
                            Text(
                              'Hunting down the perfect links for ${widget.moviesearched}. Sit tight, it\'s loading!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                          if (_model.animation == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final childrens = OnethreeCall.data(
                                        (_model.searchresul?.jsonBody ?? ''),
                                      )?.toList() ??
                                      [];
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: childrens.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 4.0),
                                    itemBuilder: (context, childrensIndex) {
                                      final childrensItem =
                                          childrens[childrensIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'processing',
                                            queryParameters: {
                                              'processingmagnet':
                                                  serializeParam(
                                                getJsonField(
                                                  childrensItem,
                                                  r'''$..Magnet''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: ListviewWidget(
                                          key: Key(
                                              'Keycqc_${childrensIndex}_of_${childrens.length}'),
                                          title: getJsonField(
                                            childrensItem,
                                            r'''$..Title''',
                                          ),
                                          date: getJsonField(
                                            childrensItem,
                                            r'''$..year''',
                                          ),
                                          size: getJsonField(
                                            childrensItem,
                                            r'''$..Size''',
                                          ),
                                          quality: getJsonField(
                                            childrensItem,
                                            r'''$..quality''',
                                          ),
                                          uploaded: getJsonField(
                                            childrensItem,
                                            r'''$..Date''',
                                          ),
                                          seeds: getJsonField(
                                            childrensItem,
                                            r'''$..Seeds''',
                                          ),
                                          leeches: getJsonField(
                                            childrensItem,
                                            r'''$..Leeches''',
                                          ),
                                          resolution: getJsonField(
                                            childrensItem,
                                            r'''$..resolution''',
                                          ),
                                          audio: getJsonField(
                                            childrensItem,
                                            r'''$..audio''',
                                          ),
                                          language: getJsonField(
                                            childrensItem,
                                            r'''$..language''',
                                          ),
                                          codec: getJsonField(
                                            childrensItem,
                                            r'''$..codec''',
                                          ),
                                          subtitles: getJsonField(
                                            childrensItem,
                                            r'''$..subtitles''',
                                          ),
                                          provider: getJsonField(
                                            childrensItem,
                                            r'''$..group''',
                                          ),
                                          copy: getJsonField(
                                            childrensItem,
                                            r'''$..Magnet''',
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 50.0),
                            child: Text(
                              'Developed by HNC',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
