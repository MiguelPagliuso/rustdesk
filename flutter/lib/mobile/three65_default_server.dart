import 'package:flutter/foundation.dart';
import '../common.dart';
import '../models/platform_model.dart';

/// Provision the 365 Tecnologia rendezvous server on a fresh Android client.
/// A server already configured by the user is never overwritten.
Future<void> apply365DefaultServer() async {
  if (bind.mainGetOptionSync(key: 'custom-rendezvous-server').isNotEmpty) {
    return;
  }

  try {
    // Apply the credentials first; setting the host triggers the Android
    // rendezvous mediator to restart with the completed configuration.
    await bind.mainSetOption(
      key: 'key',
      value: 'O9Y9310ZN0IPaAdZsa73XTTIflVcOQA1E4Xb4VHQ1kQ=',
    );
    await bind.mainSetOption(
      key: 'relay-server',
      value: '365rust.ddns.net:21117',
    );
    await bind.mainSetOption(
      key: 'api-server',
      value: '',
    );
    await bind.mainSetOption(
      key: 'custom-rendezvous-server',
      value: '365rust.ddns.net',
    );
  } catch (error) {
    // Leave the host unset on failures so initialization can be retried.
    debugPrint('365 default server configuration failed: $error');
  }
}
