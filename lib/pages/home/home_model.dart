import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? searchresult = true;

  bool? animation = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for search widget.
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  String? _searchControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    if (val.length < 3) {
      return 'I need more info';
    }
    if (val.length > 20) {
      return 'Please calm down i need only few words';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (TMDB)] action in Button widget.
  ApiCallResponse? movie;
  // Stores action output result for [Custom Action - getLanguageName] action in Row widget.
  String? language;
  // Stores action output result for [Custom Action - getYear] action in Row widget.
  String? relYear;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchControllerValidator = _searchControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    searchController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
