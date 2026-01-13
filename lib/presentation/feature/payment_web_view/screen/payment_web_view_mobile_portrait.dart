import 'package:domain/enum/redirect_page.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/feature/payment_web_view/payment_web_view_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewMobilePortrait extends StatefulWidget {
  final PaymentWebViewViewModel viewModel;
  final String checkoutUrl;
  final RedirectPage redirectUrl;
  const PaymentWebViewMobilePortrait({required this.viewModel, required this.checkoutUrl, required this.redirectUrl, super.key});

  @override
  State<StatefulWidget> createState() => PaymentWebViewMobilePortraitState();
}

class PaymentWebViewMobilePortraitState extends BaseUiState<PaymentWebViewMobilePortrait> {

  late final WebViewController _controller;
  bool _isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create the WebViewController instance.
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            // Optionally intercept certain URLs.
            // For example, if Stripe redirects to your success or cancel URL:
            if (request.url.contains('user') || request.url.contains('confirmed') ) {
              // Here you could parse the URL and update your app state accordingly.
             // Navigator.of(context).pop();
              if (widget.redirectUrl == RedirectPage.flightBookSuccess) {
                if (widget.viewModel.bookformViewModel != null) {
                  widget.viewModel.bookformViewModel!.nextStep();
                }
                Navigator.of(context).pop();
                return NavigationDecision.prevent;

              }

              widget.viewModel.navigateToBase();
              widget.viewModel.showSuccessMessage();
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (error) {
            // Log or display the error as needed.
            debugPrint("WebView error: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(controller: _controller),
              if (_isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
