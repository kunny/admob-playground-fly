import 'package:admob_playground/destination.dart';
import 'package:flutter/material.dart';

const _interstitialAdUnitId = 'ca-app-pub-3940256099942544/8691691433';

class DestinationPage extends StatefulWidget {
  final Destination destination;

  const DestinationPage({
    required this.destination,
    super.key,
  });

  @override
  State createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  // TODO: Add an Interstitial ad instance

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          _tryShowAd();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.destination.name),
        ),
        body: ListView(
          children: [
            Image.asset(
              widget.destination.asset,
              package: 'flutter_gallery_assets',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: const Icon(Icons.flight),
              title: const Text('Duration'),
              subtitle: Text(widget.destination.duration),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(_content),
            ),
          ],
        ),
      ),
    );
  }

  void _loadAd() {
    // TODO: Load an interstitial ad

  }

  void _tryShowAd() {
    // TODO: Show an interstitial ad if available

  }
}

const _content = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula fringilla tristique. Pellentesque et est ipsum. Proin nec feugiat eros. Cras efficitur ultrices neque eu ultrices. Sed volutpat est arcu, et egestas erat congue a. Duis vitae sem condimentum, dapibus quam a, commodo nunc. Suspendisse viverra risus leo, id rutrum augue vulputate ac. In eleifend pulvinar neque a tempus. Nam lobortis augue eget mollis porttitor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse ut massa a mauris suscipit scelerisque non quis turpis. Etiam vel lacus sed diam blandit gravida. Aliquam a congue tortor. Pellentesque consequat nisl a viverra consectetur. Vestibulum porttitor pellentesque accumsan.

Mauris vulputate turpis justo, et iaculis est ornare id. Mauris non ligula at purus tincidunt pulvinar at ac massa. Donec neque quam, pretium sit amet metus eu, tincidunt mollis lacus. Sed vestibulum, odio vel cursus tristique, sapien turpis accumsan magna, quis eleifend tellus ipsum non massa. Sed tempus metus at augue lacinia, ac sollicitudin nulla commodo. Maecenas dapibus egestas elit, sit amet gravida nulla interdum ac. Nulla viverra placerat augue, vitae dictum arcu cursus ut. Vestibulum condimentum felis ut lacus accumsan, in interdum sapien blandit. Nunc ac neque accumsan, tempus elit ut, semper nunc. Maecenas id porttitor orci, sed dictum nisi.

Quisque eleifend libero nec leo elementum, nec mollis lectus condimentum. Curabitur eget ipsum vitae massa pulvinar finibus. Vestibulum quis tortor diam. Etiam et odio sed odio varius bibendum. Sed tristique, erat non elementum ullamcorper, risus felis ultricies nunc, vel eleifend ligula lacus ut ante. Vivamus eget feugiat augue. Aliquam pellentesque justo nec gravida convallis. Donec sodales condimentum nisi, et consequat tortor imperdiet non. Ut ante ex, faucibus pharetra ultricies eu, dapibus efficitur metus. Curabitur id consectetur nisl, ac ornare felis. Nulla nec erat sit amet odio fermentum dignissim eget ut libero.
''';
